Function New-LaunchScriptPixArkPS {
    # PixARK Dedicated Server
    # APP ID # 824360
    # https://steamcommunity.com/sharedfiles/filedetails/?id=1343773033
    # https://nodecraft.com/support/games/pixark/creating-your-own-pixark-server
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Rcon Port
    $global:rconport        = "27020"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    #                       Map
    $global:defaultmap      = "CubeWorld_Light"
    #                       Maxplayers
    $global:maxplayers      = "70"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "PixARKServer"
    $global:executabledir = "$serverdir\ShooterGame\Binaries\Win64"
    $global:querytype = "protocol-valve"
    $global:process = "PixARKServer"
    $global:servercfgdir = "$serverdir\ShooterGame\Saved\Config\WindowsServer"
    $global:logdirectory = "$serverdir"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "GameUserSettings.ini"

    
    # Get-Servercfg
    # Select-EditSourceCFG
    # "CubeWorld_Light?listen?MaxPlayers={maxplayers}?SessionName={SERVERNAME}?Port=27015?QueryPort=27016?RCONPort=27017?ServerPassword={SERVERPASSWORD}?ServerAdminPassword={YOURADMINPASSWORD}?CULTUREFORCOOKING=en" -NoBattlEye -CubePort=15000 -cubeworld=world -nosteamclient -NoHangDetection -game -server -log
    $global:launchParams = '@("$executable ${defaultmap}?listen?MaxPlayers=${maxplayers}?Port=${port}?QueryPort=${queryport}?RCONPort=${rconport}?SessionName=`"${hostname}`"?ServerAdminPassword=${rconpassword} -game -server -log")'
} 