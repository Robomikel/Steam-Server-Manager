Function New-LaunchScriptMiscreatedPS {
        #----------   Miscreated Server Install Function   -------------------
        # APP ID # 302200
        ################## Change Default Variables #################
        #                       Server IP 
        ${global:IP}            = "${global:IP}"
        #                       Server Port
        $global:PORT            = "64090"
        #                       Rcon Password
        $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
        #                       Maxplayers
        $global:MAXPLAYERS      = "32"
        #                       Server Name
        $global:HOSTNAME         = "$env:USERNAME"
        ##############################/\##############################
        
        
        ###################### Do not change below #####################

        # $global:MODDIR=""
        $global:EXEDIR = "Bin64_dedicated"
        $global:EXE = "MiscreatedServer"
        $global:GAME = "protocol-valve"
        # $global:SAVES = ""
        $global:PROCESS = "MiscreatedServer"
        # $global:SERVERCFGDIR = ""
        $global:LOGDIR = ""        
        Get-StopServerInstall
        # $global:gamedirname=""
        # $global:config1=""
        # Get-Servercfg
        $global:RCONPORT = "$global:PORT"
        $global:RCONPORT += "4"  
        #VERSION 2 Requieres  Vars
        $global:launchParams = '@("$global:EXEDIR\$global:EXE +sv_bind ${global:IP} +sv_maxplayers ${global:MAXPLAYERS} +map islands -sv_port ${global:PORT} +http_startserver -mis_gameserverid 100")'

        # Custom config game based         
        Write-Host '*** Creating HOSTING.CFG *****' -ForegroundColor Magenta -BackgroundColor Black 
        New-Item $global:currentdir\$global:server\HOSTING.CFG -Force
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "sv_servername=`"$global:HOSTNAME`""
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "http_password=$global:RCONPASSWORD"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value  "g_pinglimit=1000"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "g_pingLimitTimer=15"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "wm_timeScale=1"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "wm_timeScaleWeather=1"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "wm_timeScaleNight=4"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "sv_noBannedAccounts=0 "
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "sv_maxuptime=24"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "sv_motd=`"WELCOME!`""
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "sv_url=`"mywebsite.com`""
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "sv_msg_conn=0"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "sv_msg_death=0"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "g_playerHealthRegen=0.111"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "g_playerFoodDecay=0.2777"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "g_playerFoodDecaySprinting=0.34722"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "g_playerWaterDecay=0.4861"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "g_playerWaterDecaySprinting=0.607638"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "g_playerInfiniteStamina=0"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "g_craftingSpeedMultiplier=1"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "asm_disable=0"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "asm_percent=33"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "asm_maxMultiplier=1"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "asm_hordeCooldown=900"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "pcs_maxCorpses=20"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "pcs_maxCorpseTime=1200"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "steam_inventory_enable=1"
        Add-Content -Path $global:currentdir\$global:server\HOSTING.CFG -Value "steam_inventory_enable=1"
}
