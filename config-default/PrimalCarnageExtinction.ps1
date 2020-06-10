Function New-LaunchScriptPrimalCarnagePS {
    # Primal Carnage: Extinction Dedicated Server
    # APP ID # 336400   
    # https://steamcommunity.com/app/321360/discussions/1/494631967655276683/
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    #                       Map
    $global:defaultmap      = "PC-Docks"
    #                       Maxplayers
    $global:maxplayers      = "18"
    #                       Server Password
    $global:serverpassword  = ""
    ##############################/\##############################
    # 7777-7778 (this is for primal) to TCP and UDP both.
    # 27015-27016 (this is for steam) UDP AND TCP.
     #15000-15500 to UDP and TCP
    
    #  UDP    0.0.0.0:7777           *:*
    # [PrimalCarnageServer.exe]
    #  UDP    0.0.0.0:13000          *:*
    #  [PrimalCarnageServer.exe]
    # UDP    0.0.0.0:13650          *:*
    # [PrimalCarnageServer.exe]
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\PrimalCarnageGame\Config"
    #                       Server Executable
    $global:executable      = "PrimalCarnageServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "PrimalCarnageServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\PrimalCarnageGame\Logs"
    #                       Server Log
    $global:consolelog      = "Launch.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "DefaultGame.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} ${defaultmap}?game=PrimalCarnageGame.PCTeamDeathMatchGame?MaxPlayers=${maxplayers}?NumPublicConnections=${maxplayers}?MaxSpectators=0?TimeLimit=30?AdminPassword=${rconpassword}?GamePassword=${serverpassword}?bIsLanMatch=false?MatchTimeLimit=0?MatchScoreTarget=2?RoundTimeLimit=480?RoundScoreTarget=50?BalanceTeams=false?bIsDedicated=true -seekfreeloadingserver")'
    # Get User Input version must be set to 0
    Get-UserInput
} 