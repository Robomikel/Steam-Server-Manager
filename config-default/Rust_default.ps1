Function New-LaunchScriptRustPS { 
        #----------   Rust Server Install Function   -------------------
        # APP ID # 258550
        # Tested 2/22/20
        ################## Change Default Variables #################
        #                       Server IP 
        ${global:IP}            = "${ip}"
        #                       Server Port
        $global:port            = "28015"
        #                       Rcon Port
        $global:rconport        = "28016"
        #                       Rcon Password
        $global:rconpassword    = "$RANDOMPASSWORD"
        #                       Rcon Web
        $global:rconweb         = "1"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        #                       Maxplayers
        $global:maxplayers      = "32"
        #                       World Seed
        $global:seed            = "$RANDOMSEED"
        #                       World Size
        $global:worldsize       = "3000"
        #                       Save Interval
        $global:saveinterval    = "300"
        #                       Tickrate
        $global:tickrate        = "30"
    
        ##############################/\##############################
        ###################### Do not change below #####################
        #                               System Directory
        $global:systemdir               = "$serverdir\RustDedicated_Data"
        #                               Server Config Directory
        $global:servercfgdir            = "$serverdir\server\my_server_identity\cfg"
        #                               Server Executable
        $global:executable              = "RustDedicated"
        #                               Server Executable Directory
        $global:executabledir           = "$serverdir"
        #                               Gamedig Query
        $global:querytype               = "rust"
        #                               Game Process
        $global:process                 = "RustDedicated"
        #                               Log Directory
        $global:logdirectory            = "$serverdir"
        #                               Server Log
        $global:consolelog              = "Serverlog-*.log"
        #                               Game-Server-Config Directory
        $global:gamedirname             = "Rust"
        #                               Game-Server-Config
        $global:servercfg               = "server.cfg"
        #                               Server Launch Command
        $global:launchParams            = '@("$executable -batchmode +server.ip ${ip}  +server.port ${port} +server.tickrate ${TICKRATE} +server.hostname `"${hostname}`" +server.maxplayers ${maxplayers} +server.worldsize ${worldsize} +server.saveinterval ${saveinterval} +rcon.web ${rconweb} +rcon.ip 0.0.0.0 +rcon.port ${rconport} +rcon.password ${rconpassword} -logfile $logdirectory\Serverlog-$date.log")'
        # Get User Input version must be set to 0
        Get-UserInput
        # Download Game-Server-Config
        Get-Servercfg
}




