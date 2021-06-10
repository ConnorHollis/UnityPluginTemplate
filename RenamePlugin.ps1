param ($plugin_name)

if(!$plugin_name)
{
	Write-Host "You must supply a plugin name to rename this template to."
	return;
}

$scripts_path = ".\Assets\Scripts"
$template_name = "UnityPluginTemplate"

$runtime_asmdef_path = "$scripts_path\Runtime\UnityPluginTemplate.Runtime.asmdef"
$editor_asmdef_path = "$scripts_path\Editor\UnityPluginTemplate.Editor.asmdef"

if(Test-Path -Path $runtime_asmdef_path -PathType Leaf)
{
	Write-Host "Replacing template name: $template_name with new plugin name: $plugin_name in $runtime_asmdef_path"

	$runtime_asmdef_content = (Get-Content $runtime_asmdef_path)
	$runtime_asmdef_content -replace $template_name, $plugin_name | Out-File -encoding UTF8 $runtime_asmdef_path

	Write-Host "Renaming file: $runtime_asmdef_path to $scripts_path\Runtime\$plugin_name.Runtime.asmdef"
	Rename-Item "$runtime_asmdef_path" "$plugin_name.Runtime.asmdef"

	Write-Host "Renaming file: $runtime_asmdef_path.meta to $scripts_path\Runtime\$plugin_name.Runtime.asmdef.meta"
	Rename-Item "$runtime_asmdef_path.meta" "$plugin_name.Runtime.asmdef.meta"
}
else
{
	Write-Host "Cannot find the runtime asmdef at $runtime_asmdef_path"
}

if(Test-Path -Path $editor_asmdef_path -PathType Leaf)
{
	Write-Host "Replacing template name: $template_name with new plugin name: $plugin_name in $editor_asmdef_path"

	$editor_asmdef_content = (Get-Content $editor_asmdef_path)
	$editor_asmdef_content -replace $template_name, $plugin_name | Out-File -encoding UTF8 $editor_asmdef_path

	Write-Host "Renaming file: $editor_asmdef_path to $scripts_path\Editor\$plugin_name.Editor.asmdef"
	Rename-Item "$editor_asmdef_path" "$plugin_name.Editor.asmdef"

	Write-Host "Renaming file: $editor_asmdef_path.meta to $scripts_path\Editor\$plugin_name.Editor.asmdef.meta"
	Rename-Item "$editor_asmdef_path.meta" "$plugin_name.Editor.asmdef.meta"
}
else
{
	Write-Host "Cannot find the editor asmdef at $editor_asmdef_path"
}