Function New-LaunchScriptTakedownPS {
    # Takedown: Red Sabre Dedicated Server
    # APP ID # 261020
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Map
    $global:defaultmap      = "TD05_Killhouse_AttDef"
    #                       Map Var
    $global:gametype        = "1"
    #                       Game Mode
    $global:gamemode        = "TDAttackAndDefendGame"
    #                       Maxplayers
    $global:maxplayers      = "12"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       SV_LAN
    $global:sv_lan          = "0"
    ##############################/\##############################
    # Gamemodes:
    # Team Deathmatch : TDTEAMDEATHMATCHGAME
    # Team Attack/Defend : TDATTACKANDDEFENDGAME
    # Last Man Standing : TDLASTMANSTANDING
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\TakedownGame\Config\"
    #                       Server Executable
    $global:executable      = "TakedownGameServer-Win32-Shipping"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Binaries\Win32\"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "TakedownGameServer-Win32-Shipping"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\TakedownGame\Logs"
    #                       Server Log
    $global:consolelog      = "Launch.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "TakedownGameServer"
    #                       Game-Server-Config
    $global:servercfg       = "PCServer-TakedownGame.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} ${defaultmap}?MapVar=${gametype}?game=takedowngame.${gamemode}?listen=1?bIsLanMatch=${sv_lan}?NumPublicConnections=${maxplayers}? -­multihome=${ip} ­-port=${port} -­QueryPort=${queryport} ­-configsubdir=${gamedirname}  -seekfreeloadingserver")'
    #                             ${executable} ${defaultmap}?MapVar=${gametype}?game=takedowngame.${gamemode}?listen=1?bIsLanMatch=${sv_lan}?NumPublicConnections=${maxplayers}? -­multihome=${ip} ­-port=${port} -­QueryPort=${queryport} ­-configsubdir=${gamedirname}  -seekfreeloadingserver
    # Get User Input version must be set to 0
    Get-UserInput
    Get-Infomessage "***  starting Server before Setting $servercfg Please Wait ***" 'info'
    # Set-Location $executabledir
    Start-process cmd -Args @("/c $executabledir\${executable} TD05_Killhouse_AttDef?MapVar=Var1?game=takedowngame.TDAttackAndDefendGame?listen=1?bIsLanMatch=0?NumPublicConnections=12? -seekfreeloadingserver") -NoNewWindow
    while (!(Get-Process $process -ea SilentlyContinue )) {
        Wait-process -Name $process -Timeout 45 >$null 2>&1
    }
    Get-Infomessage "***  stopping Server before Setting $servercfg Please Wait ***" 'info'
    Get-StopServer
    Set-Location $servercfgdir
    If (!$(Test-Path $servercfgdir\$gamedirname)){
    New-Item . -Name $gamedirname -ItemType Directory -Force
    Copy-Item "PCServer*.ini" $servercfgdir\$gamedirname -Recurse -Force
    Get-Infomessage "***  Editing Default Server Name $servercfg ***" 'info'
    }
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\TakedownGame\Config\$gamedirname"
    Set-Location $currentdir
} 