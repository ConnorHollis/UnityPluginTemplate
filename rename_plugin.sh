plugin_name=$1

if [ -z "$plugin_name" ]; then
	echo "No plugin name supplied to rename plugin script! It must be the first parameter."
	exit 1
fi

scripts_path="./Assets/Scripts"
template_name="UnityPluginTemplate"

runtime_asmdef_path="$scripts_path/Runtime/UnityPluginTemplate.Runtime.asmdef"
editor_asmdef_path="$scripts_path/Editor/UnityPluginTemplate.Editor.asmdef"

if [ -f "$runtime_asmdef_path" ]; then
	echo "Replacing template name: $template_name with new plugin name: $plugin_name in $runtime_asmdef_path"
	sed -i "s/$template_name/$plugin_name/" $runtime_asmdef_path

	echo "Renaming file: $runtime_asmdef_path to $scripts_path/Runtime/$plugin_name.Runtime.asmdef"
	mv "$runtime_asmdef_path" "$scripts_path/Runtime/$plugin_name.Runtime.asmdef"

	echo "Renaming file: $runtime_asmdef_path.meta to $scripts_path/Runtime/$plugin_name.Runtime.asmdef.meta"
	mv "$runtime_asmdef_path.meta" "$scripts_path/Runtime/$plugin_name.Runtime.asmdef.meta"
else
	echo "Cannot find the runtime asmdef at $runtime_asmdef_path"
fi

if [ -f "$editor_asmdef_path" ]; then
	echo "Replacing template name: $template_name with new plugin name: $plugin_name in $editor_asmdef_path"
	sed -i "s/$template_name/$plugin_name/" $editor_asmdef_path

	echo "Renaming file: $editor_asmdef_path to $scripts_path/Editor/$plugin_name.Editor.asmdef"
	mv "$editor_asmdef_path" "$scripts_path/Editor/$plugin_name.Editor.asmdef"

	echo "Renaming file: $editor_asmdef_path.meta to $scripts_path/Editor/$plugin_name.Editor.asmdef.meta"
	mv "$editor_asmdef_path.meta" "$scripts_path/Editor/$plugin_name.Editor.asmdef.meta"
else
	echo "Cannot find the editor asmdef at $editor_asmdef_path"
fi