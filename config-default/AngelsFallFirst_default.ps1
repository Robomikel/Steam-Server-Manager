Function New-LaunchScriptAFFserverPS {
    # Angels Fall First Dedicated Server
    # https://steamcommunity.com/app/367270/discussions/0/481115363859382148/
    # APP ID # 	407480
    ################## Change Default Variables #################
    #                       Server IP
    ${global:ip}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Map
    $global:defaultmap      = "AFF-Ixion"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       number of players
    $global:numplayers      = "32"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Admin Password
    $global:adminpassword   = "$RANDOMPASSWORD"

    ##############################/\##############################
    #In the section [UTGame.UTGame] you can set up the server mapcycle by adding the line:
    #GameSpecificMapCycles=(GameClassName="AFFGameInfo",Maps=("AFF-Ixion","AFF-Irega"))

    #You can find the map file names simply by looking in the Angels Fall First\AFFGame\CookedPC\Maps directory, here are some examples:
    #---Ground maps ---
    #AFF-Errah
    #AFF-Errah-Territories
    #AFF-Fortress
    #AFF-Plains
    #AFF-Irega
    #AFF-Irega-Territories

    #---Space maps ---
    #AFF-Meudeverre
    #AFF-Meudeverre-Territories
    #AFF-Ixion
    #AFF-Ixion-Territories
    # -multihome=IP_ADDRESS -- Allows you to bind to a different IP address. (DO NOT USE unless you actually need it!)
    # -Port=#### -- Changes the port the server uses
    # -log=DIR_NAME\LOG_NAME.log -- Save log files into subdirectory DIR_NAME within the log directory
    # -configsubdir=DIR_NAME – Load config files from subdirectory DIR_NAME within the config directory
    #  NumPlay=<0-64> -- sets the minimum number of bodies that the game will be filled with. Basically if you set that to 16, the game will make sure there are always at least 8 people on each team. If there's not enough players to meet that requirement, bots will join the team
    # MaxPlayers=<2-64> -- sets how many players at most can join the game
    # BalanceBots=<true, false> -- adds bots to make the teams equal in size. Adds bots even above the NumPlay number if there are more players on the opposing team.
    # AILevel=<1-5> -- difficulty level of bots
    # BriefingTime=<0-99999...> -- sets the duration of the briefing phase (in seconds). 0 will skip the briefing phase entirely.
    # RandomCommander=<true, false> -- if set to true, skips the commander selection at the start of the match and automatically assigns command to milnet AI
    # RedStartingTickets=<10-99999...> -- tickets for the ULA team
    # BlueStartingTickets=<10-99999...> -- tickets for the AIA team
    # FriendlyFire<0-100> -- will enable a percentage of friendly fire. Warning, not tested much!
    ###################### Do not change below ##################### 
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\AFFGame\Config"   
    #                       Server Executable
    $global:executable      = "AFFGameServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "AFFGameServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\AFFGame\Logs"
    #                       Server Log
    $global:consolelog      = "Server.log"
    #                       Game-Server-Config
    $global:servercfg       = "PCServer-AFFGame.ini"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "SpaceServer"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} ${defaultmap}?GamePassword=${adminpassword}?numplay=${numplayers}?MaxPlayers=${maxplayers}?BalanceBots=true?briefingtime=60 -multihome=${ip} -Port=${port} -QueryPort=${queryport} -log=${logdirectory}\${consolelog} -configsubdir=${gamedirname} -seekfreeloadingserver")'
    #                            AFFGameServer.exe AFF-Ixion?GamePassword=superpassword?numplay=32?BalanceBots=true?briefingtime=60 -log=SpaceServer\server.log -configsubdir=SpaceServer -seekfreeloadingserver
    # Get User Input version must be set to 0
    Get-UserInput
    # Install Adjustment
    # Set-Location $servercfgdir
    # Get-ChildItem -Filter "LinuxServer-*.ini" -Recurse | Rename-Item -NewName { $_.name -replace 'LinuxServer', 'PCServer' } -Force
    
    Get-Infomessage "***  starting Server before Setting $servercfg Please Wait ***" 'info'
    Set-Location $executabledir
    Start-process cmd -Args @("/c ${executable} AFF-Ixion -seekfreeloadingserver") -NoNewWindow
    while (!(Get-Process $process -ea SilentlyContinue )) {
        Wait-process -Name $process -Timeout 45 >$null 2>&1
    }
    Get-Infomessage "***  stopping Server before Setting $servercfg Please Wait ***" 'info'
    Get-StopServer
    Set-Location $servercfgdir
    If (!$(Test-Path $servercfgdir\$gamedirname)){
    New-Item . -Name $gamedirname -ItemType Directory -Force
    Copy-Item "PCServer-*.ini" $servercfgdir\$gamedirname -Recurse -Force
    Get-Infomessage "***  Editing Default Server Name $servercfg ***" 'info'
    ((Get-Content -path $servercfgdir\$servercfg -Raw) -replace "\bServerName=AFF Server\b", "ServerName=$hostname") | Set-Content -Path $servercfgdir\$servercfg
    }   
    Set-Location $currentdir
}