Function  New-LaunchScriptavserverPS {
        # Avorion Dedicated Server
        # APP ID # 565060  
        ################## Change Default Variables #################
        #                       Maxplayers
        $global:MAXPLAYERS      = "10"
        #                       Server Difficulty
        $global:DIFF            = "0"
        #                       Server Admin Steam64
        $global:steamID64       = ""
        #                       Galaxy Name
        $global:GALAXYNAME      = ""
        #                       Server Name
        $global:HOSTNAME        = "$env:USERNAME"
        #                       GameDig port Default
        #$global:PORT            = "27020"
        ##############################/\##############################
        
        
        # 27000 - UDP & TCP.
        # 27003 - UDP.
        # 27020 - UDP.
        # 27021 - UDP.
        
        ###################### Do not change below #####################
        $global:MODDIR = ""
        $global:EXE = "AvorionServer"
        $global:EXEDIR = "bin"
        $global:GAME = "protocol-valve"
        $global:SAVES = "Avorion"
        $global:PROCESS = "AvorionServer"
        $global:SERVERCFGDIR = ""
        $global:LOGDIR = ""
    
        
        Get-StopServerInstall
        $global:launchParams = '@("$global:EXEDIR\$global:EXE --server-name `"${global:HOSTNAME}`" --admin ${$global:steamID64} --galaxy-name ${global:GALAXYNAME} --difficulty ${global:DIFF} --max-players ${global:MAXPLAYERS}")'
}