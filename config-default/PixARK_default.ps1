Function New-LaunchScriptPixArkPS {
    # PixARK Dedicated Server
    # APP ID # 824360
    # https://steamcommunity.com/sharedfiles/filedetails/?id=1343773033
    # https://nodecraft.com/support/games/pixark/creating-your-own-pixark-server
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:PORT            = "7777"
    #                       Query Port
    $global:QUERYPORT       = "27015"
    #                       Rcon Port
    $global:RCONPORT        = "27020"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    #                       Map
    $global:MAP             = "CubeWorld_Light"
    #                       Maxplayers
    $global:MAXPLAYERS      = "70"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "PixARKServer"
    $global:EXEDIR = "ShooterGame\Binaries\Win64"
    $global:GAME = "protocol-valve"
    $global:PROCESS = "PixARKServer"
    $global:SERVERCFGDIR = "ShooterGame\Saved\Config\WindowsServer"
    $global:LOGDIR = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "GameUserSettings.ini"

    
    Get-Servercfg
    Select-EditSourceCFG
    # "CubeWorld_Light?listen?MaxPlayers={MAXPLAYERS}?SessionName={SERVERNAME}?Port=27015?QueryPort=27016?RCONPort=27017?ServerPassword={SERVERPASSWORD}?ServerAdminPassword={YOURADMINPASSWORD}?CULTUREFORCOOKING=en" -NoBattlEye -CubePort=15000 -cubeworld=world -nosteamclient -NoHangDetection -game -server -log
    $global:launchParams = '@("$global:EXEDIR\$global:EXE $global:MAP?listen?MaxPlayers=${global:MAXPLAYERS}?Port=${global:PORT}?QueryPort=${global:QUERYPORT}?RCONPort=${global:RCONPORT}?SessionName=${global:HOSTNAME}?ServerAdminPassword=${global:RCONPASSWORD} -game -server -log")'
} 