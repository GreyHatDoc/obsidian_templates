# Obsidian Templates

A collection of useful templates for [Obsidian](https://obsidian.md/) to help organize your notes, projects, meetings, and daily tasks. These templates are meant to be used in conjunction with [obsidian_plugins](https://github.com/GreyHatDoc/obsidian_plugins)

## Overview

This repository provides a set of ready-to-use Obsidian templates organized into different categories:

- **Learning** - Templates for taking learning notes and organizing study materials
- **Meetings** - Structured meeting notes with topics, action items, and due outs
- **Project** - Project planning, code documentation, and idea tracking templates
- **Tasks** - Daily task management with priority-based organization

## Installation

### Automated Installation

The repository includes installation scripts for both Linux/macOS and Windows:

#### Linux/macOS

```bash
./install_templates.sh -p /path/to/your/obsidian/vault
```

#### Windows (PowerShell)

```powershell
.\install_templates.ps1 -Path "C:\path\to\your\obsidian\vault"
```

### Installation Options

Both scripts support the following options:

- `-h, --help` - Show help message
- `-p, --path <vault_path>` - Path to your Obsidian vault (defaults to parent directory if not provided)
- `-f, --folder <folder_name>` - Install specific template folder(s) only (can specify multiple)
- `-n, --name <folder_name>` - Custom name for the destination template folder (default: "Templates")

#### Examples

Install all templates:
```bash
./install_templates.sh -p ~/Documents/MyVault
```

Install only Meeting and Tasks templates:
```bash
./install_templates.sh -p ~/Documents/MyVault -f Meetings -f Tasks
```

Install to a custom folder name:
```bash
./install_templates.sh -p ~/Documents/MyVault -n MyTemplates
```

### Manual Installation

1. Copy the `Templates` folder to your Obsidian vault
2. In Obsidian, go to Settings → Core plugins → Templates
3. Enable the Templates plugin
4. Set the template folder location to `Templates` (or your custom folder name)

## Template Descriptions

### Learning Templates

- **Learning Notes.md** - Structured template for taking learning notes with table of contents, links section, and hierarchical note organization

### Meeting Templates

- **Meeting template.md** - Meeting notes template including:
  - Meeting name/title
  - Topics to bring up
  - Due outs/action items
  - Notes section

### Project Templates

- **BuildTheBox.md** - Specialized project template
- **CodeFile template.md** - Template for documenting code files
- **Object template.md** - Template for documenting objects/classes
- **Project Ideas.md** - Brainstorming and idea tracking
- **Project plan.md** - Comprehensive project planning template with:
  - Project name and repository link
  - Description and goals
  - Prioritized task lists (High/Medium/Low)
  - Future enhancements section
- **ProjectPlan template.md** - Alternative project planning format

### Task Templates

- **Daily tasks.md** - Daily task management template with:
  - Date-stamped task list
  - A/B/C priority task sections
  - Notes section with table format
  - Backlog section

## Usage

After installation, you can access templates in Obsidian by:

1. Creating a new note
2. Opening the command palette (Ctrl/Cmd + P)
3. Searching for "Templates: Insert template"
4. Selecting the desired template

Or use the template button in the left sidebar (if configured).

## Contributing

Feel free to submit issues or pull requests if you have suggestions for new templates or improvements to existing ones.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Copyright (c) 2025 GreyHatDoc
