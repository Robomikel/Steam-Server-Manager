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
    $global:port            = "2302"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Admin Password
    $global:adminpassword   = "$global:RANDOMPASSWORD"
    #                       Rcon Port
    $global:rconport        = "2301"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    #                       Mods
    $global:mods            = " "
    # $mods                 ="Mods\1351712613;Mods\1355481562;Mods\1374639840;Mods\1439779114;Mods\333310405;Mods\450814997;Mods\463939057;Mods\549676314;Mods\773125288;Mods\773131200;Mods\843425103;Mods\843577117;Mods\843593391;Mods\497660133"
    #                       Server Mods
    $global:servermods      = " "
    
    ##############################/\##############################
    # Advanced Steam WorkShop Mods COnfiguration
    #                       WorkShop Mod Directory
    $global:moddir        = "$serverfiles\Mods"
    #                       steam appID for SE regular game (workshop content tied to this appID)
    $global:reg_appID       = '107410'
    #                       list of mods to download and copy to server mod folder
    $global:wsmods          = "@('450814997','463939057','773125288','773131200','843593391','1439779114','333310405','1374639840')"
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "arma3server"
    $global:executabledir= ""
    $global:querytype = "arma3"
    $global:process = "arma3Server"
    $global:servercfgdir = "cfg"
    $global:logdir = "$currentdir\$serverfiles\SC"


    Get-StopServerInstall
    $global:gamedirname = "Arma3"
    $global:servercfg = "server.cfg"
    $global:config2 = "network.cfg"
    Get-Servercfg    
    Write-Host "***  Creating BEserver.cfg ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item $currentdir\$serverfiles\battleye\BEServer.cfg -Force
    Add-Content   $currentdir\$serverfiles\battleye\BEServer.cfg "RConPassword $RCONPASSWORD"
    Add-Content   $currentdir\$serverfiles\battleye\BEServer.cfg "RConIP 127.0.0.1"
    Add-Content   $currentdir\$serverfiles\battleye\BEServer.cfg "RConPort $RCONPORT"
    Select-EditSourceCFG
    ((Get-Content -path $currentdir\$serverfiles\$servercfgdir\server.cfg -Raw) -replace '\b32\b', "$maxplayers") | Set-Content -Path $currentdir\$serverfiles\$servercfgdir\server.cfg  
    ((Get-Content -path $currentdir\$serverfiles\$servercfgdir\server.cfg -Raw) -replace "\barma3pass\b", "$SERVERPASSWORD") | Set-Content -Path $currentdir\$serverfiles\$servercfgdir\server.cfg
    # -autoinit only for presistant missions
    $global:launchParams = '@("$executable -ip=${IP} -port=${port} -cfg=$currentdir\$serverfiles\$servercfgdir\network.cfg -config=$currentdir\$serverfiles\$servercfgdir\server.cfg -mod=$mods -servermod=$servermods -bepath=$currentdir\$serverfiles\battleye\ -profiles=SC -name=SC -loadmissiontomemory")'

}