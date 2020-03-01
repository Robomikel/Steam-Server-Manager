Function New-LaunchScriptAoCserverPS {
    # Age of Chivalry Dedicated Server
    # 17515
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    ${global:port}          = "27015"
    #                       Map
    $global:defaultmap      = "aoc_siege"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    ##############################/\##############################
    ###################### Do not change below ###################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\ageofchivalry\cfg"
    #                       Server Executable
    $global:executable      = "aoc"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "ageofchivalry"
    #                       Game Process
    $global:process         = "aoc"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\ageofchivalry"
    #                       Game-Server-Config Directory 
    $global:gamedirname     = "AgeOfChivalry"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"    
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -console -game ageofchivalry -secure +map ${defaultmap} -autoupdate +log on +maxplayers ${maxplayers} -port ${port} +ip ${ip} +exec server.cfg -condebug")'
      # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-RenameSource
    # Rename Source $executable.exe
    Select-EditSourceCFG
}