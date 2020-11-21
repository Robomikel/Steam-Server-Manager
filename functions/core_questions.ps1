#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Set-SteamInfo {
    Write-log "Function: Set-SteamInfo"
    $title = 'Install Steam server with Anonymous login'
    $question = 'Use Anonymous Login?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    If ($decision -eq 1) {
        $script:anon = "yes"
        #Install-Anonserver
        Install-ServerFiles
        Write-Host 'Entered Y'
    }
    Else {
        $script:anon = "no"
        #Install-Anonserver
        Install-ServerFiles
        Write-Host 'Entered N'
    }
}
Function New-TryagainNew {
    Write-log "Function: New-TryagainNew"
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
        Set-Location $currentdir
        Exit
    }
}
Function New-TryagainSteam {
    Write-log "Function: New-TryagainSteam"
    $title = ' Install Successful?'
    $question = "Was the Install Successful?"
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Set-Location $currentdir
    }
    Else {
        Write-Host 'Entered N'
        Select-Steamer $command $serverfiles
        Exit
    }
}
Function New-TryagainSteamLogin {
    Write-log "Function: New-TryagainSteamLogin"
    $title = ' Login Successful?'
    $question = "Was the Login Successful?"
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Set-Location $currentdir
    }
    Else {
        Write-Host 'Entered N'
        Set-Location $currentdir
        Exit
    }
}
Function New-ServerFolderq {
    Write-log "Function: New-ServerFolderq"
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
    Write-log "Function: Get-OxideQ"
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
    Write-log "Function: Get-SourceMetaModQ"
    $title = 'Download MetaMod and SourceMod'
    $question = 'Download MetaMod, SourceMod and install?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Get-SourceMetaMod
        Write-Host 'Entered Y'
    } 
    Else {
        Write-Host 'Entered N'
    }
}
Function Get-InstallForgeQ {
    Write-log "Function: Get-InstallForgeQ"
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
    Write-log "Function: Set-MonitorJob"
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
    Write-log "Function: Set-RestartJob"
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
    Write-log "Function: New-AppDataSave"
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
    If ($Version -eq 1) {
        Write-log "Function: New-localConfig"
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
    Write-log "Function: Get-UserInput"
    If ($version -eq 0) {
        Set-Console
        Write-Host "$SMILEY_BLACK Need More Input... $SMILEY_BLACK" -F Y
        If ($ip) {
            $defaultip = "$ip"
            If (($script:IP = Read-Host -P(Write-Host "Enter Server IP, Press Enter to Accept default [$IP]: "-F CY -N )) -eq '') { $script:IP = "$defaultIP" }Else { $IP }
        }
        If ($port) {
            $defaultport = "$port" 
            If (($script:port = Read-Host -P(Write-Host "Enter Server PORT, Press Enter to Accept  [$PORT]: "-F CY -N )) -eq '') { $script:port = "$defaultPORT" }Else { $PORT }
        }
        If ($queryport) {
            $defaultquery = "$queryport"
            If (($script:queryport = Read-Host -P(Write-Host "Enter Server QUERY PORT, Press Enter to Accept  [$queryport]: "-F CY -N )) -eq '') { $script:queryport = "$defaultquery" }Else { $queryport }
        }
        If ($rconport) {
            $defaultrconport = "$rconport"
            If (($script:rconport = Read-Host -P(Write-Host "Enter Server RCON PORT, Press Enter to Accept  [$rconport]: "-F CY -N )) -eq '') { $script:rconport = "$defaultrconport" }Else { $rconport }
        }
        If ($rconpassword ) {
            If (($script:rconpassword = Read-Host -P(Write-Host "Enter Server RCON PASSWORD, Press Enter to Accept  [$randompassword]: "-F CY -N )) -eq '') { $script:rconpassword = "$randompassword" }Else { $rconpassword }
        }
        If ($hostname) {
            If (($script:hostname = Read-Host -P(Write-Host "Enter Server HOSTNAME, Press Enter to Accept  [SERVERNAME]: "-F CY -N )) -eq '') { $script:hostname = "SERVERNAME" }Else { $hostname }
        }
        If ($serverpassword) {
            $defaultserverpassword = "$serverpassword"
            If (($script:serverpassword = Read-Host -P(Write-Host "Enter Server SERVER PASSWORD, Press Enter to Accept  [$serverpassword]: "-F CY -N )) -eq '') { $script:serverpassword = "$defaultserverpassword" }Else { $serverpassword }
        }
        If ($maxplayers) {
            $defaultmaxplayers = "$maxplayers"
            If (($script:maxplayers = Read-Host -P(Write-Host "Enter Server MAX PLAYERS, Press Enter to Accept  [$maxplayers]: "-F CY -N )) -eq '') { $script:maxplayers = "$defaultmaxplayers" }Else { $maxplayers }
        }
        If ($gslt) {
            $defaultgslt = "$gslt"
            If (($script:GSLT = Read-Host -P(Write-Host "Enter Server GSLT, Press Enter to Accept  [$gslt]: "-F CY -N )) -eq '') { $script:gslt = "$defaultgslt" }Else { $gslt }
        }
        If ($defaultmap) {
            $defaultdefaultmap = "$defaultmap"
            If (($script:defaultmap = Read-Host -P(Write-Host "Enter Server default map, Press Enter to Accept  [$defaultmap]: "-F CY -N )) -eq '') { $script:defaultmap = "$defaultdefaultmap" }Else { $defaultmap }
        }
        If ($clientport) {
            $defaultclientport = "$clientport"
            If (($script:clientport = Read-Host -P(Write-Host "Enter Server client port, Press Enter to Accept  [$clientport]: "-F CY -N )) -eq '') { $script:clientport = "$defaultclientport" }Else { $clientport }
        }
        If ($sourcetvport) {
            $defaultsourcetvport = "$sourcetvport"
            If (($script:sourcetvport = Read-Host -P(Write-Host "Enter Server source tv port, Press Enter to Accept  [$sourcetvport]: "-F CY -N )) -eq '') { $script:sourcetvport = "$defaultsourcetvport" }Else { $sourcetvport }
        }
        If ($gamemode) {
            $defaultgamemode = "$gamemode"
            If (($script:gamemode = Read-Host -P(Write-Host "Enter Server GAME MODE, Press Enter to Accept  [$gamemode]: "-F CY -N )) -eq '') { $script:gamemode = "$defaultgamemode" }Else { $gamemode }
        }
        If ($diff ) {
            $defaultdiff = "$diff"
            If (($script:diff = Read-Host -P(Write-Host "Enter Server Difficulty, Press Enter to Accept  [$diff]: "-F CY -N )) -eq '') { $script:diff = "$defaultdiff" }Else { $diff }
        }
        If ($adminpassword) {
            $defaultadminpassword = "$adminpassword"
            If (($script:ADMINPASSWORD = Read-Host -P(Write-Host "Enter Server ADMIN PASSWORD, Press Enter to Accept  [$adminpassword]: "-F CY -N )) -eq '') { $script:adminpassword = "$defaultadminpassword" }Else { $adminpassword }
        }
        If ($tickrate) {
            $defaulttickrate = "$tickrate"
            If (($script:tickrate = Read-Host -P(Write-Host "Enter Server TICKRATE, Press Enter to Accept  [$tickrate]: "-F CY -N )) -eq '') { $script:tickrate = "$defaulttickrate" }Else { $tickrate }
        }
        If ($saveinterval) {
            $defaultsaveinterval = "$saveinterval"
            If (($script:saveinterval = Read-Host -P(Write-Host "Enter Server SAVEINTERVAL, Press Enter to Accept  [$saveinterval]: "-F CY -N )) -eq '') { $script:saveinterval = "$defaultsaveinterval" }Else { $saveinterval }
        }
        If ($worldsize) {
            $defaultworldsize = "$worldsize"
            If (($script:worldsize = Read-Host -P(Write-Host "Enter Server WORLDSIZE, Press Enter to Accept  [$worldsize]: "-F CY -N )) -eq '') { $script:worldsize = "$defaultworldsize" }Else { $worldsize }
        }
        If ($seed) {
            $defaultseed = "$seed"
            If (($script:SEED = Read-Host -P(Write-Host "Enter Server SEED, Press Enter to Accept  [$seed]: "-F CY -N )) -eq '') { $script:seed = "$defaultseed" }Else { $seed }
        }
        If ($rconweb) {
            $defaultrconweb = "$rconweb"
            If (($script:rconweb = Read-Host -P(Write-Host "Enter Server RCONWEB, Press Enter to Accept  [$rconweb]: "-F CY -N )) -eq '') { $script:rconweb = "$defaultrconweb" }Else { $rconweb }
        }
        If ($steamID64) {
            $defaultsteamID64 = "$steamID64"
            If (($script:steamID64 = Read-Host -P(Write-Host "Enter steamID64, Press Enter to Accept  [$steamID64]: "-F CY -N )) -eq '') { $script:steamID64 = "$defaultsteamID64" }Else { $steamID64 }
        }
        If ($galaxyname) {
            $defaultgalaxyname = "$galaxyname"
            If (($script:galaxyname = Read-Host -P(Write-Host "Enter GALAXYNAME, Press Enter to Accept  [$galaxyname]: "-F CY -N )) -eq '') { $script:galaxyname = "$defaultgalaxyname" }Else { $galaxyname }
        }
        If ($mapgroup) {
            $defaultmapgroup = "$mapgroup"
            If (($script:mapgroup = Read-Host -P(Write-Host "Enter Server MAPGROUP, Press Enter to Accept  [$mapgroup]: "-F CY -N )) -eq '') { $script:mapgroup = "$defaultmapgroup" }Else { $mapgroup }
        }
        If ($gametype) {
            $defaultgametype = "$gametype"
            If (($script:gametype = Read-Host -P(Write-Host "Enter Server game type, Press Enter to Accept  [$gametype]: "-F CY -N )) -eq '') { $script:gametype = "$defaultgametype" }Else { $gametype }
        }
        If ($coopplayers) {
            $defaultcoopplayers = "$coopplayers"
            If (($script:coopplayers = Read-Host -P(Write-Host "Enter Server COOP PLAYERS, Press Enter to Accept  [$coopplayers]: "-F CY -N )) -eq '') { $script:coopplayers = "$defaultcoopplayers" }Else { $coopplayers }
        }
        If ($sv_lan) {
            $defaultsv_lan = "$sv_lan"
            If (($script:sv_lan = Read-Host -P(Write-Host "Enter Server SV_LAN, Press Enter to Accept  [$sv_lan]: "-F CY -N )) -eq '') { $script:sv_lan = "$defaultsv_lan" }Else { $sv_lan }
        }
        If ($workshop) {
            $defaultworkshop = "$workshop"
            If (($script:workshop = Read-Host -P(Write-Host "Enter Server workshop, Press Enter to Accept  [$workshop]: "-F CY -N )) -eq '') { $script:workshop = "$defaultworkshop" }Else { $workshop }
        }
        If ($sv_pure) {
            $defaultsv_pure = "$sv_pure"
            If (($script:sv_pure = Read-Host -P(Write-Host "Enter Server SV_PURE, Press Enter to Accept  [$sv_pure]: "-F CY -N )) -eq '') { $script:sv_pure = "$defaultsv_pure" }Else { $sv_pure }
        }
        If ($parm28 -eq 1) {
            If ((${xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$xx]: "-F CY -N )) -eq '') { $xx = "$xx" }Else { $xx }
        }
        If ($parm29 -eq 1) {
            If ((${xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$xx]: "-F CY -N )) -eq '') { $xx = "$xx" }Else { $xx }
        }
    }
}