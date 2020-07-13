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
    $global:beaconport        = "15000"
    #                       Peer Port
    $global:peerport    = "4778"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Admin Password
    $global:adminpassword   = "$RANDOMPASSWORD"
    #                       Map "/Game/Mordhau/Maps/ThePit/FFA_ThePit.FFA_ThePit"
    # $global:defaultmap      = "/Game/Mordhau/Maps/ThePit/FFA_ThePit.FFA_ThePit"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    # https://mordhau.com/forum/topic/10250/how-i-got-my-dedicated-server-ot-run-and-appear-on/
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
    $global:launchParams    = '@("${executable} -USEALLAVAILABLECORES -Port=${port} -QueryPort=${queryport} -PeerPort=${peerport} -Beaconport=${beaconport} -log")'
    # -USEALLAVAILABLECORES -log -port=7778 -queryport=27015 -peerport=4778 -Beaconport=15000
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    Get-Infomessage " Creating Game.ini " 'info'
    New-Item $servercfgdir\Game.ini -Force
    Add-Content   $servercfgdir\Game.ini [/Script/Mordhau.MordhauGameSession]
    Add-Content   $servercfgdir\Game.ini MaxSlots=$maxplayers
    Add-Content   $servercfgdir\Game.ini ServerName=$hostname
    Add-Content   $servercfgdir\Game.ini ServerPassword=$serverpassword
    Add-Content   $servercfgdir\Game.ini AdminPassword=$adminpassword
    Add-Content   $servercfgdir\Game.ini Admins=
    Add-Content   $servercfgdir\Game.ini BannedPlayers=
    Add-Content   $servercfgdir\Game.ini " "
    Add-Content   $servercfgdir\Game.ini [/Script/Mordhau.MordhauGameMode]
    Add-Content   $servercfgdir\Game.ini PlayerRespawnTime=5.000000
    Add-Content   $servercfgdir\Game.ini BallistaRespawnTime=30.000000
    Add-Content   $servercfgdir\Game.ini CatapultRespawnTime=30.000000
    Add-Content   $servercfgdir\Game.ini HorseRespawnTime=30.000000
    Add-Content   $servercfgdir\Game.ini DamageFactor=1.000000
    Add-Content   $servercfgdir\Game.ini TeamDamageFactor=0.500000
    Add-Content   $servercfgdir\Game.ini MapRotation=FFA_ThePit
    Add-Content   $servercfgdir\Game.ini MapRotation=TDM_Camp
    Add-Content   $servercfgdir\Game.ini MapRotation=SKM_Grad
    Add-Content   $servercfgdir\Game.ini MapRotation=FFA_Contraband
    Add-Content   $servercfgdir\Game.ini MapRotation=TDM_Tourney
    Add-Content   $servercfgdir\Game.ini MapRotation=SKM_MountainPeak
    Add-Content   $servercfgdir\Game.ini MapRotation=FFA_Taiga
    Add-Content   $servercfgdir\Game.ini MapRotation=TDM_ThePit
    Add-Content   $servercfgdir\Game.ini MapRotation=SKM_Camp
    Add-Content   $servercfgdir\Game.ini MapRotation=FFA_Grad
    Add-Content   $servercfgdir\Game.ini MapRotation=TDM_Contraband
    Add-Content   $servercfgdir\Game.ini MapRotation=SKM_Tourney
    Add-Content   $servercfgdir\Game.ini MapRotation=FFA_MountainPeak
    Add-Content   $servercfgdir\Game.ini MapRotation=TDM_Taiga
    Add-Content   $servercfgdir\Game.ini MapRotation=SKM_ThePit
    Add-Content   $servercfgdir\Game.ini MapRotation=FFA_Camp
    Add-Content   $servercfgdir\Game.ini MapRotation=TDM_Grad
    Add-Content   $servercfgdir\Game.ini MapRotation=SKM_Contraband
    Add-Content   $servercfgdir\Game.ini MapRotation=FFA_Tourney
    Add-Content   $servercfgdir\Game.ini MapRotation=TDM_MountainPeak
    Add-Content   $servercfgdir\Game.ini MapRotation=SKM_Taiga

} 
