Function New-LaunchScriptCaspaServerPS {
    # Capsa Dedicated Server
    # APP ID # 667230
    # https://steamcommunity.com/sharedfiles/filedetails/?id=1178788612
    ################## Change Default Variables #################

    ##############################/\##############################
    # 27014-27015/UDP
    # \Capsa\Saved\Config\WindowsServer\game.ini

    # [Server]
    # ServerName=MyFirstCapsaServer
    # MaxPlayers=64
    # AdminSteamID=0
    # FriendsOnly=False
    # GroupOnly=False
    # GroupSteamID=0
    # DayNightCycle=True
    # TimeOfDay=1130
    # DayLength=240
    # CountryCode=GB
    # WelcomeMessage=Welcome to Capsa
    # DynamicCloudDensity=True
    # CloudDensity=0
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "CapsaServer"
    $global:EXEDIR = ""
    $global:GAME = "protocol-valve"
    $global:PROCESS = "CapsaServer"
    $global:SERVERCFGDIR = "Capsa\Saved\Config\WindowsServer"
    Get-StopServerInstall
    $global:gamedirname = "Capsa"
    $global:config1 = "Game.ini"

    
    # Get-Servercfg
    # Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE ")'
} 