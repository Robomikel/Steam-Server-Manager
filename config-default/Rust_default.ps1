Function New-LaunchScriptRustPS { 
        #----------   Rust Server Install Function   -------------------
        # APP ID # 258550
        ################## Change Default Variables #################
        #                       Server IP 
        ${global:IP}            = "${global:IP}"
        #                       Server Port
        $global:PORT            = "28015"
        #                       Rcon Port
        $global:RCONPORT        = "28016"
        #                       Rcon Password
        $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
        #                       Rcon Web
        $global:RCONWEB         = "1"
        #                       Server Name
        $global:HOSTNAME        = "$env:USERNAME"
        #                       Maxplayers
        $global:MAXPLAYERS      = "32"
        #                       World Seed
        $global:SEED            = "$global:RANDOMSEED"
        #                       World Size
        $global:WORLDSIZE       = "3000"
        #                       Save Interval
        $global:SAVEINTERVAL    = "300"
        #                       Tickrate
        $global:TICKRATE        = "30"
    
        ##############################/\##############################
    
    
    
        ###################### Do not change below #####################
        # # Version 2.0
        $global:MODDIR = "RustDedicated_Data"
        $global:EXEDIR = ""
        $global:EXE = "RustDedicated"
        $global:GAME = "rust"
        $global:PROCESS = "RustDedicated"
        $global:SERVERCFGDIR = "server\my_server_identity\cfg"
        $global:LOGDIR = ""
        Get-StopServerInstall
        # Game-server-configs \/
        $global:gamedirname = "Rust"
        $global:config1 = "server.cfg"
        Get-Servercfg
        # # Version 2.0
        # Game Specific
        $global:RANDOMSEED = Get-Random -Minimum 1 -Maximum 2147483647  
    

        #  Version 2 Launch Param
        $global:launchParams = '@("$global:EXE -batchmode +server.ip ${global:IP}  +server.port ${global:PORT} +server.tickrate ${global:TICKRATE} +server.hostname `"${global:HOSTNAME}`" +server.maxplayers ${global:MAXPLAYERS} +server.worldsize ${global:WORLDSIZE} +server.saveinterval ${global:SAVEINTERVAL} +rcon.web ${global:RCONWEB} +rcon.ip 0.0.0.0 +rcon.port ${global:RCONPORT} +rcon.password ${global:RCONPASSWORD} -logfile $global:currentdir\$global:server\Serverlog-$date.log")'
        # adding to server.cfg                   server.hostname "server"
        #Add-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\$global:config1 -Value "server.hostname `"$global:HOSTNAME`""
        Get-OxideQ
    
}




