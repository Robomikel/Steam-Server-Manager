Function New-LaunchScriptDAserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Double Action Dedicated Server
    #      317800
    # http://www.doubleactiongame.com/serverguide
    ################## Change Default Variables #################
    #--->Default Vars
    #                       Server IP
    $global:ip              = "${ip}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    # $global:clientport      = "27005"
    #                       Source TV Port
    # $global:sourcetvport    = "27020"
    #                       Map
    $global:defaultmap      = "da_cocaine"
    #                       Maxplayers
    $global:maxplayers      = "24"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    #                       Game Server Token required for public servers
    $global:gslt            = "GameServerToken"
    ###########################/\#################################

    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "dab"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\dab\cfg"
    #                       Server Executable
    $global:executable      = "dab"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "dab"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\da_info"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    # Get User Input version must be set to 0
    Get-UserInput
    #                       Server Launch Command
    If ($gslt -ne "GameServerToken") {
        $global:launchParams    = '@("${executable} -game dab -console -usercon -strictportbind -ip ${ip} -port ${port} -maxplayers ${maxplayers} +hostname `"${hostname}`" +map ${defaultmap} +servercfgfile ${servercfg} -condebug")'
    } 
    Else {
        $global:launchParams    = '@("${executable} -game dab -console -usercon -strictportbind -ip ${ip} -port ${port} -maxplayers ${maxplayers} +hostname `"${hostname}`" +map ${defaultmap} +servercfgfile ${servercfg} +sv_setsteamaccount ${gslt} -condebug")'
    }
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}