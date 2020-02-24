Function New-LaunchScriptdoiserverPS {
    #----------   DOI Server Install Function   -------------------
    # APP ID # 462310
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
    #                       Map
    $global:defaultmap      = "bastogne stronghold"
    #                       SV_LAN
    $global:sv_lan          = "0"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Coop players
    $global:coopplayer     = "8"
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
    $global:systemdir       = "$serverdir\doi"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\doi\cfg"
    #                       Server Executable
    $global:executable      = "doi"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "doi"
    #                       Game Process
    $global:process         = "doi"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\doi"
    #                       Game-Server-Configs
    $global:gamedirname     = "DayOfInfamy"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -game doi -strictportbind -usercon -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} -tickrate ${tickrate} +map `"${defaultmap}`" +maxplayers ${maxplayers} +sv_lan ${sv_lan }+mp_coop_lobbysize ${coopplayers} +sv_workshop_enabled ${workshop} +sv_pure ${sv_pure} -condebug")'
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
    # Install Adjustment
    Get-InstallChangesdoi
}
Function Get-InstallChangesdoi {
    Write-Host "***  Creating subscribed_file_ids.txt ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item $servercfgdir\subscribed_file_ids.txt -Force
    Write-Host "***  Creating motd.txt ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item $servercfgdir\motd.txt -Force
    Get-Gamemodedoi
}
Function Get-Playlistdoi {
    Write-Host "Checking playlist" -ForegroundColor Yellow
    if ($playlist -eq "coop_commando") {
        Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"mapcycle_coop.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "coop") {
        Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"mapcycle_coop.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "mp_battles") {
        Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"Mapcycle_mp_battles.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "mp_casual_with_bots") {
        Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"Mapcycle_mp_casual_with_bots.txt`"") | Set-Content -Path $servercfgdir\server.cfg
        #}elseif($playlist -eq "mp_first_deployment"){
        #                    Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        #                    ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "// Playlist","mapcyclefile `"mapcycle.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "mp_special_assignments") {
        Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"Mapcycle_mp_special_assignments.txt`"") | Set-Content -Path $servercfgdir\server.cfg
        #}elseif($playlist -eq "conquer"){
        #                            Write-Host "edit nwi/$playlist in server.cfg" -ForegroundColor Magenta
        #                            ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"","mapcyclefile `"mapcycle_conquer.txt`"") | Set-Content -Path $servercfgdir\server.cfg
        #}elseif($null -eq $playlist) {
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
    $playlist = Read-Host 
    if (($playlist -eq "coop_commando") -or ($playlist -eq "coop") -or ($playlist -eq "mp_battles") -or ($playlist -eq "mp_casual_with_bots") -or ($playlist -eq "mp_special_assignments")) {
        Write-Host "Editing nwi/$playlist playlist in server.cfg" -ForegroundColor Magenta
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "`"sv_playlist`" 		  `"nwi/coop`"", "sv_playlist `"nwi/$playlist`"") | Set-Content -Path $servercfgdir\server.cfg
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

    Write-Host "***  Creating Mapcycle_coop.txt  ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item $servercfgdir\Mapcycle_coop.txt -Force
    # - - - - - - MAPCYCLE.TXT - - - - - - - - - -# EDIT \/   \/   \/  \/  \/  \/ \/ \/ \/
    Add-Content   $servercfgdir\Mapcycle_coop.txt "bastogne		stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "comacchio		stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "crete			stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "dog_red		stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "foy			stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "ortona		stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "reichswald	stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "saint_lo		stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "salerno       stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "sicily		stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "rhineland     stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "vbreville		stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "dunkirk		stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "brittany		stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "flakturm		stronghold"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "bastogne		raid"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "comacchio		raid"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "crete			raid"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "dog_red		raid"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "foy			raid"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "ortona		raid"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "reichswald	raid"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "saint_lo		raid"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "salerno       raid"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "sicily		raid"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "rhineland		raid"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "bastogne      entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "comacchio		entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "crete			entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "dog_red       entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "foy			entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "ortona		entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "reichswald    entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "saint_lo		entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "salerno       entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "sicily		entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "rhineland		entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "breville		entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "dunkirk		entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "brittany		entrenchment"
    Add-Content   $servercfgdir\Mapcycle_coop.txt "flakturm		entrenchment"
    # PVP modes: mp_battles.playlist
    Write-Host "***  Creating Mapcycle_mp_battles.txt  ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item    $servercfgdir\Mapcycle_mp_battles.txt -Force
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "bastogne	    offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "comacchio    offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "crete	    offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "dog_red		offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "foy	        offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "ortona		offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "reichswald	offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "saint_lo     offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "salerno		offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "sicily		offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "rhineland    offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "breville		offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "dunkirk		offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "brittany		offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "flakturm		offensive"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "bastogne		frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "comacchio	frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "crete		frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "foy          frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "ortona		frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "reichswald	frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "saint_lo     frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "salerno		frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "sicily		frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "breville		frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "rhineland    frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "flakturm		frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "bastogne		liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "comacchio	liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "crete		liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "foy          liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "ortona	    liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "reichswald	liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "saint_lo     liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "salerno		liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "sicily		liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "rhineland    liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "breville		liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "dunkirk		liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "brittany		liberation"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "bastogne     invasion"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "sicily       invasion"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "dog_red      invasion"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "foy          invasion"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "crete        invasion"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "ortona       invasion"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "breville		invasion"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "dunkirk		invasion"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "brittany	    invasion"
    Add-Content   $servercfgdir\Mapcycle_mp_battles.txt "flakturm		invasion"
    # mp_special_assignments.playlist
    Write-Host "***  Creating Mapcycle_mp_special_assignments.txt  ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item   $servercfgdir\Mapcycle_mp_special_assignments.txt -Force 
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "bastogne    firefight"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "comacchio	firefight"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "crete		firefight"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "foy			firefight"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "ortona		firefight"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "reichswald   firefight"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "saint_lo     firefight"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "salerno		firefight"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "sicily		firefight"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "rhineland	firefight"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "breville	firefight"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "brittany	firefight"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "ortona		sabotage"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "comacchio	sabotage"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "reichswald  sabotage"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "saint_lo     sabotage"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "salerno       sabotage"	
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "sicily         sabotage"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "foy           sabotage"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "rhineland     sabotage"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "breville		sabotage"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "ortona           intel"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "reichswald     intel"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "salerno         intel"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "saint_lo        intel"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "rhineland		intel"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "breville		intel"
    Add-Content   $servercfgdir\Mapcycle_mp_special_assignments.txt "brittany		intel"
    # mp_casual_with_bots.playlist
    Write-Host "***  Mapcycle_mp_casual_with_bots.txt  ***" -ForegroundColor Magenta -BackgroundColor Black
    New-Item   $servercfgdir\Mapcycle_mp_casual_with_bots.txt -Force 
    #Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt 
    Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt "bastogne			frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt "comacchio			frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt "crete				frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt "dog_red			invasion"
    Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt "foy                frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt "ortona				frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt "reichswald			frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt "saint_lo           frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt "salerno			frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt "sicily				frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt "breville			frontline"
    Add-Content   $servercfgdir\Mapcycle_mp_casual_with_bots.txt "rhineland          frontline"
}