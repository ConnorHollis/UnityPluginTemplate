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


## About VSTU folder generation
Traditionally when you add a plugin in Unity that contains code all of that code is all placed into the root of the plugin module when opening a visual studio solution for the parent project.

This is done regardless of the actual file structure of the files on the disk.

A plugin module that looked like the following
\ UnitySubmodule.Runtime
&nbsp;&nbsp;&nbsp;&nbsp;\ ScriptA.cs
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\ Folder1
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\ ScriptB.cs
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\ Folder2
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\ ScriptC.cs

Would appear as the following when in the consumer project's solution.
\ Parent Project
&nbsp;&nbsp;&nbsp;&nbsp;\ Assets
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\ Scripts
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\ SomeScriptFile.cs
\ UnitySubmodule.Runtime
&nbsp;&nbsp;&nbsp;&nbsp;\ ScriptA.cs
&nbsp;&nbsp;&nbsp;&nbsp;\ ScriptB.cs
&nbsp;&nbsp;&nbsp;&nbsp;\ ScriptC.cs

In this template I have included an asset post processor in the editor module that aughments the VSTU project generation to add path information to each script that is included in the project.

That script is located at Assets\Scripts\Editor\CodeGen\VSTUFolders.cs

You only need to include this file once so make sure to remove it from any subsequent projects if you have more than one plugin using this template. If you prefer the other method of script layout you can remove this file from any plugin you create from this template.