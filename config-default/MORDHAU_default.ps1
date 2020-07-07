Function New-LaunchScriptMORDHAUPS {
    # MORDHAU Dedicated Server
    # APP ID # 	629800
    ################## Change Default Variables #################
    #                       Server IP
    # ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Beacon Port 
    $global:clientport        = "15000"
    #                       Peer Port
    $global:sourcetvport    = "4778"
    #                       Map "/Game/Mordhau/Maps/ThePit/FFA_ThePit.FFA_ThePit"
    # $global:defaultmap      = "/Game/Mordhau/Maps/ThePit/FFA_ThePit.FFA_ThePit"
    #                       Maxplayers
    # $global:maxplayers      = "70"
    #                       Server Name
    # $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    # https://isle.fandom.com/wiki/The_Isle_Server_Settings_and_Configuration
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\Mordhau\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "MordhauServer-Win64-Shipping"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Mordhau\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "MordhauServer-Win64-Shipping"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\Mordhau\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "Mordhau.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "Game.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -USEALLAVAILABLECORES -Port=${port} -QueryPort=${queryport} -PeerPort=${sourcetvport} -Beaconport=${clientport} -log")'
    # -USEALLAVAILABLECORES -log -port=7778 -queryport=27015 -peerport=4778 -Beaconport=15000
    # start C:\TheIsleServer\TheIsleServer.exe /Game/TheIsle/Maps/Landscape3/Isle_V3?MultiHome=12.345.67.890?Port=7777?QueryPort=7777?MaxPlayers=100?game=Survival -log
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
} 
