Function New-LaunchScriptArma3serverPS {
    #----------   Arma3 Ask for input for server cfg  -------------------
    # APP ID # 233780
    # requires https://www.microsoft.com/en-us/download/details.aspx?id=35 Direct x
    $global:MODDIR = ""
    $global:EXE = "arma3server"
    $global:EXEDIR = ""
    $global:GAME = "arma3"
    $global:PROCESS = "arma3Server"
    $global:SERVERCFGDIR = "cfg"
    Get-StopServerInstall
    $global:gamedirname = "Arma3"
    $global:config1 = "server.cfg"
    $global:config2 = "network.cfg"
    Get-Servercfg
    # - - - - - - - - - - - - -     
    Write-Host '*** Configure Instance *****' -ForegroundColor Yellow -BackgroundColor Black
    Write-Host "Input Server local IP: " -ForegroundColor Cyan -NoNewline
    ${global:IP} = Read-Host
    Write-Host "       default reserved ports are 2302 - 2306
                    gameports must be N+100
                    ie 2402-2406  " -ForegroundColor Yellow
    if (($global:PORT = Read-Host -Prompt (Write-Host "Input Server Port, Press enter to accept default value [2302]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:PORT = "2302" }else { $global:PORT }
    Write-Host 'Input hostname: ' -ForegroundColor Cyan -NoNewline 
    $global:HOSTNAME = Read-host
    Write-Host 'Input maxplayers: ' -ForegroundColor Cyan -NoNewline
    $global:MAXPLAYERS = Read-host
    if (($global:SERVERPASSWORD = Read-Host -Prompt (Write-Host "Input Server Password, Press enter to accept default value []: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:SERVERPASSWORD = "" }else { $global:SERVERPASSWORD }
    if (($global:ADMINPASSWORD = Read-Host -Prompt (Write-Host "Input ADMIN password Alpha Numeric:, Press enter to accept Random String value [$global:RANDOMPASSWORD]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:ADMINPASSWORD = "$global:RANDOMPASSWORD" }else { $global:ADMINPASSWORD }
    if (($global:RCONPORT = Read-Host -Prompt (Write-Host "Input Server Rcon Port,Press enter to accept default value [2301]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:RCONPORT = "2301" }else { $global:RCONPORT }
    if (($global:RCONPASSWORD = Read-Host -Prompt (Write-Host "Input RCON password Alpha Numeric:, Press enter to accept Random String value [$global:RANDOMPASSWORD]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:RCONPASSWORD = "$global:RANDOMPASSWORD" }else { $global:RCONPASSWORD }
    Write-Host "***  Creating BEserver.cfg ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item $global:currentdir\$global:server\battleye\BEServer.cfg -Force
    Add-Content   $global:currentdir\$global:server\battleye\BEServer.cfg "RConPassword $global:RCONPASSWORD"
    Add-Content   $global:currentdir\$global:server\battleye\BEServer.cfg "RConIP 127.0.0.1"
    Add-Content   $global:currentdir\$global:server\battleye\BEServer.cfg "RConPort $global:RCONPORT"
    Select-EditSourceCFG
    ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace '\b32\b', "$global:MAXPLAYERS") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg  
    ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "\barma3pass\b", "$global:SERVERPASSWORD") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
    # -autoinit only for presistant missions
    $global:launchParams = '@("$global:EXE -ip=${global:IP} -port=${global:PORT} -cfg=$global:currentdir\$global:server\$global:SERVERCFGDIR\network.cfg -config=$global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -mod= -servermod= -bepath=$global:currentdir\$global:server\battleye\ -profiles=SC -name=SC -loadmissiontomemory")'

}