
Function New-LaunchScriptInsserverPS {
    #----------   INS Server Install Function   -------------------
    # APP ID # 237410
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Tickrate
    $global:tickrate        = "64"
    #                       Game Server Token
    $global:gslt            = ""
    #                       Map
    $global:defaultmap      = "buhriz_coop checkpoint"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       SV_LAN
    $global:sv_lan          = "0"
    #                       Coop Players
    $global:coopplayers     = "8"
    #                       Workshop
    $global:workshop        = "1"
    #                       SV_Pure
    $global:sv_pure         = "0"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    ##############################/\##############################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir\insurgency"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\insurgency\cfg"
    #                       Server Executable
    $global:executable      = "srcds"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "insurgency"
    #                       Game Process
    $global:process         = "srcds"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\insurgency"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "Insurgency"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    If ($gslt) {
        $global:launchParams = '@("${executable} -game insurgency -strictportbind -ip ${ip} -port ${port} +hostname `"$hostname`" +clientport ${clientport} +tv_port ${sourcetvport} -tickrate ${tickrate} +sv_setsteamaccount ${gslt} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers ${maxplayers} +sv_lan ${sv_lan} +mp_coop_lobbysize ${coopplayers} +sv_workshop_enabled ${workshop} `"+sv_pure ${sv_pure}`" -condebug -norestart")'
    }
    Else {
        $global:launchParams = '@("${executable} -game insurgency -strictportbind -ip ${ip} -port ${port} +hostname `"$hostname`" +clientport ${clientport} +tv_port ${sourcetvport} -tickrate ${tickrate} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers ${maxplayers} +sv_lan ${sv_lan} +mp_coop_lobbysize ${coopplayers} +sv_workshop_enabled ${workshop} +sv_pure ${sv_pure} -condebug -norestart")'
    }
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Install Adjustment
    Get-InstallChangesINS
    Get-Gamemode
}


Function Get-InstallChangesINS {
    $subscribedfileids = "$serverdir\insurgency\subscribed_file_ids.txt"
    Add-Content $ssmlog "[$loggingDate] Creating subscribed_file_ids.txt "
    If (Test-Path $subscribedfileids) { 
        Add-Content $ssmlog "[$loggingDate] subscribed_file_ids.txt exists! "
    } 
    Else {
        New-Item $subscribedfileids -Force | Out-File -Append -Encoding Default  $ssmlog
    }
    
    $mapcycletxtfile = "$serverdir\insurgency\motd.txt"
    Add-Content $ssmlog "[$loggingDate] $serverdir\insurgency\motd.txt "
    If (Test-Path $mapcycletxtfile) { 
        Add-Content $ssmlog "[$loggingDate] motd.txt exists! "
    }
    Else {
        New-Item $mapcycletxtfile -Force | Out-File -Append -Encoding Default  $ssmlog
    }    
}
Function Get-Playlist {
    Write-Host "Checking playlist" 'info'
    if ($playlist -eq "comp") {
        Get-Infomessage "edit nwi/$playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_comp.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "coop") {
        Get-Infomessage "edit nwi/$playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_cooperative.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "coop_elite") {
        Get-Infomessage "edit nwi/$playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_cooperative.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "coop_hardcore") {
        Get-Infomessage "edit nwi/$playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_cooperative.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "pvp_sustained") {
        Get-Infomessage "edit nwi/$playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_sustained_combat.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "pvp_tactical") {
        Get-Infomessage "edit nwi/$playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_tactical_operations.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "conquer") {
        Get-Infomessage "edit nwi/$playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_conquer.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($null -eq $playlist) {
        Get-Infomessage "entered blank or null" 'info'
    }
}
                

Function Set-Gamemode {
    Write-Host "Enter one of the listed modes" -ForegroundColor Yellow
    Write-Host "comp" -ForegroundColor Yellow
    Write-Host "coop" -ForegroundColor Yellow
    Write-Host "coop_elite" -ForegroundColor Yellow
    Write-Host "coop_hardcore" -ForegroundColor Yellow
    Write-Host "pvp_sustained" -ForegroundColor Yellow
    Write-Host "pvp_tactical" -ForegroundColor Yellow
    Write-Host "conquer" -ForegroundColor Yellow
    $playlist = Read-Host "Enter mode, Will add Mapcycle per mode"
    if (($playlist -eq "comp") -or ($playlist -eq "coop") -or ($playlist -eq "coop_elite") -or ($playlist -eq "coop_hardcore") -or ($playlist -eq "pvp_sustained") -or ($playlist -eq "pvp_tactical") -or ($playlist -eq "conquer")) {
        Get-Infomessage "Editing nwi/$playlist playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "sv_playlist `"nwi/coop`"", "sv_playlist `"nwi/$playlist`"") | Set-Content -Path $servercfgdir\server.cfg
        # Get-Playlist
    }
    else {
        Get-Infomessage " listed modes does not exist" 'info'
        Set-Gamemode 
    }
}
Function Get-Gamemode {
    $title = 'Set playlist and Mapcycle now?'
    $question = 'Set Gamemode (playlist) and Mapcycle now?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    if ($decision -eq 0) {
        Set-Gamemode
        Write-Host 'Entered Y'
    } 
    else {
        Write-Host 'Entered N'
    }
}
