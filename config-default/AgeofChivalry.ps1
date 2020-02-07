Function New-LaunchScriptAoCserverPS {
    # Age of Chivalry Dedicated Server
    # 17515
    $global:MODDIR = ""
    $global:EXE = "aoc"
    $global:EXEDIR = ""
    $global:GAME = "ageofchivalry"
    $global:SAVES = ""
    $global:PROCESS = "aoc"
    $global:SERVERCFGDIR = "ageofchivalry\cfg"
    $global:RCONPORT = "${global:PORT}"   
    Get-StopServerInstall
    $global:RCONPORT = "${global:PORT}"
    $global:gamedirname = "AgeOfChivalry"
    $global:config1 = "server.cfg"
    Get-Servercfg
    # - - - - - - - - - - - - -	
    Select-RenameSource
    if (($global:MAP = Read-Host -Prompt (Write-Host "Input Server Map,Press enter to accept default value [aoc_siege]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:MAP = "aoc_siege" }else { $global:MAP }
    if (($global:MAXPLAYERS = Read-Host -Prompt (Write-Host "Input Server Maxplayers, Press enter to accept default value [32]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:MAXPLAYERS = "32" }else { $global:MAXPLAYERS }
    Write-Host "Input Server local IP: " -ForegroundColor Cyan -NoNewline
    ${global:IP} = Read-Host
    if ((${global:PORT} = Read-Host -Prompt (Write-Host "Input Server Port,Press enter to accept default value [27015]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:PORT = "27015" }else { $global:PORT }
    Write-Host 'Input hostname: ' -ForegroundColor Cyan -NoNewline 
    $global:HOSTNAME = Read-host
    if (($global:RCONPASSWORD = Read-Host -Prompt (Write-Host "Input Server Rcon Password,Press enter to accept default value [$global:RANDOMPASSWORD]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:RCONPASSWORD = "$global:RANDOMPASSWORD" }else { $global:RCONPASSWORD }
    Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE -console -game ageofchivalry -secure +map ${global:MAP} -autoupdate +log on +maxplayers ${global:MAXPLAYERS} -port ${global:PORT} +ip ${global:IP} +exec server.cfg")'
}