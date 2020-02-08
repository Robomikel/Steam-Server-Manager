Function New-LaunchScriptArkPS {
        # Ark: Survival Evolved Server
        # APP ID # 376030
        ################## Change Default Variables #################
        ${global:IP} = "${global:IP}"
        $global:PORT = "7777"
        $global:QUERYPORT = "27015"
        $global:RCONPORT = "27020"
        $global:RCONPASSWORD = "$global:RANDOMPASSWORD"
        $global:MAP = "TheIsland"
        $global:MAXPLAYERS = "70"
        $global:HOSTNAME = "$env:USERNAME"
        # - - - - - - - Do not change below - - - - - - - - -
        $global:MODDIR = ""
        $global:EXE = "ShooterGameServer"
        $global:EXEDIR = "ShooterGame\Binaries\Win64"
        $global:GAME = "arkse"
        $global:PROCESS = "ShooterGameServer"
        $global:SERVERCFGDIR = "ShooterGame\Saved\Config\WindowsServer"
        Get-StopServerInstall
        $global:gamedirname = "ARKSurvivalEvolved"
        $global:config1 = "GameUserSettings.ini"
        $global:ANON = "yes"
        $global:username = ""
        Get-Servercfg
        Select-EditSourceCFG
        $global:launchParams = '@("$global:EXEDIR\$global:EXE ${global:MAP}?AltSaveDirectoryName=${global:MAP}?listen?MultiHome=${global:IP}?MaxPlayers=${global:MAXPLAYERS}?QueryPort=${global:QUERYPORT}?RCONEnabled=True?RCONPort=${global:RCONPORT}?ServerAdminPassword=${global:RCONPASSWORD}?Port=${global:PORT} -automanagedmods")'
} 