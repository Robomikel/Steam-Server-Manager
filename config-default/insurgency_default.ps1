
Function New-LaunchScriptInsserverPS {
    #----------   INS Server Install Function   -------------------
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:PORT            = "27015"
    #                       Client Port
    $global:CLIENTPORT      = "27005"
    #                       Source TV Port
    $global:SOURCETVPORT    = "27020"
    #                       Tickrate
    $global:TICKRATE        = "64"
    #                       Game Server Token
    $global:GSLT            = ""
    #                       Map
    $global:MAP             = "buhriz_coop checkpoint"
    #                       Maxplayers
    $global:MAXPLAYERS      = "32"
    #                       SV_LAN
    $global:SV_LAN          = "0"
    #                       Coop Players
    $global:COOPPLAYERS     = "8"
    #                       Workshop
    $global:WORKSHOP        = "1"
    #                       SV_Pure
    $global:SV_PURE         = "0"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    # # Version 2.0
    $global:MODDIR = "insurgency"
    $global:EXE = "srcds"
    $global:EXEDIR = ""
    $global:GAME = "insurgency"
    $global:PROCESS = "srcds"
    $global:SERVERCFGDIR = "insurgency\cfg"
    
    Get-StopServerInstall
    # Game-server-configs \/
    $global:gamedirname = "Insurgency"
    $global:config1 = "server.cfg"
    Get-Servercfg
    $global:RCONPORT = "${global:PORT}"
    # - - - - - - - - - - - - -

    # Get-UserInput 1 1 0 0 1 1 1 1
    

    Select-EditSourceCFG
    Write-Host "***  Creating subscribed_file_ids.txt ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item $global:currentdir\$global:server\insurgency\subscribed_file_ids.txt -Force
    Write-Host "***  Creating motd.txt ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item $global:currentdir\$global:server\insurgency\motd.txt -Force
     
    $global:launchParams = '@("$global:EXE -game insurgency -strictportbind -ip ${global:IP} -port ${global:PORT} +clientport ${global:CLIENTPORT} +tv_port ${global:SOURCETVPORT} -tickrate ${global:TICKRATE} +sv_setsteamaccount ${global:GSLT} +map ${global:MAP} -maxplayers ${global:MAXPLAYERS} +sv_lan $global:SV_LAN +mp_coop_lobbysize ${global:COOPPLAYERS} +sv_workshop_enabled ${global:WORKSHOP} +sv_pure ${global:SV_PURE} -condebug -norestart")'
    Get-SourceMetMod
    Get-Gamemode
}



Function Get-Playlist {
    Write-Host "Checking playlist" -ForegroundColor Yellow
    if ($global:playlist -eq "comp") {
        Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_comp.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
    }
    elseif ($global:playlist -eq "coop") {
        Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_cooperative.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
    }
    elseif ($global:playlist -eq "coop_elite") {
        Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_cooperative.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
    }
    elseif ($global:playlist -eq "coop_hardcore") {
        Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_cooperative.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
    }
    elseif ($global:playlist -eq "pvp_sustained") {
        Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_sustained_combat.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
    }
    elseif ($global:playlist -eq "pvp_tactical") {
        Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_tactical_operations.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
    }
    elseif ($global:playlist -eq "conquer") {
        Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"", "mapcyclefile `"mapcycle_conquer.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
    }
    elseif ($null -eq $global:playlist) {
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
    $global:playlist = Read-Host "Enter mode, Will add Mapcycle per mode"
    if (($global:playlist -eq "comp") -or ($global:playlist -eq "coop") -or ($global:playlist -eq "coop_elite") -or ($global:playlist -eq "coop_hardcore") -or ($global:playlist -eq "pvp_sustained") -or ($global:playlist -eq "pvp_tactical") -or ($global:playlist -eq "conquer")) {
        Write-Host "Editing nwi/$global:playlist playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "sv_playlist `"nwi/coop`"", "sv_playlist `"nwi/$global:playlist`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
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
