Function  New-LaunchScriptavserverPS {
        # Avorion Dedicated Server
        # APP ID # 565060  
        ################## Change Default Variables #################
        #                       Maxplayers
        $global:maxplayers      = "10"
        #                       Server Difficulty
        $global:DIFF            = "0"
        #                       Server Admin Steam64
        $global:steamID64       = ""
        #                       Galaxy Name
        $global:galaxyname      = "avorion_galaxy"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        #                       GameDig port Default
        #$global:port            = "27020"
        ##############################/\##############################
        
        
        # 27000 - UDP & TCP.
        # 27003 - UDP.
        # 27020 - UDP.
        # 27021 - UDP.
        
        ###################### Do not change below #####################
        #                               System Directory
        $global:systemdir               = "$serverdir"
        #                               Server Executable
        $global:executable              = "bin\AvorionServer"
        #                               Server Executable Directory
        $global:executabledir           = "$serverdir"
        #                               Appdata\Roaming Directory
        $global:saves                   = "Avorion"
        #                               Gamedig Query
        $global:querytype               = "protocol-valve"
        #                               Game Process
        $global:process                 = "AvorionServer"
        #                               Server Config Directory
        $global:servercfgdir            = "$env:APPDATA\$saves"
        #                               Log Directory
        $global:logdirectory            = "$env:APPDATA\$saves\galaxies\$galaxyname"
        #                               Server Log
        $global:consolelog              = "serverlog*.txt"
        #                               Server Launch Command
        $global:launchParams            = '@("$executable --server-name `"${hostname}`" --admin ${steamID64} --galaxy-name ${galaxyname} --difficulty ${diff} --max-players ${maxplayers}")'
        # Get User Input version must be set to 0
        Get-UserInput
}