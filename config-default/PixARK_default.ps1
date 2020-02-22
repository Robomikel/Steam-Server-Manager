Function New-LaunchScriptPixArkPS {
    # PixARK Dedicated Server
    # APP ID # 824360
    # https://pixark.gamepedia.com/Server_configuration
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:port            = "27015"
    #                       Query Port
    $global:queryport       = "27016"
    #                       Cube Port
    $global:clientport       = "27018"
    #                       Rcon Port
    $global:rconport        = "27017"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    #                       Map
    $global:defaultmap      = "CubeWorld_Light"
    #                       Maxplayers
    $global:maxplayers      = "20"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Server Password
    $global:serverpassword  = ""
    #                       World Seed
    $global:seed            = "$global:RANDOMSEED"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "PixARKServer"
    $global:executabledir = "$serverdir\ShooterGame\Binaries\Win64"
    $global:querytype = "protocol-valve"
    $global:process = "PixARKServer"
    $global:servercfgdir = "$serverdir\ShooterGame\Saved\Config\WindowsServer"
    $global:logdirectory = "$serverdir\ShooterGame\Saved\Logs"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "GameUserSettings.ini"

    
    # Get-Servercfg
    # Select-EditSourceCFG
    # $global:launchParams= @("$executable ?DelayRegisterServer=True?bRawSockets=True?SessionName=`"${hostname}`"?AltSaveDirectoryName=Trevoria?ServerPassword=${serverpassword}?ServerAdminPassword=${rconpassword}?MaxPlayers=${maxplayers}?RCONEnabled=True?RCONPort=${rconport}? -Seed=${RANDOMSEED} -OreSeed=${RANDOMSEED} -ConfigsUseAltDir -server -gameplaylogging -log -CULTUREFORCOOKING=en -NoBattlEye -QueryPort=27016 -Port=27015 -CubePort=27018 -cubeworld=MyPixarkServer")
    $global:launchParams = '@("$executable ${defaultmap}?DelayRegisterServer=True?bRawSockets=True?SessionName=`"${hostname}`"?AltSaveDirectoryName=Trevoria?ServerPassword=${serverpassword}?ServerAdminPassword=${rconpassword}?MaxPlayers=${maxplayers}?RCONEnabled=True?RCONPort=${rconport}? -Seed=${RANDOMSEED} -OreSeed=${RANDOMSEED} -ConfigsUseAltDir -server -gameplaylogging -log -CULTUREFORCOOKING=en -NoBattlEye -QueryPort=${queryport} -Port=${port} -CubePort=${clientport} -cubeworld=${hostname}")'
} 