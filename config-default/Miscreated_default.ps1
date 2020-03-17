Function New-LaunchScriptMiscreatedPS {
        #----------   Miscreated Server Install Function   -------------------
        # APP ID # 302200
        # Tested 2.23.2020
        ################## Change Default Variables #################
        #                       Server IP 
        ${global:IP}            = "${ip}"
        #                       Server Port
        $global:port            = 64090
        #                       Rcon Password
        $global:rconpassword    = "$RANDOMPASSWORD"
        #                       Maxplayers
        $global:maxplayers      = "32"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        ##############################/\##############################
        # Port + 1  = Client 
        # port + 2  = Query Port
        # port + 3  = 
        # port + 4  = rcon port
        
        ###################### Do not change below #####################
        #                       System Directory
        $global:systemdir       = "$serverdir"
        #                       Server Config Directory
        $global:servercfgdir    = "$serverdir"
        #                       Server Executable
        $global:executable      = "MiscreatedServer"
        #                       Server Executable Directory
        $global:executabledir   = "$serverdir\Bin64_dedicated"
        #                       Gamedig Query
        $global:querytype       = "protocol-valve"
        #                       Gamedig Query Port
        $global:queryport       = $port + 2
        $global:RCONPORT        = $port + 4
        #                       Game Process
        $global:process         = "MiscreatedServer"
        #                       Log Directory 
        $global:logdirectory    = "$serverdir"
        #                       Server Log
        $global:consolelog      = "server.log"        
        #                       Game-Server-Config Directory
        $global:gamedirname     = ""
        #                       Game-Server-Config
        $global:servercfg       = "HOSTING.CFG"
        #                       Server Launch Command
        $global:launchParams    = '@("$executable +sv_bind ${ip} +sv_maxplayers ${maxplayers} +map islands -sv_port ${port} +http_startserver -mis_gameserverid 100")'
        # Get User Input version must be set to 0
        Get-UserInput
        # Install Adjustment         
        # Write-Host '*** Creating HOSTING.CFG *****' -ForegroundColor Magenta -BackgroundColor Black 
        New-Item $servercfgdir\HOSTING.CFG -Force | Out-File -Append -Encoding Default  $ssmlog
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
