Function New-LaunchScriptpzserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Project Zomboid Dedicated Server
    # APP ID # 380870
    # WIKI
        ################## Change Default Variables #################
    #                         Server IP 
    ${global:IP}              = "${ip}"
    #                         Server Name
    $global:hostname          = "SERVERNAME"
    #                         Rcon Password
    ${global:adminpassword}   = "$RANDOMPASSWORD"
    

    ##############################/\##############################
    
    
    # Port/s 16261+1 per player
    
    ###################### Do not change below #####################  
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$env:userprofile\Zomboid\Server"
    #                       Server Executable
    $global:executable      = "ProjectZomboid64"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "ProjectZomboid64"
    #                       Log Directory
    $global:logdirectory    = "$env:userprofile\Zomboid"
    #                       Server Log
    $global:consolelog      = "server-console.txt"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "ProjectZomboid"
    #                       Game-Server-Config
    $global:servercfg       = "server.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -ip ${ip} -adminpassword `"${adminpassword}`" -servername `"${hostname}`"")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Rename Source $executable.exe
    Select-RenameSource
}