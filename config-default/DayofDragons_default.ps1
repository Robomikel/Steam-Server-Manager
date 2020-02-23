Function New-LaunchScriptDofDserverPS {
    # Day of Dragons - Dedicated Server
    # APP ID # 1088320
    # https://survivalservers.com/wiki/index.php?title=How_to_Create_a_Day_of_Dragons_Server_Guide
    ################## Change Default Variables #################

    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    # Add an incoming rule to your Windows Firewall 
    # to allow UDP port 27015 as well as 27016, and 7777
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = ""
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\Dragons\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "DragonsServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "DragonsServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "Game.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -SteamServerName=`"${hostname}`" -log")'
} 