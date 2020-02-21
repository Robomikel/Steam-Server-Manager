Function New-LaunchScriptMiscreatedPS {
        #----------   Miscreated Server Install Function   -------------------
        # APP ID # 302200
        ################## Change Default Variables #################
        #                       Server IP 
        ${global:IP}            = "${global:IP}"
        #                       Server Port
        $global:port            = 64090
        #                       Rcon Password
        $global:rconpassword    = "$global:RANDOMPASSWORD"
        #                       Maxplayers
        $global:maxplayers      = "32"
        #                       Server Name
        $global:hostname        = "$env:USERNAME"
        ##############################/\##############################
        
        
        ###################### Do not change below #####################

        # $global:systemdir=""
        $global:executabledir = "$serverdir\Bin64_dedicated"
        $global:executable = "MiscreatedServer"
        $global:querytype = "protocol-valve"
        # $global:saves = ""
        $global:process = "MiscreatedServer"
        $global:servercfgdir = "$serverdir"
        $global:logdirectory = "$serverdir"        
        Get-StopServerInstall
        # $global:gamedirname=""
        $global:servercfg="HOSTING.CFG"
        # Get-Servercfg
        
        $global:RCONPORT = $global:port + 4
        #VERSION 2 Requieres  Vars
        $global:launchParams = '@("$executable +sv_bind ${ip} +sv_maxplayers ${maxplayers} +map islands -sv_port ${port} +http_startserver -mis_gameserverid 100")'

        # Custom config game based         
        Write-Host '*** Creating HOSTING.CFG *****' -ForegroundColor Magenta -BackgroundColor Black 
        New-Item $servercfgdir\HOSTING.CFG -Force
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "sv_servername=`"$hostname`""
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "http_password=$RCONPASSWORD"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value  "g_pinglimit=1000"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "g_pingLimitTimer=15"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "wm_timeScale=1"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "wm_timeScaleWeather=1"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "wm_timeScaleNight=4"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "sv_noBannedAccounts=0 "
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "sv_maxuptime=24"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "sv_motd=`"WELCOME!`""
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "sv_url=`"mywebsite.com`""
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "sv_msg_conn=0"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "sv_msg_death=0"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "g_playerHealthRegen=0.111"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "g_playerFoodDecay=0.2777"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "g_playerFoodDecaySprinting=0.34722"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "g_playerWaterDecay=0.4861"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "g_playerWaterDecaySprinting=0.607638"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "g_playerInfiniteStamina=0"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "g_craftingSpeedMultiplier=1"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "asm_disable=0"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "asm_percent=33"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "asm_maxMultiplier=1"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "asm_hordeCooldown=900"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "pcs_maxCorpses=20"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "pcs_maxCorpseTime=1200"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "steam_inventory_enable=1"
        Add-Content -Path $servercfgdir\HOSTING.CFG -Value "steam_inventory_enable=1"
}
