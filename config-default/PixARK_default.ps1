Function New-LaunchScriptPixArkPS {
    # PixARK Dedicated Server
    # APP ID # 824360
    # https://pixark.gamepedia.com/Server_configuration
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "27015"
    #                       Query Port
    $global:queryport       = "27016"
    #                       Cube Port
    $global:clientport       = "27018"
    #                       Rcon Port
    $global:rconport        = "27017"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    #                       Map
    $global:defaultmap      = "CubeWorld_Light"
    #                       Maxplayers
    $global:maxplayers      = "20"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Server Password
    $global:serverpassword  = ""
    #                       World and Ore Seed
    $global:seed            = "$global:RANDOMSEED"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\ShooterGame\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "PixARKServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\ShooterGame\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "PixARKServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\ShooterGame\Saved\Logs"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "GameUserSettings.ini"
    #                       Server Launch Command    
    $global:launchParams    = '@("$executable ${defaultmap}?DelayRegisterServer=True?bRawSockets=True?SessionName=`"${hostname}`"?AltSaveDirectoryName=Trevoria?ServerPassword=${serverpassword}?ServerAdminPassword=${rconpassword}?MaxPlayers=${maxplayers}?RCONEnabled=True?RCONPort=${rconport}? -Seed=${seed} -OreSeed=${seed} -ConfigsUseAltDir -server -gameplaylogging -log -CULTUREFORCOOKING=en -NoBattlEye -QueryPort=${queryport} -Port=${port} -CubePort=${clientport} -cubeworld=${hostname}")'
    # Get User Input version must be set to 0
    Get-UserInput
} 