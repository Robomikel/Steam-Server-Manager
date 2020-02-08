Function New-LaunchScriptArma3serverPS {
    #----------   Arma3 Ask for input for server cfg  -------------------
    # APP ID # 233780
    # requires https://www.microsoft.com/en-us/download/details.aspx?id=35 Direct x
     # - - - - - - - - - Change Default Variables ------------
     ${global:IP} = "${global:IP}"
     # default reserved ports are 2302 - 2306 gameports must be N+100 ie 2402-2406  " 
     $global:PORT ="2302"
     $global:HOSTNAME = "$env:USERNAME"
     $global:MAXPLAYERS = "32"
     $global:SERVERPASSWORD = ""
     $global:ADMINPASSWORD = "$global:RANDOMPASSWORD"
     $global:RCONPORT = "2301"
     $global:RCONPASSWORD = "$global:RCONPASSWORD"
     # - - - - - - - Do not change below - - - - - - - - -
    $global:MODDIR = ""
    $global:EXE = "arma3server"
    $global:EXEDIR = ""
    $global:GAME = "arma3"
    $global:PROCESS = "arma3Server"
    $global:SERVERCFGDIR = "cfg"
    $global:ANON = "no"
    $global:username = ""
    Get-StopServerInstall
    $global:gamedirname = "Arma3"
    $global:config1 = "server.cfg"
    $global:config2 = "network.cfg"
    Get-Servercfg    
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