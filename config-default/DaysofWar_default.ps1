Function New-LaunchScriptdowserverPS {
    # Days of War Dedicated Server
    # APP ID # 541790
    # Wiki
    ################## Change Default Variables #################

    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Map
    $global:defaultmap      = "dow_kaysersberg"

    ##############################/\##############################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\DaysOfWar\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "DaysOfWarServer-Win64-Shipping"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\DaysOfWar\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "DaysOfWarServer-Win64-Shipping"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\DaysOfWar\Saved\Logs"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "Game.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable ${defaultmap} -Port=${port} -QueryPort=${queryport} -LOG")'
} 