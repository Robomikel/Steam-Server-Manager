Function New-LaunchScriptIslePS {
    # The Isle Dedicated Server
    # APP ID # 	412680
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "7778"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Map
    $global:defaultmap      = "/Game/TheIsle/Maps/Thenyaw_Island/Thenyaw_Island"
    #                       Maxplayers
    $global:maxplayers      = "70"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    # https://isle.fandom.com/wiki/The_Isle_Server_Settings_and_Configuration
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\TheIsle\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "TheIsleServer-Win64-Shipping"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\TheIsle\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "TheIsleServer-Win64-Shipping"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\TheIsle\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "TheIsle.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "Game.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} ${defaultmap}?MultiHome=${ip}?Port=${port}?QueryPort=${queryport}?MaxPlayers=${maxplayers}?game=Survival -log")'

    # start C:\TheIsleServer\TheIsleServer.exe /Game/TheIsle/Maps/Landscape3/Isle_V3?MultiHome=12.345.67.890?Port=7777?QueryPort=7777?MaxPlayers=100?game=Survival -log
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    Get-Infomessage " Creating Game.ini " 'info'
    New-Item $servercfgdir\Game.ini -Force
    Add-Content   $servercfgdir\Game.ini [/script/theisle.igamesession]
    Add-Content   $servercfgdir\Game.ini ServerName=$hostname
    Add-Content   $servercfgdir\Game.ini ServerPassword=$serverpassword
    Add-Content   $servercfgdir\Game.ini ServerSteamGroup=
    Add-Content   $servercfgdir\Game.ini ServerMOTD=
    Add-Content   $servercfgdir\Game.ini bFamilySharing=false
    Add-Content   $servercfgdir\Game.ini bServerDatabase=true
    Add-Content   $servercfgdir\Game.ini bServerAllowChat=true
    Add-Content   $servercfgdir\Game.ini bServerGlobalChat=true
    Add-Content   $servercfgdir\Game.ini bServerNameTags=true
    Add-Content   $servercfgdir\Game.ini bServerExperimental=false
    Add-Content   $servercfgdir\Game.ini bServerBattleye=true
    Add-Content   $servercfgdir\Game.ini bServerAI=true
    Add-Content   $servercfgdir\Game.ini ServerAIMax=100
    Add-Content   $servercfgdir\Game.ini ServerAIRate=50.0
    Add-Content   $servercfgdir\Game.ini bServerAIPlayerSpawns=true
    Add-Content   $servercfgdir\Game.ini bServerGrowth=false
    Add-Content   $servercfgdir\Game.ini bServerNesting=true
    Add-Content   $servercfgdir\Game.ini bServerScent=false
    Add-Content   $servercfgdir\Game.ini bServerAllowTurnInPlace=true
    Add-Content   $servercfgdir\Game.ini ServerDeadBodyTime=0
    Add-Content   $servercfgdir\Game.ini ServerRespawnTime=10
    Add-Content   $servercfgdir\Game.ini ServerLogoutTime=10
    Add-Content   $servercfgdir\Game.ini "; Discord Invite link eg ServerDiscord=0lGZKDGlkAu0fHGl"
    Add-Content   $servercfgdir\Game.ini ServerDiscord=xxx
    Add-Content   $servercfgdir\Game.ini ServerAdmins=123
    Add-Content   $servercfgdir\Game.ini ServerAdmins=456
    Add-Content   $servercfgdir\Game.ini " "
    Add-Content   $servercfgdir\Game.ini [/script/theisle.igamemode]
    Add-Content   $servercfgdir\Game.ini "; Dinosaur Overrides"
    Add-Content   $servercfgdir\Game.ini ";ProgressionOverrides=(Row=`"Austro`",Points=10)"
    Add-Content   $servercfgdir\Game.ini ";ProgressionOverrides=(Row=`"TRex`",Points=20)"
    Add-Content   $servercfgdir\Game.ini " "
    Add-Content   $servercfgdir\Game.ini "; Time of Day / Weather Settings"
    Add-Content   $servercfgdir\Game.ini ServerStartingTime=1350
    Add-Content   $servercfgdir\Game.ini bServerDynamicTimeOfDay=0
    Add-Content   $servercfgdir\Game.ini ServerDayLength=20
    Add-Content   $servercfgdir\Game.ini " "
    Add-Content   $servercfgdir\Game.ini "; Supported Database Types: (None, SQLite, MariaDB)"
    Add-Content   $servercfgdir\Game.ini ";DatabaseType=SQLite"
    Add-Content   $servercfgdir\Game.ini ";DatabaseHost=127.0.0.127"
    Add-Content   $servercfgdir\Game.ini ";DatabasePort=3306"
    Add-Content   $servercfgdir\Game.ini ";DatabaseUser=root"
    Add-Content   $servercfgdir\Game.ini ";DatabasePass="
} 
