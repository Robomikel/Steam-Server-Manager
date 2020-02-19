Function New-LaunchScriptArma3serverPS {
    #----------   Arma3 Ask for input for server cfg  -------------------
    # APP ID # 233780
    # requires https://www.microsoft.com/en-us/download/details.aspx?id=35 Direct x
    ################## Change Default Variables #################
    
    #                       Requieres Steam Login
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    # default reserved ports are 2302 - 2306 gameports must be N+100 ie 2402-2406  "
    #                       Server Port 
    $global:PORT            = "2302"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Maxplayers
    $global:MAXPLAYERS      = "32"
    #                       Server Password
    $global:SERVERPASSWORD  = ""
    #                       Admin Password
    $global:ADMINPASSWORD   = "$global:RANDOMPASSWORD"
    #                       Rcon Port
    $global:RCONPORT        = "2301"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    #                       Mods
    $global:mods            = ""
    # $mods                 ="Mods\1351712613;Mods\1355481562;Mods\1374639840;Mods\1439779114;Mods\333310405;Mods\450814997;Mods\463939057;Mods\549676314;Mods\773125288;Mods\773131200;Mods\843425103;Mods\843577117;Mods\843593391;Mods\497660133"
    #                       Server Mods
    $global:servermods      = ""
    
    ##############################/\##############################
    # Advanced Steam WorkShop Mods COnfiguration
    # WorkShop Mod Directory
    $global:WSMODDIR = "Mods"
    # steam appID for SE regular game (workshop content tied to this appID)
    $global:reg_appID = '107410'
    # list of mods to download and copy to server mod folder
    $global:wsmods = "@('450814997','463939057','773125288','773131200','843593391','1439779114','333310405','1374639840')"
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "arma3server"
    $global:EXEDIR = ""
    $global:GAME = "arma3"
    $global:PROCESS = "arma3Server"
    $global:SERVERCFGDIR = "cfg"
    $global:LOGDIR = "$global:currentdir\$global:server\SC"


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
    $global:launchParams = '@("$global:EXE -ip=${global:IP} -port=${global:PORT} -cfg=$global:currentdir\$global:server\$global:SERVERCFGDIR\network.cfg -config=$global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -mod=$global:mods -servermod=$global:servermods -bepath=$global:currentdir\$global:server\battleye\ -profiles=SC -name=SC -loadmissiontomemory")'

}