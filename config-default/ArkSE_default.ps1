Function New-LaunchScriptArkPS {
        # Ark: Survival Evolved Server
        # APP ID # 376030
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
        $global:defaultmap      = "TheIsland"
        #                       Maxplayers
        $global:maxplayers      = "70"
        #                       Server Name
        $global:hostname        = "$env:USERNAME"
        ##############################/\##############################
        
        
        
        
        
        ###################### Do not change below #####################
        $global:systemdir = ""
        $global:executable = "ShooterGameServer"
        $global:executabledir= "ShooterGame\Binaries\Win64"
        $global:querytype = "arkse"
        $global:process = "ShooterGameServer"
        $global:servercfgdir = "ShooterGame\Saved\Config\WindowsServer"
        $global:logdir = ""
        Get-StopServerInstall
        $global:gamedirname = "ARKSurvivalEvolved"
        $global:servercfg = "GameUserSettings.ini"
    
        
        Get-Servercfg
        Select-EditSourceCFG
        $global:launchParams = '@("$global:executabledir\$executable ${defaultmap}?AltSaveDirectoryName=${defaultmap}?listen?MultiHome=${ip}?MaxPlayers=${maxplayers}?QueryPort=${queryport}?RCONEnabled=True?RCONPort=${rconport}?ServerAdminPassword=${rconpassword}?Port=${port} -automanagedmods")'
} 