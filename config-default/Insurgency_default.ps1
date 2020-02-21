
Function New-LaunchScriptInsserverPS {
    #----------   INS Server Install Function   -------------------
    # APP ID # 237410
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Tickrate
    $global:tickrate        = "64"
    #                       Game Server Token
    $global:gslt            = "GameServerTokenHere"
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
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    ##############################/\##############################
    
    
    
    ###################### Do not change below #####################
    # # Version 2.0
    $global:systemdir = "$serverdir\insurgency"
    $global:executable = "srcds"
    $global:executabledir = "$serverdir"
    $global:querytype = "insurgency"
    $global:process = "srcds"
    $global:servercfgdir = "$serverdir\insurgency\cfg"
    $global:logdirectory = "$serverdir\Insurgency\Saved\Logs"
    
    Get-StopServerInstall
    # Game-server-configs \/
    $global:gamedirname = "Insurgency"
    $global:servercfg = "server.cfg"
    Get-Servercfg
    # - - - - - - - - - - - - -

    # Get-UserInput 1 1 0 0 1 1 1 1
    

    Select-EditSourceCFG
    Write-Host "***  Creating subscribed_file_ids.txt ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item $serverdir\insurgency\subscribed_file_ids.txt -Force
    Write-Host "***  Creating motd.txt ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item $serverdir\insurgency\motd.txt -Force
     
    $global:launchParams = '@("$executable -game insurgency -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} -tickrate ${tickrate} +sv_setsteamaccount ${gslt} +map ${defaultmap} -maxplayers ${maxplayers} +sv_lan ${sv_lan} +mp_coop_lobbysize ${coopplayers} +sv_workshop_enabled ${workshop} +sv_pure ${sv_pure} -condebug -norestart")'
    #Get-SourceMetMod
    Get-Gamemode
}



Function Get-Playlist {
    Write-Host "Checking playlist" -ForegroundColor Yellow
    if ($playlist -eq "comp") {
        Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_comp.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "coop") {
        Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_cooperative.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "coop_elite") {
        Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_cooperative.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "coop_hardcore") {
        Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_cooperative.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "pvp_sustained") {
        Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_sustained_combat.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "pvp_tactical") {
        Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_tactical_operations.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "conquer") {
        Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_conquer.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($null -eq $playlist) {
        Write-Host "entered blank or null" -ForegroundColor Red
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
        Write-Host "Editing nwi/$playlist playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "sv_playlist `"nwi/coop`"", "sv_playlist `"nwi/$playlist`"") | Set-Content -Path $servercfgdir\server.cfg
        Get-Playlist
    }
    else {
        Write-Host " listed modes does not exist" -ForegroundColor Yellow
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
