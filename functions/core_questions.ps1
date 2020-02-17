Function Set-SteamInfo {
    $title = 'Install Steam server with Anonymous login'
    $question = 'Use Anonymous Login?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    If ($decision -eq 1) {
        $global:ANON = "yes"
        #Install-Anonserver
        Install-ServerFiles
        Write-Host 'Entered Y'
    }
    Else {
        $global:ANON = "no"
        #Install-Anonserver
        Install-ServerFiles
        Write-Host 'Entered N'
    }
}
Function New-TryagainNew {
    $title = 'Try again?'
    $question = "$global:command $global:server?"
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        Select-Steamer $global:command $global:server
    }
    Else {
        Write-Host 'Entered N'
        Exit
    }
}
Function Set-SteamInfoAppID {
    $title = 'Launch Script create'
    $question = 'Create Launch Script?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Set-VariablesPS
        Read-AppID
        Write-Host 'Entered Y'
    }
    Else {
        Write-Host 'Entered N'
    }
}
Function New-ServerFolderq {
    $title = 'Server Folder Name does not exist!'
    $question = 'Would you like to to create new Server Folder Name?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        $global:command = "install"
        Select-Steamer $global:command $global:server
    }
    Else {
        Write-Host 'Entered N'
        Exit
    }
}
Function Get-OxideQ {
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
Function Get-UserInput {
    Param([parameter(Position = 0)]$parm0,
        [parameter(Position = 1)]$parm1,
        [parameter(Position = 2)]$parm2,
        [parameter(Position = 3)]$parm3,
        [parameter(Position = 4)]$parm4,
        [parameter(Position = 5)]$parm5,
        [parameter(Position = 6)]$parm6,
        [parameter(Position = 7)]$parm7,
        [parameter(Position = 8)]$parm8,
        [parameter(Position = 9)]$parm9,
        [parameter(Position = 10)]$parm10,
        [parameter(Position = 11)]$parm11,
        [parameter(Position = 12)]$parm12,
        [parameter(Position = 13)]$parm13,
        [parameter(Position = 14)]$parm14,
        [parameter(Position = 15)]$parm15,
        [parameter(Position = 16)]$parm16,
        [parameter(Position = 17)]$parm17,
        [parameter(Position = 18)]$parm18,
        [parameter(Position = 19)]$parm19,
        [parameter(Position = 20)]$parm20,
        [parameter(Position = 21)]$parm21,
        [parameter(Position = 22)]$parm22,
        [parameter(Position = 23)]$parm23,
        [parameter(Position = 24)]$parm24,
        [parameter(Position = 25)]$parm25,
        [parameter(Position = 26)]$parm26,
        [parameter(Position = 27)]$parm27,
        [parameter(Position = 28)]$parm28)
    #Write-Host "$global:SMILEY_BLACK Press Enter to Accept default $global:SMILEY_BLACK" -F Y
    If ($parm0 -eq 1) {
        If ((${global:IP} = Read-Host -P(Write-Host "Enter Server IP, Press Enter to Accept default [$global:defaultIP]: "-F CY -N )) -eq '') { $global:IP = "$global:defaultIP" }Else { $global:IP }
    }
    If ($parm1 -eq 1) {
        If ((${global:PORT} = Read-Host -P(Write-Host "Enter Server PORT, Press Enter to Accept default [$global:defaultPORT]: "-F CY -N )) -eq '') { $global:PORT = "$global:defaultPORT" }Else { $global:PORT }
    }
    If ($parm2 -eq 1) {
        If ((${global:QUERYPORT} = Read-Host -P(Write-Host "Enter Server QUERY PORT, Press Enter to Accept default [$global:defaultQUERYPORT]: "-F CY -N )) -eq '') { $global:QUERYPORT = "$global:defaultQUERYPORT" }Else { $global:QUERYPORT }
    }
    If ($parm3 -eq 1) {
        If ((${global:RCONPORT} = Read-Host -P(Write-Host "Enter Server RCON PORT, Press Enter to Accept default [$global:defaultRCONPORT]: "-F CY -N )) -eq '') { $global:RCONPORT = "$global:defaultRCONPORT" }Else { $global:RCONPORT }
    }
    If ($parm4 -eq 1) {
        If ((${global:RCONPASSWORD} = Read-Host -P(Write-Host "Enter Server RCON PASSWORD, Press Enter to Accept default [$global:RANDOMPASSWORD]: "-F CY -N )) -eq '') { $global:RCONPASSWORD = "$global:RANDOMPASSWORD" }Else { $global:RCONPASSWORD }
    }
    If ($parm5 -eq 1) {
        If ((${global:HOSTNAME} = Read-Host -P(Write-Host "Enter Server HOSTNAME, Press Enter to Accept default [$env:USERNAME]: "-F CY -N )) -eq '') { $global:HOSTNAME = "$env:USERNAME" }Else { $global:HOSTNAME }
    }
    If ($parm6 -eq 1) {
        If ((${global:SERVERPASSWORD} = Read-Host -P(Write-Host "Enter Server SERVER PASSWORD, Press Enter to Accept default [$global:defaultSERVERPASSWORD]: "-F CY -N )) -eq '') { $global:SERVERPASSWORD = "$global:defaultSERVERPASSWORD" }Else { $global:SERVERPASSWORD }
    }
    If ($parm7 -eq 1) {
        If ((${global:MAXPLAYERS} = Read-Host -P(Write-Host "Enter Server MAX PLAYERS, Press Enter to Accept default [$global:defaultMAXPLAYERS]: "-F CY -N )) -eq '') { $global:MAXPLAYERS = "$global:defaultMAXPLAYERS" }Else { $global:MAXPLAYERS }
    }
    If ($parm8 -eq 1) {
        If ((${global:GSLT} = Read-Host -P(Write-Host "Enter Server GSLT, Press Enter to Accept default [$global:defaultGSLT]: "-F CY -N )) -eq '') { $global:GSLT = "$global:defaultGSLT" }Else { $global:GSLT }
    }
    If ($parm9 -eq 1) {
        If ((${global:MAP} = Read-Host -P(Write-Host "Enter Server MAP, Press Enter to Accept default [$global:defaultMAP]: "-F CY -N )) -eq '') { $global:MAP = "$global:defaultMAP" }Else { $global:MAP }
    }
    If ($parm10 -eq 1) {
        If ((${global:clientport} = Read-Host -P(Write-Host "Enter Server client port, Press Enter to Accept default [$global:defaultclientport]: "-F CY -N )) -eq '') { $global:clientport = "$global:defaultclientport" }Else { $global:clientport }
    }
    If ($parm11 -eq 1) {
        If ((${global:sourcetvport} = Read-Host -P(Write-Host "Enter Server source tv port, Press Enter to Accept default [$global:defaultsourcetvport]: "-F CY -N )) -eq '') { $global:sourcetvport = "$global:defaultsourcetvport" }Else { $global:sourcetvport }
    }
    If ($parm12 -eq 1) {
        If ((${global:GAMEMODE} = Read-Host -P(Write-Host "Enter Server GAME MODE, Press Enter to Accept default [$global:defaultGAMEMODE]: "-F CY -N )) -eq '') { $global:GAMEMODE = "$global:defaultGAMEMODE" }Else { $global:GAMEMODE }
    }
    If ($parm13 -eq 1) {
        If ((${global:DIFF} = Read-Host -P(Write-Host "Enter Server Difficulty, Press Enter to Accept default [$global:defaultDIFF]: "-F CY -N )) -eq '') { $global:DIFF = "$global:defaultDIFF" }Else { $global:DIFF }
    }
    If ($parm14 -eq 1) {
        If ((${global:ADMINPASSWORD} = Read-Host -P(Write-Host "Enter Server ADMIN PASSWORD, Press Enter to Accept default [$global:defaultADMINPASSWORD]: "-F CY -N )) -eq '') { $global:ADMINPASSWORD = "$global:defaultADMINPASSWORD" }Else { $global:ADMINPASSWORD }
    }
    If ($parm15 -eq 1) {
        If ((${global:TICKRATE} = Read-Host -P(Write-Host "Enter Server TICKRATE, Press Enter to Accept default [$global:TICKRATE]: "-F CY -N )) -eq '') { $global:TICKRATE = "$global:defaultTICKRATE" }Else { $global:TICKRATE }
    }
    If ($parm16 -eq 1) {
        If ((${global:SAVEINTERVAL} = Read-Host -P(Write-Host "Enter Server SAVEINTERVAL, Press Enter to Accept default [$global:SAVEINTERVAL]: "-F CY -N )) -eq '') { $global:SAVEINTERVAL = "$global:defaultSAVEINTERVAL" }Else { $global:SAVEINTERVAL }
    }
    If ($parm17 -eq 1) {
        If ((${global:WORLDSIZE} = Read-Host -P(Write-Host "Enter Server WORLDSIZE, Press Enter to Accept default [$global:WORLDSIZE]: "-F CY -N )) -eq '') { $global:WORLDSIZE = "$global:defaultWORLDSIZE" }Else { $global:WORLDSIZE }
    }
    If ($parm18 -eq 1) {
        If ((${global:SEED} = Read-Host -P(Write-Host "Enter Server SEED, Press Enter to Accept default [$global:SEED]: "-F CY -N )) -eq '') { $global:SEED = "$global:defaultSEED" }Else { $global:SEED }
    }
    If ($parm19 -eq 1) {
        If ((${global:RCONWEB} = Read-Host -P(Write-Host "Enter Server RCONWEB, Press Enter to Accept default [$global:RCONWEB]: "-F CY -N )) -eq '') { $global:RCONWEB = "$global:defaultRCONWEB" }Else { $global:RCONWEB }
    }
    If ($parm20 -eq 1) {
        If ((${global:steamID64} = Read-Host -P(Write-Host "Enter steamID64, Press Enter to Accept default [$global:steamID64]: "-F CY -N )) -eq '') { $global:steamID64 = "$global:defaultsteamID64" }Else { $global:steamID64 }
    }
    If ($parm21 -eq 1) {
        If ((${global:GALAXYNAME} = Read-Host -P(Write-Host "Enter GALAXYNAME, Press Enter to Accept default [$global:GALAXYNAME]: "-F CY -N )) -eq '') { $global:GALAXYNAME = "$global:defaultGALAXYNAME" }Else { $global:GALAXYNAME }
    }
    If ($parm22 -eq 1) {
        If ((${global:MAPGROUP} = Read-Host -P(Write-Host "Enter Server MAPGROUP, Press Enter to Accept default [$global:MAPGROUP]: "-F CY -N )) -eq '') { $global:MAPGROUP = "$global:defaultMAPGROUP" }Else { $global:MAPGROUP }
    }
    If ($parm23 -eq 1) {
        If ((${global:GAMETYPE} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$global:GAMETYPE]: "-F CY -N )) -eq '') { $global:GAMETYPE = "$global:defaultGAMETYPE" }Else { $global:GAMETYPE }
    }
    If ($parm24 -eq 1) {
        If ((${global:COOPPLAYERS} = Read-Host -P(Write-Host "Enter Server COOPPLAYERS, Press Enter to Accept default [$global:COOPPLAYERS]: "-F CY -N )) -eq '') { $global:COOPPLAYERS = "$global:defaultCOOPPLAYERS" }Else { $global:COOPPLAYERS }
    }
    If ($parm25 -eq 1) {
        If ((${global:SV_LAN} = Read-Host -P(Write-Host "Enter Server SV_LAN, Press Enter to Accept default [$global:SV_LAN]: "-F CY -N )) -eq '') { $global:SV_LAN = "$global:defaultSV_LAN" }Else { $global:SV_LAN }
    }
    If ($parm26 -eq 1) {
        If ((${global:WORKSHOP} = Read-Host -P(Write-Host "Enter Server WORKSHOP, Press Enter to Accept default [$global:WORKSHOP]: "-F CY -N )) -eq '') { $global:WORKSHOP = "$global:defaultWORKSHOP" }Else { $global:WORKSHOP }
    }
    If ($parm27 -eq 1) {
        If ((${global:SV_PURE} = Read-Host -P(Write-Host "Enter Server SV_PURE, Press Enter to Accept default [$global:SV_PURE]: "-F CY -N )) -eq '') { $global:SV_PURE = "$global:defaultSV_PURE" }Else { $global:SV_PURE }
    }
    If ($parm28 -eq 1) {
        If ((${global:xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$global:xx]: "-F CY -N )) -eq '') { $global:xx = "$global:xx" }Else { $global:xx }
    }
    If ($parm29 -eq 1) {
        If ((${global:xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$global:xx]: "-F CY -N )) -eq '') { $global:xx = "$global:xx" }Else { $global:xx }
    }
}