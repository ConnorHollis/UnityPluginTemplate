param ($pluginname)

(Get-Content ".\UnityPluginTemplate\Assets\Scripts\Runtime\UnityPluginTemplate.Runtime.asmdef") -replace 'UnityPluginTemplate', $pluginname | Out-File -encoding UTF8 ".\UnityPluginTemplate\Assets\Scripts\Runtime\UnityPluginTemplate.Runtime.asmdef"
(Get-Content ".\UnityPluginTemplate\Assets\Scripts\Editor\UnityPluginTemplate.Editor.asmdef") -replace 'UnityPluginTemplate', $pluginname | Out-File -encoding UTF8 ".\UnityPluginTemplate\Assets\Scripts\Editor\UnityPluginTemplate.Editor.asmdef"

Rename-Item ".\UnityPluginTemplate\Assets\Scripts\Runtime\UnityPluginTemplate.Runtime.asmdef" "$pluginname.Runtime.asmdef"
Rename-Item ".\UnityPluginTemplate\Assets\Scripts\Runtime\UnityPluginTemplate.Runtime.asmdef.meta" "$pluginname.Runtime.asmdef.meta"
Rename-Item ".\UnityPluginTemplate\Assets\Scripts\Editor\UnityPluginTemplate.Editor.asmdef" "$pluginname.Editor.asmdef"
Rename-Item ".\UnityPluginTemplate\Assets\Scripts\Editor\UnityPluginTemplate.Editor.asmdef.meta" "$pluginname.Editor.asmdef.meta"

Rename-Item ".\UnityPluginTemplate" ".\$pluginname"