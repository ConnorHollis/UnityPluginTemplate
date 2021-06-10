# UnityPluginTemplate
An example repository that can be cloned and renamed to then become a unity plugin included as a submodule in a primary unity project.

Intended usage:
1. Clone repository and provide a new name for it.
1. Run a rename script to generate a new plugin file.
1. Delete the rename scripts from your repository and update the readme.
1. Commit changes.

## Rename Scripts
I have provided two scripts to help in renaming a plugin once you have cloned this repository. The script edits and renames the files in place and thus does not leave the original file structure intact.

The scripts will update the name of the asmdef file and meta files as well as replace any references to UnityPluginTemplate  within each file to your provided new plugin name.

### Windows
RenamePlugin.ps1 [NewPluginName]

### Bash
rename_plugin.sh [NewPluginName]

