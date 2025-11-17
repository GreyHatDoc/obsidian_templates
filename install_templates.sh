#!/bin/bash

FOLDER_PATH=$(dirname "$0")
ROOT_PATH=$(realpath "$FOLDER_PATH/..")
TEMPLATES_PATH="$FOLDER_PATH/Templates"
VAULT_PATH=""
TEMPLATE_FOLDER_NAME="Templates"
TEMPLATE_FOLDERS=()
CLEANUP=0
KEEP_EXISTING=0

function parse_arguments() {
    echo "Parsing arguments..."
    args=("$@")
    counter=0
    while [ $counter -lt ${#args[@]} ]; do
        case ${args[$counter]} in
            --help|-h)
                echo "Usage: install_templates.sh [--help|-h]"
                help
                exit 0
                ;;
            --path|-p)
                if [ -z "${args[$((counter + 1))]}" ] || [[ "${args[$((counter + 1))]}" =~ ^- ]]; then
                #Install to default path in parent directory and cleanup
                    VAULT_PATH=$(realpath ${FOLDER_PATH}/../)
                    echo "No path provided. Defaulting to $VAULT_PATH"
                else
                    VAULT_PATH=$(realpath "${args[$((counter + 1))]}")
                    echo "Setting vault path to $VAULT_PATH"
                    ((counter++))
                fi
                ;;
            --folder|-f)
                if [ -z "${args[$((counter + 1))]}" ] || [[ "${args[$((counter + 1))]}" =~ ^- ]]; then
                    echo "Error: No folder name provided."
                    exit 1
                else
                    TEMPLATE_FOLDER_CHECK=$(ls $TEMPLATES_PATH | grep -w "${args[$((counter + 1))]}")

                    if [ -z "$TEMPLATE_FOLDER_CHECK" ]; then
                        echo "Error: Template folder '${args[$((counter + 1))]}' does not exist, skipping..."
                    else
                        TEMPLATE_FOLDERS+=("${args[$((counter + 1))]}")
                        echo "Adding template folder ${args[$((counter + 1))]} to the list."
                        ((counter++))
                    fi
                fi
                ;;
            --name|-n)
                if [ -z "${args[$((counter + 1))]}" ] || [[ "${args[$((counter + 1))]}" =~ ^- ]]; then
                    echo "Error: No template folder name provided, skipping..."
                else
                    TEMPLATE_FOLDER_NAME="${args[$((counter + 1))]}"
                    echo "Setting template folder name to $TEMPLATE_FOLDER_NAME"
                    ((counter++))
                fi
                ;;
            --keep|-k)
                KEEP_EXISTING=1
                echo "Setting to keep existing templates if they exist."
                ;;
            *)
                echo "Unknown argument: ${args[$counter]}, ignoring..."
                ;;
        esac
        ((counter++))
    done

}

function make_template_folder() {
echo "Making template folder..."
if [ -z "$VAULT_PATH" ]; then
    echo "Error: Vault path is not set."
    exit 1
fi
if [ ! -d "$VAULT_PATH" ]; then
    echo "Error: Vault path '$VAULT_PATH' does not exist or is not a directory."
    exit 1
fi
if [ ! -d "$VAULT_PATH/$TEMPLATE_FOLDER_NAME" ]; then
    mkdir -p "$VAULT_PATH/$TEMPLATE_FOLDER_NAME"
    echo "Created template folder at '$VAULT_PATH/$TEMPLATE_FOLDER_NAME'."
else
    echo "Template folder '$VAULT_PATH/$TEMPLATE_FOLDER_NAME' already exists."
fi
}


function install_templates() {
echo "Installing templates..."
for folder in "${TEMPLATE_FOLDERS[@]}"; do
    if [ -d "$TEMPLATES_PATH/$folder" ]; then
        if [ $KEEP_EXISTING -eq 0 ]; then
            echo "Overwriting existing templates in '$VAULT_PATH/$TEMPLATE_FOLDER_NAME/'."
            cp -r -f "$TEMPLATES_PATH/$folder/"* "$VAULT_PATH/$TEMPLATE_FOLDER_NAME/"
        else
            echo "Keeping existing templates in '$VAULT_PATH/$TEMPLATE_FOLDER_NAME/'."
            cp -r -n "$TEMPLATES_PATH/$folder/"* "$VAULT_PATH/$TEMPLATE_FOLDER_NAME/"
        fi
        
        echo "Installed templates from '$folder' to '$VAULT_PATH/$TEMPLATE_FOLDER_NAME/'."
    else
        echo "Warning: Template folder '$folder' does not exist in '$TEMPLATES_PATH'. Skipping."
    fi
done
}

function cleanup() {
echo "Cleaning up..."
CLEANUP=1
# Remove this directory completely
ABS_FOLDER_PATH=$(realpath "$FOLDER_PATH")
rm -rf "$ABS_FOLDER_PATH"
echo "Removed installation script directory '$ABS_FOLDER_PATH'."
}

function main() {
    if [ ${#TEMPLATE_FOLDERS[@]} -eq 0 ]; then
        echo "No template folders specified. Installing all available templates."
        TEMPLATE_FOLDERS=($(ls $TEMPLATES_PATH))
    fi
    echo "Template folders to install: ${TEMPLATE_FOLDERS[*]}"
    if [ -z "$VAULT_PATH" ]; then
        VAULT_PATH=$(realpath ${FOLDER_PATH}/../)
        echo "No vault path specified. Defaulting to $VAULT_PATH"
    fi
    echo "Vault path: $VAULT_PATH"
    make_template_folder
    install_templates
    if [[ $ROOT_PATH == $VAULT_PATH ]]; then
        echo "Installing in vault path and will cleanup."
        cleanup
    else
        echo "Current directory is not in vault path. Skipping cleanup."
    fi
    echo "Template installation complete."
}

function help() {
    echo "Usage: install_templates.sh"
    echo "Flags: "
    echo -e "[--help|-h]\n"
    echo "[--path|-p <path to obsidian vault>]"
    echo "Description: Installs templates into the Template folder in the specified location."
    echo -e "If no path is provided, defaults to $(realpath ${FOLDER_PATH}/../)\n"
    echo "[-f| --folder <folder name>]"
    echo "Specifies the template folder to use."
    echo "Can have one or more folders separated by -f or --folder flags."
    FOLDER_LIST=$(ls $TEMPLATES_PATH)
    echo -e "Available template folders: \n$FOLDER_LIST\n"
    echo "[-n| --name <template folder name>]"
    echo "Specifies the name of the folder that the templates will be installed into."
    echo "If not provided, defaults to 'Templates'"
    echo -e "[-k | --keep]\n"
    echo "Keep the existing templates if they exist. By default, the script will overwrite existing templates."

}

parse_arguments "$@"
main
if [ $CLEANUP -eq 1 ]; then
    rm -- "$0"
    exit 0
fi