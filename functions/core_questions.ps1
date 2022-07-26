#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Set-SteamInfo {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $title = 'Install Steam server with Anonymous login'
    $question = 'Use Anonymous Login?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    If ($decision -eq 1) {
        $global:anon = "yes"
        #Install-Anonserver
        Install-ServerFiles
        Write-Host 'Entered Y'
    }
    Else {
        $global:anon = "no"
        #Install-Anonserver
        Install-ServerFiles
        Write-Host 'Entered N'
    }
}
Function New-TryagainNew {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $title = 'Try again?'
    $question = "$command $serverfiles ?"
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Select-Steamer $command $serverfiles
        exit
    }
    Else {
        Write-Host 'Entered N'
        Pop-Location
        Exit
    }
}
Function New-TryagainSteam {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $title = ' Install Successful?'
    $question = "Was the Install Successful?"
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Pop-Location
    }
    Else {
        Write-Host 'Entered N'
        Select-Steamer $command $serverfiles
        Exit
    }
}
Function New-TryagainSteamLogin {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $title = ' Login Successful?'
    $question = "Was the Login Successful?"
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Pop-Location
    }
    Else {
        Write-Host 'Entered N'
        Pop-Location
        Exit
    }
}
Function New-ServerFolderq {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $title = 'Server Folder Name does not exist!'
    $question = 'Would you like to to create new Server Folder Name?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Select-Steamer install $serverfiles
        Get-createdvaribles
    }
    Else {
        Write-Host 'Entered N'
        Exit
    }
}
Function Get-OxideQ {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $title = 'Download Oxide'
    $question = 'Download Oxide and install?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Get-Oxide
        Write-Host 'Entered Y'
    } 
    Else {
        Write-Host 'Entered N'
    }
}
Function Get-SourceMetaModQ {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $title = 'Download MetaMod and SourceMod'
    $question = 'Download MetaMod, SourceMod and install?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        # Get-SourceMetaMod
        Get-MetaMod
        Get-SourceMod
        Write-Host 'Entered Y'
    } 
    Else {
        Write-Host 'Entered N'
    }
}
Function Get-InstallForgeQ {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $title = 'Download Forge'
    $question = 'Download Forge and install?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Get-InstallForge
        Write-Host 'Entered Y'
    } 
    Else {
        Write-Host 'Entered N'
    }
}
Function Set-MonitorJob {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $title = 'Create Monitor Task Job'
    $question = 'Run Task Whether user is logged on or not?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Get-ChecktaskUnreg
        New-MontiorJobBG
    }
    Else {
        Write-Host 'Entered N'
        Get-ChecktaskUnreg
        New-MontiorJob
    }
}
Function Set-RestartJob {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $title = 'Create Restart Task Job'
    $question = 'Run Task Whether user is logged on or not?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Get-ChecktaskUnreg
        New-RestartJobBG
    }
    Else {
        Write-Host 'Entered N'
        Get-ChecktaskUnreg
        New-RestartJob
    }
} 
Function New-AppDataSave {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $title = 'Game has Saves located in AppData'
    $question = 'Backup Appdata for server?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        New-backupAppdata
    } 
    Else {
        Write-Host 'Entered N'
        Exit
    }
}
Function New-LocalConfig {
    If ($advanced -eq 'on') {
        Write-log "Function: $($MyInvocation.Mycommand)"
        $title = 'New config-local Created'
        $question = 'Pause to edit config-local?'
        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
        If ($decision -eq 0) {
            Write-Information "Edit config-local in $currentdir\config-local\$getlocalssmname. Save and Press Enter..."
            pause 
            Import-localConfig       
        } 
        Else {
            Import-localConfig
        }
    } 
    Else {
        Import-localConfig
    }
}
Function Get-UserInput {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($advanced -eq 'off') {
        Set-Console
        # Write-Host "$SMILEY_BLACK Need More Input... $SMILEY_BLACK" -F Y
        Write-Host "Enter to Accept Default Value..." -F Y
        If ($ip) {
            $defaultip = "$ip"
            If (($global:IP = Read-Host -P(Write-Host "Enter Server IP, Press Enter to Accept default [$IP]: "-F CY -N )) -eq '') { $global:IP = "$defaultIP" }Else { $IP }
        }
        If ($port) {
            $defaultport = "$port" 
            If (($global:port = Read-Host -P(Write-Host "Enter Server PORT, Press Enter to Accept  [$PORT]: "-F CY -N )) -eq '') { $global:port = "$defaultPORT" }Else { $PORT }
        }
        If ($queryport) {
            $defaultquery = "$queryport"
            If (($global:queryport = Read-Host -P(Write-Host "Enter Server QUERY PORT, Press Enter to Accept  [$queryport]: "-F CY -N )) -eq '') { $global:queryport = "$defaultquery" }Else { $queryport }
        }
        If ($rconport) {
            $defaultrconport = "$rconport"
            If (($global:rconport = Read-Host -P(Write-Host "Enter Server RCON PORT, Press Enter to Accept  [$rconport]: "-F CY -N )) -eq '') { $global:rconport = "$defaultrconport" }Else { $rconport }
        }
        If ($rconpassword ) {
            If (($global:rconpassword = Read-Host -P(Write-Host "Enter Server RCON PASSWORD, Press Enter to Accept  [$randompassword]: "-F CY -N )) -eq '') { $global:rconpassword = "$randompassword" }Else { $rconpassword }
        }
        If ($hostname) {
            $defaulthostname = "$hostname"
            If (($global:hostname = Read-Host -P(Write-Host "Enter Server HOSTNAME, Press Enter to Accept  [$hostname]: "-F CY -N )) -eq '') { $global:hostname = "$defaulthostname" }Else { $hostname }
        }
        If ($serverpassword) {
            $defaultserverpassword = "$serverpassword"
            If (($global:serverpassword = Read-Host -P(Write-Host "Enter Server SERVER PASSWORD, Press Enter to Accept  [$serverpassword]: "-F CY -N )) -eq '') { $global:serverpassword = "$defaultserverpassword" }Else { $serverpassword }
        }
        If ($maxplayers) {
            $defaultmaxplayers = "$maxplayers"
            If (($global:maxplayers = Read-Host -P(Write-Host "Enter Server MAX PLAYERS, Press Enter to Accept  [$maxplayers]: "-F CY -N )) -eq '') { $global:maxplayers = "$defaultmaxplayers" }Else { $maxplayers }
        }
        If ($gslt) {
            $defaultgslt = "$gslt"
            If (($global:GSLT = Read-Host -P(Write-Host "Enter Server GSLT, Press Enter to Accept  [$gslt]: "-F CY -N )) -eq '') { $global:gslt = "$defaultgslt" }Else { $gslt }
        }
        If ($gst) {
            $defaultgst = "$gst"
            If (($global:gst = Read-Host -P(Write-Host "Enter Server gst, Press Enter to Accept  [$gst]: "-F CY -N )) -eq '') { $global:gst = "$defaultgst" }Else { $gst }
        }
        If ($oauthtoken) {
            $defaultoauthtoken = "$oauthtoken"
            If (($global:oauthtoken = Read-Host -P(Write-Host "Enter Server oauthtoken, Press Enter to Accept  [$oauthtoken]: "-F CY -N )) -eq '') { $global:oauthtoken = "$defaultoauthtoken" }Else { $oauthtoken }
        }
        If ($defaultmap) {
            $defaultdefaultmap = "$defaultmap"
            If (($global:defaultmap = Read-Host -P(Write-Host "Enter Server DEFAULT MAP, Press Enter to Accept  [$defaultmap]: "-F CY -N )) -eq '') { $global:defaultmap = "$defaultdefaultmap" }Else { $defaultmap }
        }
        If ($clientport) {
            $defaultclientport = "$clientport"
            If (($global:clientport = Read-Host -P(Write-Host "Enter Server CLIENT PORT, Press Enter to Accept  [$clientport]: "-F CY -N )) -eq '') { $global:clientport = "$defaultclientport" }Else { $clientport }
        }
        If ($sourcetvport) {
            $defaultsourcetvport = "$sourcetvport"
            If (($global:sourcetvport = Read-Host -P(Write-Host "Enter Server SOURCE TV PORT, Press Enter to Accept  [$sourcetvport]: "-F CY -N )) -eq '') { $global:sourcetvport = "$defaultsourcetvport" }Else { $sourcetvport }
        }
        If ($gamemode) {
            $defaultgamemode = "$gamemode"
            If (($global:gamemode = Read-Host -P(Write-Host "Enter Server GAME MODE, Press Enter to Accept  [$gamemode]: "-F CY -N )) -eq '') { $global:gamemode = "$defaultgamemode" }Else { $gamemode }
        }
        If ($diff ) {
            $defaultdiff = "$diff"
            If (($global:diff = Read-Host -P(Write-Host "Enter Server DIFFICULTY, Press Enter to Accept  [$diff]: "-F CY -N )) -eq '') { $global:diff = "$defaultdiff" }Else { $diff }
        }
        If ($adminpassword) {
            $defaultadminpassword = "$adminpassword"
            If (($global:ADMINPASSWORD = Read-Host -P(Write-Host "Enter Server ADMIN PASSWORD, Press Enter to Accept  [$adminpassword]: "-F CY -N )) -eq '') { $global:adminpassword = "$defaultadminpassword" }Else { $adminpassword }
        }
        If ($tickrate) {
            $defaulttickrate = "$tickrate"
            If (($global:tickrate = Read-Host -P(Write-Host "Enter Server TICKRATE, Press Enter to Accept  [$tickrate]: "-F CY -N )) -eq '') { $global:tickrate = "$defaulttickrate" }Else { $tickrate }
        }
        If ($saveinterval) {
            $defaultsaveinterval = "$saveinterval"
            If (($global:saveinterval = Read-Host -P(Write-Host "Enter Server SAVEINTERVAL, Press Enter to Accept  [$saveinterval]: "-F CY -N )) -eq '') { $global:saveinterval = "$defaultsaveinterval" }Else { $saveinterval }
        }
        If ($worldsize) {
            $defaultworldsize = "$worldsize"
            If (($global:worldsize = Read-Host -P(Write-Host "Enter Server WORLDSIZE, Press Enter to Accept  [$worldsize]: "-F CY -N )) -eq '') { $global:worldsize = "$defaultworldsize" }Else { $worldsize }
        }
        If ($seed) {
            $defaultseed = "$seed"
            If (($global:SEED = Read-Host -P(Write-Host "Enter Server SEED, Press Enter to Accept  [$seed]: "-F CY -N )) -eq '') { $global:seed = "$defaultseed" }Else { $seed }
        }
        If ($rconweb) {
            $defaultrconweb = "$rconweb"
            If (($global:rconweb = Read-Host -P(Write-Host "Enter Server RCONWEB, Press Enter to Accept  [$rconweb]: "-F CY -N )) -eq '') { $global:rconweb = "$defaultrconweb" }Else { $rconweb }
        }
        If ($steamID64) {
            $defaultsteamID64 = "$steamID64"
            If (($global:steamID64 = Read-Host -P(Write-Host "Enter STEAMID64, Press Enter to Accept  [$steamID64]: "-F CY -N )) -eq '') { $global:steamID64 = "$defaultsteamID64" }Else { $steamID64 }
        }
        If ($galaxyname) {
            $defaultgalaxyname = "$galaxyname"
            If (($global:galaxyname = Read-Host -P(Write-Host "Enter GALAXYNAME, Press Enter to Accept  [$galaxyname]: "-F CY -N )) -eq '') { $global:galaxyname = "$defaultgalaxyname" }Else { $galaxyname }
        }
        If ($mapgroup) {
            $defaultmapgroup = "$mapgroup"
            If (($global:mapgroup = Read-Host -P(Write-Host "Enter Server MAPGROUP, Press Enter to Accept  [$mapgroup]: "-F CY -N )) -eq '') { $global:mapgroup = "$defaultmapgroup" }Else { $mapgroup }
        }
        If ($gametype) {
            $defaultgametype = "$gametype"
            If (($global:gametype = Read-Host -P(Write-Host "Enter Server GAME TYPE, Press Enter to Accept  [$gametype]: "-F CY -N )) -eq '') { $global:gametype = "$defaultgametype" }Else { $gametype }
        }
        If ($coopplayers) {
            $defaultcoopplayers = "$coopplayers"
            If (($global:coopplayers = Read-Host -P(Write-Host "Enter Server COOP PLAYERS, Press Enter to Accept  [$coopplayers]: "-F CY -N )) -eq '') { $global:coopplayers = "$defaultcoopplayers" }Else { $coopplayers }
        }
        If ($sv_lan) {
            $defaultsv_lan = "$sv_lan"
            If (($global:sv_lan = Read-Host -P(Write-Host "Enter Server SV_LAN, Press Enter to Accept  [$sv_lan]: "-F CY -N )) -eq '') { $global:sv_lan = "$defaultsv_lan" }Else { $sv_lan }
        }
        If ($workshop) {
            $defaultworkshop = "$workshop"
            If (($global:workshop = Read-Host -P(Write-Host "Enter Server WORKSHOP, Press Enter to Accept  [$workshop]: "-F CY -N )) -eq '') { $global:workshop = "$defaultworkshop" }Else { $workshop }
        }
        If ($sv_pure) {
            $defaultsv_pure = "$sv_pure"
            If (($global:sv_pure = Read-Host -P(Write-Host "Enter Server SV_PURE, Press Enter to Accept  [$sv_pure]: "-F CY -N )) -eq '') { $global:sv_pure = "$defaultsv_pure" }Else { $sv_pure }
        }
        If ($parm28 -eq 1) {
            If ((${xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$xx]: "-F CY -N )) -eq '') { $xx = "$xx" }Else { $xx }
        }
        If ($parm29 -eq 1) {
            If ((${xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$xx]: "-F CY -N )) -eq '') { $xx = "$xx" }Else { $xx }
        }
    }
}
