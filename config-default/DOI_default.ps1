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
    $global:defaultmap      = "bastogne "
    #                       SV_LAN
    $global:sv_lan          = "0"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Coop players
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
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Configs
    $global:gamedirname     = "DayOfInfamy"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -game doi -strictportbind -usercon -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} -tickrate ${tickrate} +map `"${defaultmap}`" +servercfgfile ${servercfg} +maxplayers ${maxplayers} +sv_lan ${sv_lan }+mp_coop_lobbysize ${coopplayers} +sv_workshop_enabled ${workshop} +sv_pure ${sv_pure} -condebug")'
    # Get User Input version must be set to 0
    Get-UserInput
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
    $subscribedfileids =  "$systemdir\subscribed_file_ids.txt"
    Add-Content $ssmlog "[$loggingDate] Creating subscribed_file_ids.txt "
     If (Test-Path $subscribedfileids) { 
         Add-Content $ssmlog "[$loggingDate] subscribed_file_ids.txt exists! "
     } 
     Else {
         New-Item $subscribedfileids -Force | Out-File -Append -Encoding Default  $ssmlog
     }
     $mapcycletxtfile = "$systemdir\motd.txt"
     Add-Content $ssmlog "[$loggingDate] $serverdir\insurgency\motd.txt "
     If (Test-Path $mapcycletxtfile) { 
         Add-Content $ssmlog "[$loggingDate] motd.txt exists! "
     }
     Else {
        New-Item $mapcycletxtfile -Force | Out-File -Append -Encoding Default  $ssmlog
     }
    Get-Gamemodedoi
}
Function Get-Playlistdoi {
    Get-Infomessage "Checking playlist" 'info'
    if ($playlist -eq "coop_commando") {
        Get-Infomessage "edit nwi/$playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"mapcycle_coop.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "coop") {
        Get-Infomessage "edit nwi/$playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"mapcycle_coop.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "mp_battles") {
        Get-Infomessage "edit nwi/$playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"Mapcycle_mp_battles.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "mp_casual_with_bots") {
        Get-Infomessage "edit nwi/$playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"Mapcycle_mp_casual_with_bots.txt`"") | Set-Content -Path $servercfgdir\server.cfg
        #}elseif($playlist -eq "mp_first_deployment"){
        #                    ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "// Playlist","mapcyclefile `"mapcycle.txt`"") | Set-Content -Path $servercfgdir\server.cfg
    }
    elseif ($playlist -eq "mp_special_assignments") {
        Get-Infomessage "edit nwi/$playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "// Playlist", "mapcyclefile `"Mapcycle_mp_special_assignments.txt`"") | Set-Content -Path $servercfgdir\server.cfg
        #}elseif($playlist -eq "conquer"){
        #                            ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "//mapcyclefile `"mapcycle.txt`"","mapcyclefile `"mapcycle_conquer.txt`"") | Set-Content -Path $servercfgdir\server.cfg
        #}elseif($null -eq $playlist) {
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
        Get-Infomessage "Editing nwi/$playlist playlist in server.cfg" 'info'
        ((Get-Content -path $servercfgdir\server.cfg -Raw) -replace "`"sv_playlist`" 		  `"nwi/coop`"", "sv_playlist `"nwi/$playlist`"") | Set-Content -Path $servercfgdir\server.cfg
        # Get-Playlistdoi
    }
    else {
        Get-Infomessage " mode does not exist" 'info'
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

    Write-Host "Creating Mapcycle_coop.txt" 'info'
    New-Item $systemdir\Mapcycle_coop.txt -Force | Out-File -Append -Encoding Default  $ssmlog
    # - - - - - - MAPCYCLE.TXT - - - - - - - - - -# EDIT \/   \/   \/  \/  \/  \/ \/ \/ \/
    Add-Content   $systemdir\Mapcycle_coop.txt "bastogne"
    Add-Content   $systemdir\Mapcycle_coop.txt "comacchio"
    Add-Content   $systemdir\Mapcycle_coop.txt "crete"
    Add-Content   $systemdir\Mapcycle_coop.txt "dog_red"
    Add-Content   $systemdir\Mapcycle_coop.txt "foy"
    Add-Content   $systemdir\Mapcycle_coop.txt "ortona"
    Add-Content   $systemdir\Mapcycle_coop.txt "reichswald"
    Add-Content   $systemdir\Mapcycle_coop.txt "saint_lo"
    Add-Content   $systemdir\Mapcycle_coop.txt "salerno"
    Add-Content   $systemdir\Mapcycle_coop.txt "sicily"
    Add-Content   $systemdir\Mapcycle_coop.txt "rhineland"
    Add-Content   $systemdir\Mapcycle_coop.txt "vbreville"
    Add-Content   $systemdir\Mapcycle_coop.txt "dunkirk"
    Add-Content   $systemdir\Mapcycle_coop.txt "brittany"
    Add-Content   $systemdir\Mapcycle_coop.txt "flakturm"
    Add-Content   $systemdir\Mapcycle_coop.txt "bastogne"
    Add-Content   $systemdir\Mapcycle_coop.txt "comacchio"
    Add-Content   $systemdir\Mapcycle_coop.txt "crete"
    Add-Content   $systemdir\Mapcycle_coop.txt "dog_red"
    Add-Content   $systemdir\Mapcycle_coop.txt "foy"
    Add-Content   $systemdir\Mapcycle_coop.txt "ortona"
    Add-Content   $systemdir\Mapcycle_coop.txt "reichswald"
    Add-Content   $systemdir\Mapcycle_coop.txt "saint_lo"
    Add-Content   $systemdir\Mapcycle_coop.txt "salerno"
    Add-Content   $systemdir\Mapcycle_coop.txt "sicily"
    Add-Content   $systemdir\Mapcycle_coop.txt "rhineland"
    Add-Content   $systemdir\Mapcycle_coop.txt "bastogne"
    Add-Content   $systemdir\Mapcycle_coop.txt "comacchio"
    Add-Content   $systemdir\Mapcycle_coop.txt "crete"
    Add-Content   $systemdir\Mapcycle_coop.txt "dog_red"
    Add-Content   $systemdir\Mapcycle_coop.txt "foy"
    Add-Content   $systemdir\Mapcycle_coop.txt "ortona"
    Add-Content   $systemdir\Mapcycle_coop.txt "reichswald"
    Add-Content   $systemdir\Mapcycle_coop.txt "saint_lo"
    Add-Content   $systemdir\Mapcycle_coop.txt "salerno"
    Add-Content   $systemdir\Mapcycle_coop.txt "sicily"
    Add-Content   $systemdir\Mapcycle_coop.txt "rhineland"
    Add-Content   $systemdir\Mapcycle_coop.txt "breville"
    Add-Content   $systemdir\Mapcycle_coop.txt "dunkirk"
    Add-Content   $systemdir\Mapcycle_coop.txt "brittany"
    Add-Content   $systemdir\Mapcycle_coop.txt "flakturm"
    # PVP modes: mp_battles.playlist
    Write-Host " Creating Mapcycle_mp_battles.txt " 'info'
    New-Item    $systemdir\Mapcycle_mp_battles.txt -Force | Out-File -Append -Encoding Default  $ssmlog
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "bastogne"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "comacchio"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "crete"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "dog_red"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "foy"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "ortona"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "reichswald"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "saint_lo"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "salerno"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "sicily"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "rhineland"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "breville"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "dunkirk"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "brittany"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "flakturm"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "bastogne"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "comacchio"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "crete"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "foy"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "ortona"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "reichswald"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "saint_lo"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "salerno"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "sicily"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "breville"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "rhineland"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "flakturm"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "bastogne"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "comacchio"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "crete"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "foy"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "ortona"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "reichswald"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "saint_lo"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "salerno"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "sicily"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "rhineland"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "breville"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "dunkirk"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "brittany"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "bastogne"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "sicily"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "dog_red"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "foy"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "crete"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "ortona"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "breville"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "dunkirk"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "brittany"
    Add-Content   $systemdir\Mapcycle_mp_battles.txt "flakturm"
    # mp_special_assignments.playlist
    Write-Host "Creating Mapcycle_mp_special_assignments.txt" 'info'
    New-Item   $systemdir\Mapcycle_mp_special_assignments.txt -Force | Out-File -Append -Encoding Default  $ssmlog
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "bastogne"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "comacchio"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "crete"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "foy"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "ortona"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "reichswald"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "saint_lo"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "salerno"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "sicily"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "rhineland"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "breville"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "brittany"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "ortona"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "comacchio"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "reichswald"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "saint_lo"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "salerno"	
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "sicily"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "foy"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "rhineland"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "breville"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "ortona"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "reichswald"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "salerno"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "saint_lo"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "rhineland"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "breville"
    Add-Content   $systemdir\Mapcycle_mp_special_assignments.txt "brittany"
    # mp_casual_with_bots.playlist
    Get-Infomessage "Mapcycle_mp_casual_with_bots.txt" 'info'
    New-Item   $systemdir\Mapcycle_mp_casual_with_bots.txt -Force | Out-File -Append -Encoding Default  $ssmlog
    #Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt 
    Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt "bastogne"
    Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt "comacchio"
    Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt "crete"
    Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt "dog_red"
    Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt "foy"
    Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt "ortona"
    Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt "reichswald"
    Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt "saint_lo"
    Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt "salerno"
    Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt "sicily"
    Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt "breville"
    Add-Content   $systemdir\Mapcycle_mp_casual_with_bots.txt "rhineland"
}