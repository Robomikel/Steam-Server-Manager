Function New-LaunchScriptRustPS { 
        #----------   Rust Server Install Function   -------------------
        # APP ID # 258550
        ################## Change Default Variables #################
        #                       Server IP 
        ${global:IP}            = "${global:IP}"
        #                       Server Port
        $global:port            = "28015"
        #                       Rcon Port
        $global:rconport        = "28016"
        #                       Rcon Password
        $global:rconpassword    = "$global:RANDOMPASSWORD"
        #                       Rcon Web
        $global:rconweb         = "1"
        #                       Server Name
        $global:hostname        = "$env:USERNAME"
        #                       Maxplayers
        $global:maxplayers      = "32"
        #                       World Seed
        $global:seed            = "$global:RANDOMSEED"
        #                       World Size
        $global:worldsize       = "3000"
        #                       Save Interval
        $global:saveinterval    = "300"
        #                       Tickrate
        $global:tickrate        = "30"
    
        ##############################/\##############################
    
    
    
        ###################### Do not change below #####################
        # # Version 2.0
        $global:systemdir = "$serverdir\RustDedicated_Data"
        $global:executabledir = "$serverdir"
        $global:executable = "RustDedicated"
        $global:querytype = "rust"
        $global:process = "RustDedicated"
        $global:servercfgdir = "$serverdir\server\my_server_identity\cfg"
        $global:logdirectory = "$serverdir"
        Get-StopServerInstall
        # Game-server-configs \/
        $global:gamedirname = "Rust"
        $global:servercfg = "server.cfg"
        Get-Servercfg
        # # Version 2.0
        # Game Specific
        $global:RANDOMSEED = Get-Random -Minimum 1 -Maximum 2147483647  
    

        #  Version 2 Launch Param
        $global:launchParams = '@("$executable -batchmode +server.ip ${ip}  +server.port ${port} +server.tickrate ${TICKRATE} +server.hostname `"${hostname}`" +server.maxplayers ${maxplayers} +server.worldsize ${worldsize} +server.saveinterval ${saveinterval} +rcon.web ${rconweb} +rcon.ip 0.0.0.0 +rcon.port ${rconport} +rcon.password ${rconpassword} -logfile $logdirectory\Serverlog-$date.log")'
        # adding to server.cfg                   server.hostname "server"
        #Add-Content -Path $servercfgdir\$servercfg -Value "server.hostname `"$hostname`""
        Get-OxideQ
    
}




