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
        $global:galaxyname      = ""
        #                       Server Name
        $global:hostname        = "$env:USERNAME"
        #                       GameDig port Default
        #$global:port            = "27020"
        ##############################/\##############################
        
        
        # 27000 - UDP & TCP.
        # 27003 - UDP.
        # 27020 - UDP.
        # 27021 - UDP.
        
        ###################### Do not change below #####################
        $global:systemdir = ""
        $global:executable = "AvorionServer"
        $global:executabledir= "$serverdir\bin"
        $global:querytype = "protocol-valve"
        $global:saves = "Avorion"
        $global:process = "AvorionServer"
        $global:servercfgdir = "$env:APPDATA\$global:saves"
        $global:logdirectory = "$serverdir"
    
        
        Get-StopServerInstall
        $global:launchParams = '@("$executable --server-name `"${hostname}`" --admin ${steamID64} --galaxy-name ${galaxyname} --difficulty ${diff} --max-players ${maxplayers}")'
}