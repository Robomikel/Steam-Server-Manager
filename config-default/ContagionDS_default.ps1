Function New-LaunchScriptContagionDSPS {
    #
    # Conatagion DS
    # APP ID # 	238430
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP 
    $global:ip              = "${ip}"
    #                       Server Port 
    $global:port            = "27015"
    #                       Server Map 
    $global:defaultmap      = "ce_montclair"
    #                       Max Players 
    $global:maxplayers      = "16"
    #                       SV_LAN
    $global:sv_lan          = "0"
    #                     Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    ##############################/\##############################
    
    ##################### Do not change below #####################
    #                       System Directory 
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\contagion\cfg"
    #                       Server Executable 
    $global:executable      = "contagionds"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "contagionds"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\contagion"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    # $global:launchParams    = '@("$executable -console -game bms -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +sv_setsteamaccount ${gslt} +map ${defaultmap} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    $global:launchParams    = '@("$executable -steam -game ".\contagion" -console -dedicated -maxplayers $maxplayers -ip $ip -port $port +map $defaultmap +servercfgfile server.cfg +sv_lan $sv_lan -condebug")'

    
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    # Select-RenameSource
    # contagionds.exe -steam -game ".\contagion" -console -dedicated -maxplayers X -ip <yourinternaliphere> -port <yourporthere> +map <mapnamehere> +sv_lan 0

    #Extraction:
    # cx_auroraestates
    # cx_barlowesquare
    
    
    #Escape:
    # ce_roanokepd
    # ce_barlowesquare
    # ce_montclair

    
    #Hunted:
    # ch_auroraestates
    # ch_pioneerexpress
    # ch_cypruspark
    # ch_barlowesquare
    
}