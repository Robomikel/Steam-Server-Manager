Function New-LaunchScriptArkPS {
        # Ark: Survival Evolved Server
        # APP ID # 376030
        $global:MODDIR = ""
        $global:EXE = "ShooterGameServer"
        $global:EXEDIR = "ShooterGame\Binaries\Win64"
        $global:GAME = "arkse"
        $global:PROCESS = "ShooterGameServer"
        $global:SERVERCFGDIR = "ShooterGame\Saved\Config\WindowsServer"
        Get-StopServerInstall
        $global:gamedirname = "ARKSurvivalEvolved"
        $global:config1 = "GameUserSettings.ini"
        Get-Servercfg
        # Version 2.0
        #  First Run Vars \/ \/ Add Here
        ${global:defaultIP} = "${global:IP}"
        $global:defaultPORT = "7777"
        $global:defaultQUERYPORT = "27015"
        $global:defaultRCONPORT = "27020"
        $global:defaultRCONPASSWORD = "$global:RANDOMPASSWORD"
        $global:defaultMAP = "TheIsland"
        $global:defaultMAXPLAYERS = "70"
        $global:defaultHOSTNAME = "PS Steamer"
        #     Add here     /\ /\ /\
        Get-UserInput 1 1 1 1 1 1 0 1 0 1 0 0
        Select-EditSourceCFG
        # Version 2.0
        $global:launchParams = '@("$global:EXEDIR\$global:EXE ${global:MAP}?AltSaveDirectoryName=${global:MAP}?listen?MultiHome=${global:IP}?MaxPlayers=${global:MAXPLAYERS}?QueryPort=${global:QUERYPORT}?RCONEnabled=True?RCONPort=${global:RCONPORT}?ServerAdminPassword=${global:RCONPASSWORD}?Port=${global:PORT} -automanagedmods")'
} 