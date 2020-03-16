Function New-LaunchScriptCaspaServerPS {
    # Capsa Dedicated Server
    # APP ID # 667230
    # https://steamcommunity.com/sharedfiles/filedetails/?id=1178788612
    ################## Change Default Variables #################

    ##############################/\##############################
    # 27014-27015/UDP
    # \Capsa\Saved\Config\WindowsServer\game.ini

    # [Server]
    # ServerName=MyFirstCapsaServer
    # MaxPlayers=64
    # AdminSteamID=0
    # FriendsOnly=False
    # GroupOnly=False
    # GroupSteamID=0
    # DayNightCycle=True
    # TimeOfDay=1130
    # DayLength=240
    # CountryCode=GB
    # WelcomeMessage=Welcome to Capsa
    # DynamicCloudDensity=True
    # CloudDensity=0
    
    
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\Capsa\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "CapsaServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "CapsaServer-Win64-Shipping"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\Capsa\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "Capsa.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "Capsa"
    #                       Game-Server-Config
    $global:servercfg       = "Game.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable")'
    # Get User Input version must be set to 0
    Get-UserInput
} 