Function New-LaunchScriptWreckfestPS {
    #----------   Wreckfest Dedicated Server   -------------------
    # APP ID # 	361580
    ################## Change Default Variables #################
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    #                       SV_LAN
    $global:sv_lan          = "0"
    #                       Maxplayers
    $global:maxplayers      = "24"    
    #                       Server Query Port  
    $global:queryport       = "27016"
    #                       Server Port
    $global:port            = "27015"
     #                       Client Port
    $global:clientport      = "33540"
    
    
    ##############################/\##############################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "server\Wreckfest"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "Wreckfest"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog      = "log.txt"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "server_config.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -s server_config=${servercfg}")'
    
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    # Install Adjustment
    Copy-wfservercfg
    
}


Function Copy-wfservercfg {

    $defaultwfservercfg = "$serverdir\initial_server_config.cfg"
    Add-Content $ssmlog "[$loggingDate] Creating server_config.cfg "
    If (Test-Path $serverdir\$servercfg) { 
        Add-Content $ssmlog "[$loggingDate] server_config.cfg exists! "
    } 
    Else {
        # New-Item $serverdir\$servercfg -Force | Out-File -Append -Encoding Default  $ssmlog
        copy-Item $defaultwfservercfg $serverdir\$servercfg
        Set-wfservercfg
    }
       
}
Function Set-wfservercfg {
    If (Test-Path $serverdir\$servercfg) {
    Get-Infomessage "Checking server_config.cfg" 'info'
    
        Get-Infomessage "edit server_name=  server_config.cfg" 'info'
        ((Get-Content -path $serverdir\$servercfg -Raw) -replace "server_name=", "server_name=$hostname") | Set-Content -Path $serverdir\$servercfg
    
        Get-Infomessage "edit password= server_config.cfg" 'info'
        ((Get-Content -path $serverdir\$servercfg -Raw) -replace "password=wreckfest", "password=$rconpassword ") | Set-Content -Path $serverdir\$servercfg

        Get-Infomessage "edit lan=0 server_config.cfg" 'info'
        ((Get-Content -path "$serverdir\$servercfg "-Raw) -replace "lan=0", "lan=$sv_lan") | Set-Content -Path $serverdir\$servercfg

        Get-Infomessage "edit steam_port server_config.cfg" 'info'
        ((Get-Content -path $serverdir\$servercfg -Raw) -replace "steam_port=27015", "steam_port=$port") | Set-Content -Path $serverdir\$servercfg

        Get-Infomessage "edit  game_port server_config.cfg" 'info'
        ((Get-Content -path $serverdir\$servercfg -Raw) -replace "game_port=33540", "game_port=$clientport") | Set-Content -Path $serverdir\$servercfg

        Get-Infomessage "edit query_port server_config.cfg" 'info'
        ((Get-Content -path $serverdir\$servercfg -Raw) -replace "query_port=27016", "query_port=$queryport") | Set-Content -Path $serverdir\$servercfg

        Get-Infomessage "edit  max_players server_config.cfg" 'info'
        ((Get-Content -path "$serverdir\$servercfg "-Raw) -replace "max_players=24", "max_players=$maxplayers") | Set-Content -Path $serverdir\$servercfg

    }
}