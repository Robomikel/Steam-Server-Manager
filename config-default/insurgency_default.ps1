# Version 2.5
#----------   INS Server Install Function   -------------------
Function New-LaunchScriptInsserverPS {
    # Requiered Dont change 
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
    If ( $global:Version -eq "1" ) {

        Write-Host '*** Configure Instance *****' -ForegroundColor Yellow -BackgroundColor Black
        Write-Host "Input Server local IP: " -ForegroundColor Cyan -NoNewline
        ${global:IP} = Read-Host
        if ((${global:PORT} = Read-Host -Prompt (Write-Host "Input Server Port,Press enter to accept default value [27015]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:PORT = "27015" }else { $global:PORT }
        if (($global:CLIENTPORT = Read-Host -Prompt (Write-Host "Input Server Client Port, Press enter to accept default value [27005]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:CLIENTPORT = "27005" }else { $global:CLIENTPORT }
        if (($global:SOURCETVPORT = Read-Host -Prompt (Write-Host "Input Server Source TV Port, Press enter to accept default value [27020]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:SOURCETVPORT = "27020" }else { $global:SOURCETVPORT }
        if (($global:TICKRATE = Read-Host -Prompt (Write-Host "Input Server Tickrate,Press enter to accept default value [64]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:TICKRATE = "64" }else { $global:TICKRATE }  
        Write-Host "Input Game Server Token: " -ForegroundColor Cyan -NoNewline
        $global:GSLT = Read-Host
        if (($global:MAP = Read-Host -Prompt (Write-Host "Input Server Map and Mode,Press enter to accept default value [buhriz_coop checkpoint]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:MAP = "buhriz_coop checkpoint" }else { $global:MAP }
        Write-Host 'Input maxplayers (lobby size [24-48]): ' -ForegroundColor Cyan -NoNewline
        $global:MAXPLAYERS = Read-host
        if (($global:SV_LAN = Read-Host -Prompt (Write-Host "Input SV_LAN,Press enter to accept default value [0]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:SV_LAN = "0" }else { $global:SV_LAN }
        Write-Host 'Input players  (mp_coop_lobbysize [1-8]): ' -ForegroundColor Cyan -NoNewline  
        $global:COOPPLAYERS = Read-host
        if (($global:WORKSHOP = Read-Host -Prompt (Write-Host "Input 1 to enable workshop, Press enter to accept default value [0]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:WORKSHOP = "0" }else { $global:WORKSHOP }
        if (($global:SV_PURE = Read-Host -Prompt (Write-Host "Input +sv_pure, Press enter to accept default value [1]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:SV_PURE = "1" }else { $global:SV_PURE } 
        Write-Host 'Input hostname: ' -ForegroundColor Cyan -NoNewline 
        $global:HOSTNAME = Read-host
        if (($global:RCONPASSWORD = Read-Host -Prompt (Write-Host "Input Server Rcon Password,Press enter to accept default value [$global:RANDOMPASSWORD]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:RCONPASSWORD = "$global:RANDOMPASSWORD" }else { $global:RCONPASSWORD }
    }
    ElseIf ( $global:Version -eq "2" ) {
        #  First Run Vars \/ \/ Add Here
        ${global:IP} = "${global:IP}"
        ${global:PORT} = "27015"
        $global:CLIENTPORT = "27005"
        $global:SOURCETVPORT = "27020"
        $global:TICKRATE = "64"
        $global:GSLT = ""
        $global:MAP = "buhriz_coop checkpoint"
        $global:MAXPLAYERS = "32"
        $global:SV_LAN = "0"
        $global:COOPPLAYERS = "8"
        $global:WORKSHOP = "1"
        $global:SV_PURE = "0"
        $global:HOSTNAME = "$env:USERNAME"
        $global:RCONPASSWORD = "$global:RANDOMPASSWORD"
        #     Add here     /\ /\ /\

    }
    ElseIf ( $global:Version -eq "0" ) {
             Get-UserInput 1 1 0 0 1 1 1 1
    }  

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
