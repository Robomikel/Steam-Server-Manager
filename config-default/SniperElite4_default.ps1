Function  New-LaunchScriptSE4serverPS {
    # Sniper Elite 4 Dedicated Server
    # APP ID # 568880
    # http://snipereliteadmin.com/#!/SE4DedicatedServerSetup  
    ################## Change Default Variables #################

    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    
    # Server.AuthPort 8701
    # Server.GamePort 24001
    # Server.UpdatePort 23001
    #Server.LobbyPort 25001
    
    
    ###################### Do not change below #####################
    #                           System Directory
    $global:systemdir           = "$serverdir"
    #                           Server Config Directory
    $global:servercfgdir        = "$serverdir"
    #                           Server Executable
    $global:executable          = "SniperElite4_Dedicated"
    #                           Server Executable Directory
    $global:executabledir       = "$serverdir\bin"
    #                           Gamedig Query
    $global:querytype           = "protocol-valve"
    #                           Game Process
    $global:process             = "SniperElite4_Dedicated"
    #                           Log Directory
    $global:logdirectory        = "$serverdir"
    #                           Server Log
    $global:consolelog                 = "dedicated_console.txt"
    #                           Game-Server-Config Directory
    $global:gamedirname         = ""
    #                           Game-Server-Config
    $global:servercfg           = "server.cfg"
    #                           Server Launch Command
    $global:launchParams        = '@("$executable exec $servercfgdir\Server.cfg -logdir=$serverdir")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Install Adjustment
    New-servercfgse4
}

Function New-servercfgse4 {
    New-Item $servercfgdir\Server.cfg -ItemType File -Force
    Add-Content $servercfgdir\Server.cfg `
"
Server.Name $hostname
//Server.Name Team Deathmatch - Map voting / Hardcore
Server.MoTD Welcome to Sniper Elite 4

Settings.MaxPlayers 12
Settings.MaxLatency 999

Settings.DefaultScoreLimit 0
Settings.DefaultTimeLimit 15

Lobby.StartTimer 90

// Allow players to vote on the next map...
Lobby.AutoTriggerMapVote 1
// ... but we still need to specify the initial map with the correct game mode
MapRotation.AddMap VILLAGE TDM
// Add the game settings
exec Preset_Hardcore.cfg

Server.GamePort 27102
Server.Host
"
}