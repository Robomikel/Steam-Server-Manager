Function New-LaunchScriptDODSserverPS {
    #* * Add to Read-AppID in fn_Actions.ps1 * *
    # Day of Defeat Source Dedicated Server
    # APP ID # 232290
    # https://kb.firedaemon.com/support/solutions/articles/4000086944-day-of-defeat-source
    ################## Change Default Variables #################
    #                       Server IP 
    $global:ip              = "${ip}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Map
    $global:defaultmap      = "dod_Anzio"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    ##############################/\##############################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\dod\cfg"
    #                       Server Executable
    $global:executable      = "dods"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "dods"
    #                       Game Process
    $global:process         = "dods"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\dod"
    #                       Server Log
    $global:consolelog             = "console.log"  
    #                       Game-Server-Config Directory
    $global:gamedirname     = "DayOfDefeat"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -console -game dod -strictportbind +ip ${ip} -port ${port} +clientport ${clientport} +map ${defaultmap} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}