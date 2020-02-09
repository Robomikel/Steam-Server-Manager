Function New-LaunchScriptdoiserverPS {
    #----------   DOI Server Install Function   -------------------
    # APP ID # 462310
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
    #                       Map
    $global:MAP             = "bastogne stronghold"
    #                       SV_LAN
    $global:SV_LAN          = "0"
    #                       Maxplayers
    $global:MAXPLAYERS      = "32"
    #                       Coop players
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

    # Steamer Vars Do Not Edit
    $global:MODDIR = "doi"
    $global:EXEDIR = ""
    $global:EXE = "doi"
    $global:GAME = "doi"
    $global:PROCESS = "doi"
    $global:SERVERCFGDIR = "doi\cfg"
    $global:RCONPORT = "$global:PORT"
    Get-StopServerInstall
    # Game-Server-Configs
    $global:gamedirname = "DayOfInfamy"
    $global:config1 = "server.cfg"

    Get-Servercfg
    Select-RenameSource
    $global:RCONPORT = "${global:PORT}"

    
    Select-EditSourceCFG
    # VERSION 2 Requieres  Vars
    $global:launchParams = '@("$global:EXE -game doi -strictportbind -usercon -ip ${global:IP} -port ${global:PORT} +clientport ${global:CLIENTPORT} +tv_port ${global:SOURCETVPORT} -tickrate ${global:TICKRATE} +map `"${global:MAP}`" +maxplayers ${global:MAXPLAYERS} +sv_lan ${global:SV_LAN }+mp_coop_lobbysize ${global:COOPPLAYERS} +sv_workshop_enabled ${global:WORKSHOP} +sv_pure ${global:SV_PURE} -condebug")'
    # -game doi -strictportbind           -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} -tickrate ${tickrate} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers ${maxplayers} -workshop"
    #start srcds.exe -usercon +maxplayers 24 +sv_lan 0 +map "bastogne offensive"              
    Write-Host "***  Creating subscribed_file_ids.txt ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item $global:currentdir\$global:server\doi\subscribed_file_ids.txt -Force
    Write-Host "***  Creating motd.txt ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item $global:currentdir\$global:server\doi\motd.txt -Force
    Get-Gamemodedoi
    #Get-SourceMetMod
}
# not used in DOI 
#server.cfg		// this is your primary server config file containing global variables
#default_server_<mode>.cfg		// default file which contains settings for specific mode
#server_<mode>.cfg         // non-default config, overrides default, use this for custom servers
#server_<map>.cfg		// optional file for settings per-map
#server_<map>_<mode>.cfg		// optional file for settings per-map-gamemode
Function Get-Playlistdoi {
    Write-Host "Checking playlist" -ForegroundColor Yellow
    if ($global:playlist -eq "coop_commando") {
        Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"mapcycle_coop.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
    }
    elseif ($global:playlist -eq "coop") {
        Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"mapcycle_coop.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
    }
    elseif ($global:playlist -eq "mp_battles") {
        Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"Mapcycle_mp_battles.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
    }
    elseif ($global:playlist -eq "mp_casual_with_bots") {
        Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"Mapcycle_mp_casual_with_bots.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
        #}elseif($global:playlist -eq "mp_first_deployment"){
        #                    Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        #                    ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "// Playlist","mapcyclefile `"mapcycle.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
    }
    elseif ($global:playlist -eq "mp_special_assignments") {
        Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"Mapcycle_mp_special_assignments.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
        #}elseif($global:playlist -eq "conquer"){
        #                            Write-Host "edit nwi/$global:playlist in server.cfg" -ForegroundColor Magenta
        #                            ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"","mapcyclefile `"mapcycle_conquer.txt`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
        #}elseif($null -eq $global:playlist) {
        #                                Write-Host "entered blank or null" -ForegroundColor Red
    }
}
Function Set-Gamemodedoi {
    #nwi/coop_commando
    #nwi/coop
    #nwi/mp_battles *
    #nwi/mp_casual_with_bots *
    #nwi/mp_first_deployment
    #nwi/mp_special_assignments *
    # for coop gamemodes are the folllowing
    # raid, entrenchment, stronghold
    # with 2 ruleset playlist commando & infantry
    Write-Host "Enter one of the listed modes" -ForegroundColor Yellow
    Write-Host "coop_commando" -ForegroundColor Yellow
    Write-Host "coop" -ForegroundColor Yellow
    Write-Host "mp_battles" -ForegroundColor Yellow
    Write-Host "mp_casual_with_bots" -ForegroundColor Yellow
    #Write-Host "mp_first_deployment" -ForegroundColor Yellow
    Write-Host "mp_special_assignments" -ForegroundColor Yellow
    #Write-Host "conquer" -ForegroundColor Yellow
    Write-Host "Enter mode, Will add Mapcycle per mode: " -ForegroundColor Cyan -NoNewline
    $global:playlist = Read-Host 
    if (($global:playlist -eq "coop_commando") -or ($global:playlist -eq "coop") -or ($global:playlist -eq "mp_battles") -or ($global:playlist -eq "mp_casual_with_bots") -or ($global:playlist -eq "mp_special_assignments")) {
        Write-Host "Editing nwi/$global:playlist playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg -Raw) -replace "`"sv_playlist`" 		  `"nwi/coop`"", "sv_playlist `"nwi/$global:playlist`"") | Set-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\server.cfg
        Get-Playlistdoi
    }
    else {
        Write-Host " mode does not exist" -ForegroundColor Yellow
        Set-Gamemodedoi 
    }
}
Function Get-Gamemodedoi {
    $title = 'Set playlist and Mapcycles now?'
    $question = 'Set Gamemode (playlist will set Mapcycle) now?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    if ($decision -eq 0) {
        Set-Gamemodedoi
        new-mapcycles
        Write-Host 'Entered Y'
    }
    else {
        Write-Host 'Entered N'
    }

}
Function new-mapcycles {
    #mkdir $global:currentdir\$global:server\doi   >$null 2>&1
    $MapCyclePath = "$global:currentdir\$global:server\doi"
    Write-Host "***  Creating Mapcycle_coop.txt  ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item $MapCyclePath\Mapcycle_coop.txt -Force
    # - - - - - - MAPCYCLE.TXT - - - - - - - - - -# EDIT \/   \/   \/  \/  \/  \/ \/ \/ \/
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "bastogne		stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "comacchio		stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "crete			stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "dog_red		stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "foy			stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "ortona		stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "reichswald	stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "saint_lo		stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "salerno       stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "sicily		stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "rhineland     stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "vbreville		stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "dunkirk		stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "brittany		stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "flakturm		stronghold"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "bastogne		raid"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "comacchio		raid"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "crete			raid"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "dog_red		raid"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "foy			raid"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "ortona		raid"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "reichswald	raid"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "saint_lo		raid"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "salerno       raid"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "sicily		raid"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "rhineland		raid"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "bastogne      entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "comacchio		entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "crete			entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "dog_red       entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "foy			entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "ortona		entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "reichswald    entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "saint_lo		entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "salerno       entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "sicily		entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "rhineland		entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "breville		entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "dunkirk		entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "brittany		entrenchment"
    Add-Content   $MapCyclePath\Mapcycle_coop.txt "flakturm		entrenchment"
    # PVP modes: mp_battles.playlist
    Write-Host "***  Creating Mapcycle_mp_battles.txt  ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item    $MapCyclePath\Mapcycle_mp_battles.txt -Force
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "bastogne	    offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "comacchio    offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "crete	    offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "dog_red		offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "foy	        offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "ortona		offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "reichswald	offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "saint_lo     offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "salerno		offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "sicily		offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "rhineland    offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "breville		offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "dunkirk		offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "brittany		offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "flakturm		offensive"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "bastogne		frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "comacchio	frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "crete		frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "foy          frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "ortona		frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "reichswald	frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "saint_lo     frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "salerno		frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "sicily		frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "breville		frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "rhineland    frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "flakturm		frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "bastogne		liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "comacchio	liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "crete		liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "foy          liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "ortona	    liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "reichswald	liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "saint_lo     liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "salerno		liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "sicily		liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "rhineland    liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "breville		liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "dunkirk		liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "brittany		liberation"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "bastogne     invasion"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "sicily       invasion"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "dog_red      invasion"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "foy          invasion"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "crete        invasion"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "ortona       invasion"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "breville		invasion"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "dunkirk		invasion"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "brittany	    invasion"
    Add-Content   $MapCyclePath\Mapcycle_mp_battles.txt "flakturm		invasion"
    # mp_special_assignments.playlist
    Write-Host "***  Creating Mapcycle_mp_special_assignments.txt  ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item   $MapCyclePath\Mapcycle_mp_special_assignments.txt -Force 
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "bastogne    firefight"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "comacchio	firefight"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "crete		firefight"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "foy			firefight"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "ortona		firefight"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "reichswald   firefight"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "saint_lo     firefight"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "salerno		firefight"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "sicily		firefight"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "rhineland	firefight"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "breville	firefight"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "brittany	firefight"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "ortona		sabotage"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "comacchio	sabotage"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "reichswald  sabotage"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "saint_lo     sabotage"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "salerno       sabotage"	
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "sicily         sabotage"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "foy           sabotage"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "rhineland     sabotage"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "breville		sabotage"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "ortona           intel"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "reichswald     intel"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "salerno         intel"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "saint_lo        intel"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "rhineland		intel"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "breville		intel"
    Add-Content   $MapCyclePath\Mapcycle_mp_special_assignments.txt "brittany		intel"
    # mp_casual_with_bots.playlist
    Write-Host "***  Mapcycle_mp_casual_with_bots.txt  ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt -Force 
    #Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt 
    Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt "bastogne			frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt "comacchio			frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt "crete				frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt "dog_red			invasion"
    Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt "foy                frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt "ortona				frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt "reichswald			frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt "saint_lo           frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt "salerno			frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt "sicily				frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt "breville			frontline"
    Add-Content   $MapCyclePath\Mapcycle_mp_casual_with_bots.txt "rhineland          frontline"
}