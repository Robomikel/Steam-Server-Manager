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
    $global:systemdir = ""
    $global:executable = "CapsaServer"
    $global:executabledir = "$serverdir"
    $global:querytype = "protocol-valve"
    $global:process = "CapsaServer"
    $global:servercfgdir = "$serverdir\Capsa\Saved\Config\WindowsServer"
    $global:logdirectory = "$serverdir"
    Get-StopServerInstall
    $global:gamedirname = "Capsa"
    $global:servercfg = "Game.ini"

    
    # Get-Servercfg
    # Select-EditSourceCFG
    $global:launchParams = '@("$executable ")'
} 