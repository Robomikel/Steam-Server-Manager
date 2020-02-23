Function New-LaunchScriptArkPS {
        # Ark: Survival Evolved Server
        # APP ID # 376030
        ################## Change Default Variables #################
        #                       Server IP
        ${global:IP}            = "${ip}"
        #                       Server Port
        $global:port            = "7777"
        #                       Query Port
        $global:queryport       = "27015"
        #                       Rcon Port
        $global:rconport        = "27020"
        #                       Rcon Password
        $global:rconpassword    = "$RANDOMPASSWORD"
        #                       Map
        $global:defaultmap      = "TheIsland"
        #                       Maxplayers
        $global:maxplayers      = "70"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        ##############################/\##############################
        ###################### Do not change below #####################
        #                       System Directory
        $global:systemdir       = "$serverdir"
        #                       Server Config Directory
        $global:servercfgdir    = "$serverdir\ShooterGame\Saved\Config\WindowsServer"
        #                       Server Executable
        $global:executable      = "ShooterGameServer"
        #                       Server Executable Directory
        $global:executabledir   = "$serverdir\ShooterGame\Binaries\Win64"
        #                       Gamedig Query
        $global:querytype       = "arkse"
        #                       Game Process
        $global:process         = "ShooterGameServer"
        #                       Log Directory
        $global:logdirectory    = "$serverdir"
        #                       Game-Server-Config Directory
        $global:gamedirname     = "ARKSurvivalEvolved"
        #                       Game-Server-Config
        $global:servercfg       = "GameUserSettings.ini"
        #                       Server Launch Command
        $global:launchParams    = '@("$executable ${defaultmap}?AltSaveDirectoryName=${defaultmap}?listen?MultiHome=${ip}?MaxPlayers=${maxplayers}?QueryPort=${queryport}?RCONEnabled=True?RCONPort=${rconport}?ServerAdminPassword=${rconpassword}?Port=${port} -automanagedmods")'
        # Download Game-Server-Config
        Get-Servercfg
        # Edit Server Game-Server-Config
        Select-EditSourceCFG
} 