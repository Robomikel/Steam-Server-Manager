Function New-LaunchScriptforestserverPS {
    # The forest dedciated Server
    # 556450
    $global:MODDIR = ""
    $global:EXE = "TheForestDedicatedServer"
    $global:EXEDIR = ""
    $global:GAME = "forrest"
    $global:PROCESS = "TheForestDedicatedServer"
    $global:SERVERCFGDIR = "SKS\TheForestDedicatedServer\ds"
    Get-StopServerInstall  
    # 556450
    $global:IP = ${global:IP}
    Write-Host "Input Server local IP: " -ForegroundColor Cyan -NoNewline
    ${global:IP} = Read-Host
    Write-Host 'Input server hostname: ' -ForegroundColor Cyan -NoNewline
    $global:HOSTNAME = Read-host
    #if((${global:IP} = Read-Host -Prompt (Write-Host "Input Server Port,Press enter to accept default value [$global:IP]: "-ForegroundColor Cyan -NoNewline)) -eq ''){${global:IP}="$global:IP"}else{$global:IP}
    if (($global:STEAMPORT = Read-Host -Prompt (Write-Host "Input Server Port,Press enter to accept default value [8766]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:STEAMPORT = "8766" }else { $global:STEAMPORT }
    if (($global:PORT = Read-Host -Prompt (Write-Host "Input Server Port,Press enter to accept default value [27015]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:PORT = "27015" }else { $global:PORT }
    if (($global:QUERYPORT = Read-Host -Prompt  (Write-Host "Input Server Query Port, Press enter to accept default value [27016]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:QUERYPORT = "27016" }else { $global:QUERYPORT }
    if (($global:MAXPLAYERS = Read-Host -Prompt (Write-Host "Input Server Maxplayers, Press enter to accept default value [8]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:MAXPLAYERS = "8" }else { $global:MAXPLAYERS }
    #-serverip xxx.xxx.xxx.xxx -serversteamport 8766 -servergameport 27015 -serverqueryport 27016 -servername TheForestGameDS -serverplayers 8 -difficulty Normal -inittype Continue -slot 1
    $global:launchParams = '@("$global:EXE -serverip ${global:IP} -serversteamport ${global:STEAMPORT} -servergameport ${global:PORT} -serverqueryport ${global:QUERYPORT} -servername `"${global:HOSTNAME}`" -serverplayers ${global:MAXPLAYERS} -difficulty Normal -configfilepath $global:currentdir\$global:server\SKS\TheForestDedicatedServer\ds\server.cfg -inittype Continue -slot 4 -batchmode -nographics")'
}s