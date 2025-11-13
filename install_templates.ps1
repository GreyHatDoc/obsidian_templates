param(
    [switch]$Help,
    [Alias("h")]
    [switch]$H,
    [string]$Path,
    [Alias("p")]
    [string]$P,
    [string[]]$Folder,
    [Alias("f")]
    [string[]]$F,
    [string]$Name = "Templates",
    [Alias("n")]
    [string]$N
)

# Handle aliases
if ($H) { $Help = $true }
if ($P) { $Path = $P }
if ($F) { $Folder += $F }
if ($N) { $Name = $N }

# Script variables
$SCRIPT_PATH = $PSScriptRoot
$ROOT_PATH = Resolve-Path (Join-Path $SCRIPT_PATH "..")
$TEMPLATES_PATH = Join-Path $SCRIPT_PATH "Templates"
$VAULT_PATH = ""
$TEMPLATE_FOLDER_NAME = $Name
$TEMPLATE_FOLDERS = @()
$CLEANUP = $false

function Show-Help {
    Write-Host "Usage: install_templates.ps1"
    Write-Host "Parameters:"
    Write-Host "  -Help, -h                    Show this help message"
    Write-Host ""
    Write-Host "  -Path, -p <vault_path>       Path to obsidian vault"
    Write-Host "                               If not provided, defaults to parent directory"
    Write-Host ""
    Write-Host "  -Folder, -f <folder_name>    Template folder(s) to install"
    Write-Host "                               Can specify multiple folders"
    
    if (Test-Path $TEMPLATES_PATH) {
        $folderList = Get-ChildItem $TEMPLATES_PATH -Directory | Select-Object -ExpandProperty Name
        Write-Host "                               Available folders: $($folderList -join ', ')"
    }
    Write-Host ""
    Write-Host "  -Name, -n <folder_name>      Name of destination template folder"
    Write-Host "                               Default: 'Templates'"
}

function New-TemplateFolder {
    Write-Host "Making template folder..."
    
    if (-not $VAULT_PATH) {
        Write-Host "Error: Vault path is not set."
        exit 1
    }
    
    if (-not (Test-Path $VAULT_PATH -PathType Container)) {
        Write-Host "Error: Vault path '$VAULT_PATH' does not exist or is not a directory."
        exit 1
    }
    
    $templateFolderPath = Join-Path $VAULT_PATH $TEMPLATE_FOLDER_NAME
    
    if (-not (Test-Path $templateFolderPath)) {
        New-Item -Path $templateFolderPath -ItemType Directory -Force | Out-Null
        Write-Host "Created template folder at '$templateFolderPath'."
    } else {
        Write-Host "Template folder '$templateFolderPath' already exists."
    }
}

function Install-Templates {
    Write-Host "Installing templates..."
    
    foreach ($folder in $TEMPLATE_FOLDERS) {
        $sourcePath = Join-Path $TEMPLATES_PATH $folder
        
        if (Test-Path $sourcePath -PathType Container) {
            $destinationPath = Join-Path $VAULT_PATH $TEMPLATE_FOLDER_NAME
            
            # Copy all items from source folder to destination
            $items = Get-ChildItem $sourcePath -Recurse
            foreach ($item in $items) {
                $relativePath = $item.FullName.Substring($sourcePath.Length + 1)
                $destPath = Join-Path $destinationPath $relativePath
                
                if ($item.PSIsContainer) {
                    if (-not (Test-Path $destPath)) {
                        New-Item -Path $destPath -ItemType Directory -Force | Out-Null
                    }
                } else {
                    $destDir = Split-Path $destPath -Parent
                    if (-not (Test-Path $destDir)) {
                        New-Item -Path $destDir -ItemType Directory -Force | Out-Null
                    }
                    Copy-Item $item.FullName $destPath -Force
                }
            }
            
            Write-Host "Installed templates from '$folder' to '$destinationPath'."
        } else {
            Write-Host "Warning: Template folder '$folder' does not exist in '$TEMPLATES_PATH'. Skipping."
        }
    }
}

function Invoke-Cleanup {
    Write-Host "Cleaning up..."
    $script:CLEANUP = $true
    
    # Remove this directory completely
    $ABS_FOLDER_PATH = Resolve-Path $SCRIPT_PATH
    Remove-Item -Path $ABS_FOLDER_PATH -Recurse -Force
    Write-Host "Removed installation script directory '$ABS_FOLDER_PATH'."
}

function Main {
    # Handle help
    if ($Help) {
        Show-Help
        exit 0
    }
    
    # Process folder arguments
    if ($Folder -and $Folder.Count -gt 0) {
        foreach ($folderName in $Folder) {
            if (Test-Path (Join-Path $TEMPLATES_PATH $folderName) -PathType Container) {
                $TEMPLATE_FOLDERS += $folderName
                Write-Host "Adding template folder '$folderName' to the list."
            } else {
                Write-Host "Error: Template folder '$folderName' does not exist, skipping..."
            }
        }
    }
    
    # Set default template folders if none specified
    if ($TEMPLATE_FOLDERS.Count -eq 0) {
        Write-Host "No template folders specified. Installing all available templates."
        if (Test-Path $TEMPLATES_PATH) {
            $TEMPLATE_FOLDERS = Get-ChildItem $TEMPLATES_PATH -Directory | Select-Object -ExpandProperty Name
        }
    }
    
    Write-Host "Template folders to install: $($TEMPLATE_FOLDERS -join ', ')"
    
    # Set vault path
    if (-not $Path) {
        $script:VAULT_PATH = $ROOT_PATH.Path
        Write-Host "No vault path specified. Defaulting to $VAULT_PATH"
    } else {
        $script:VAULT_PATH = Resolve-Path $Path -ErrorAction SilentlyContinue
        if (-not $VAULT_PATH) {
            $script:VAULT_PATH = $Path
        }
        Write-Host "Setting vault path to $VAULT_PATH"
    }
    
    Write-Host "Vault path: $VAULT_PATH"
    
    New-TemplateFolder
    Install-Templates
    
    if ($ROOT_PATH.Path -eq $VAULT_PATH) {
        Write-Host "Installing in vault path and will cleanup."
        Invoke-Cleanup
    } else {
        Write-Host "Current directory is not in vault path. Skipping cleanup."
    }
    
    Write-Host "Template installation complete."
}

# Run main function
Main

# Self-delete if cleanup was performed
if ($CLEANUP) {
    Start-Sleep -Milliseconds 100  # Brief delay to ensure script completion
    Remove-Item -Path $PSCommandPath -Force
}