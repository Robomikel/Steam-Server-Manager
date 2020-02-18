Function New-LaunchScriptArkPS {
        # Ark: Survival Evolved Server
        # APP ID # 376030
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
        $global:MAP             = "TheIsland"
        #                       Maxplayers
        $global:MAXPLAYERS      = "70"
        #                       Server Name
        $global:HOSTNAME        = "$env:USERNAME"
        ##############################/\##############################
        
        
        
        
        
        ###################### Do not change below #####################
        $global:MODDIR = ""
        $global:EXE = "ShooterGameServer"
        $global:EXEDIR = "ShooterGame\Binaries\Win64"
        $global:GAME = "arkse"
        $global:PROCESS = "ShooterGameServer"
        $global:SERVERCFGDIR = "ShooterGame\Saved\Config\WindowsServer"
        $global:LOGDIR = ""
        Get-StopServerInstall
        $global:gamedirname = "ARKSurvivalEvolved"
        $global:config1 = "GameUserSettings.ini"
    
        
        Get-Servercfg
        Select-EditSourceCFG
        $global:launchParams = '@("$global:EXEDIR\$global:EXE ${global:MAP}?AltSaveDirectoryName=${global:MAP}?listen?MultiHome=${global:IP}?MaxPlayers=${global:MAXPLAYERS}?QueryPort=${global:QUERYPORT}?RCONEnabled=True?RCONPort=${global:RCONPORT}?ServerAdminPassword=${global:RCONPASSWORD}?Port=${global:PORT} -automanagedmods")'
} 