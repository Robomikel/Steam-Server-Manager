#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Set-SteamInfo {
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
        Select-Steamer install $serverfiles
        Get-createdvaribles
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
Function Get-UserInput_old {
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
    #Write-Host "$SMILEY_BLACK Press Enter to Accept default $SMILEY_BLACK" -F Y
    If ($parm0 -eq 1) {
        If ((${IP} = Read-Host -P(Write-Host "Enter Server IP, Press Enter to Accept default [$defaultIP]: "-F CY -N )) -eq '') { $IP = "$defaultIP" }Else { $IP }
    }
    If ($parm1 -eq 1) {
        If ((${PORT} = Read-Host -P(Write-Host "Enter Server PORT, Press Enter to Accept default [$defaultPORT]: "-F CY -N )) -eq '') { $PORT = "$defaultPORT" }Else { $PORT }
    }
    If ($parm2 -eq 1) {
        If ((${QUERYPORT} = Read-Host -P(Write-Host "Enter Server QUERY PORT, Press Enter to Accept default [$defaultQUERYPORT]: "-F CY -N )) -eq '') { $QUERYPORT = "$defaultQUERYPORT" }Else { $QUERYPORT }
    }
    If ($parm3 -eq 1) {
        If ((${RCONPORT} = Read-Host -P(Write-Host "Enter Server RCON PORT, Press Enter to Accept default [$defaultRCONPORT]: "-F CY -N )) -eq '') { $RCONPORT = "$defaultRCONPORT" }Else { $RCONPORT }
    }
    If ($parm4 -eq 1) {
        If ((${RCONPASSWORD} = Read-Host -P(Write-Host "Enter Server RCON PASSWORD, Press Enter to Accept default [$RANDOMPASSWORD]: "-F CY -N )) -eq '') { $RCONPASSWORD = "$RANDOMPASSWORD" }Else { $RCONPASSWORD }
    }
    If ($parm5 -eq 1) {
        If ((${HOSTNAME} = Read-Host -P(Write-Host "Enter Server HOSTNAME, Press Enter to Accept default [$env:USERNAME]: "-F CY -N )) -eq '') { $HOSTNAME = "$env:USERNAME" }Else { $HOSTNAME }
    }
    If ($parm6 -eq 1) {
        If ((${SERVERPASSWORD} = Read-Host -P(Write-Host "Enter Server SERVER PASSWORD, Press Enter to Accept default [$defaultSERVERPASSWORD]: "-F CY -N )) -eq '') { $SERVERPASSWORD = "$defaultSERVERPASSWORD" }Else { $SERVERPASSWORD }
    }
    If ($parm7 -eq 1) {
        If ((${MAXPLAYERS} = Read-Host -P(Write-Host "Enter Server MAX PLAYERS, Press Enter to Accept default [$defaultMAXPLAYERS]: "-F CY -N )) -eq '') { $MAXPLAYERS = "$defaultMAXPLAYERS" }Else { $MAXPLAYERS }
    }
    If ($parm8 -eq 1) {
        If ((${GSLT} = Read-Host -P(Write-Host "Enter Server GSLT, Press Enter to Accept default [$defaultGSLT]: "-F CY -N )) -eq '') { $GSLT = "$defaultGSLT" }Else { $GSLT }
    }
    If ($parm9 -eq 1) {
        If ((${MAP} = Read-Host -P(Write-Host "Enter Server MAP, Press Enter to Accept default [$defaultMAP]: "-F CY -N )) -eq '') { $MAP = "$defaultMAP" }Else { $MAP }
    }
    If ($parm10 -eq 1) {
        If ((${clientport} = Read-Host -P(Write-Host "Enter Server client port, Press Enter to Accept default [$defaultclientport]: "-F CY -N )) -eq '') { $clientport = "$defaultclientport" }Else { $clientport }
    }
    If ($parm11 -eq 1) {
        If ((${sourcetvport} = Read-Host -P(Write-Host "Enter Server source tv port, Press Enter to Accept default [$defaultsourcetvport]: "-F CY -N )) -eq '') { $sourcetvport = "$defaultsourcetvport" }Else { $sourcetvport }
    }
    If ($parm12 -eq 1) {
        If ((${GAMEMODE} = Read-Host -P(Write-Host "Enter Server GAME MODE, Press Enter to Accept default [$defaultGAMEMODE]: "-F CY -N )) -eq '') { $GAMEMODE = "$defaultGAMEMODE" }Else { $GAMEMODE }
    }
    If ($parm13 -eq 1) {
        If ((${DIFF} = Read-Host -P(Write-Host "Enter Server Difficulty, Press Enter to Accept default [$defaultDIFF]: "-F CY -N )) -eq '') { $DIFF = "$defaultDIFF" }Else { $DIFF }
    }
    If ($parm14 -eq 1) {
        If ((${ADMINPASSWORD} = Read-Host -P(Write-Host "Enter Server ADMIN PASSWORD, Press Enter to Accept default [$defaultADMINPASSWORD]: "-F CY -N )) -eq '') { $ADMINPASSWORD = "$defaultADMINPASSWORD" }Else { $ADMINPASSWORD }
    }
    If ($parm15 -eq 1) {
        If ((${TICKRATE} = Read-Host -P(Write-Host "Enter Server TICKRATE, Press Enter to Accept default [$TICKRATE]: "-F CY -N )) -eq '') { $TICKRATE = "$defaultTICKRATE" }Else { $TICKRATE }
    }
    If ($parm16 -eq 1) {
        If ((${SAVEINTERVAL} = Read-Host -P(Write-Host "Enter Server SAVEINTERVAL, Press Enter to Accept default [$SAVEINTERVAL]: "-F CY -N )) -eq '') { $SAVEINTERVAL = "$defaultSAVEINTERVAL" }Else { $SAVEINTERVAL }
    }
    If ($parm17 -eq 1) {
        If ((${WORLDSIZE} = Read-Host -P(Write-Host "Enter Server WORLDSIZE, Press Enter to Accept default [$WORLDSIZE]: "-F CY -N )) -eq '') { $WORLDSIZE = "$defaultWORLDSIZE" }Else { $WORLDSIZE }
    }
    If ($parm18 -eq 1) {
        If ((${SEED} = Read-Host -P(Write-Host "Enter Server SEED, Press Enter to Accept default [$SEED]: "-F CY -N )) -eq '') { $SEED = "$defaultSEED" }Else { $SEED }
    }
    If ($parm19 -eq 1) {
        If ((${RCONWEB} = Read-Host -P(Write-Host "Enter Server RCONWEB, Press Enter to Accept default [$RCONWEB]: "-F CY -N )) -eq '') { $RCONWEB = "$defaultRCONWEB" }Else { $RCONWEB }
    }
    If ($parm20 -eq 1) {
        If ((${steamID64} = Read-Host -P(Write-Host "Enter steamID64, Press Enter to Accept default [$steamID64]: "-F CY -N )) -eq '') { $steamID64 = "$defaultsteamID64" }Else { $steamID64 }
    }
    If ($parm21 -eq 1) {
        If ((${GALAXYNAME} = Read-Host -P(Write-Host "Enter GALAXYNAME, Press Enter to Accept default [$GALAXYNAME]: "-F CY -N )) -eq '') { $GALAXYNAME = "$defaultGALAXYNAME" }Else { $GALAXYNAME }
    }
    If ($parm22 -eq 1) {
        If ((${MAPGROUP} = Read-Host -P(Write-Host "Enter Server MAPGROUP, Press Enter to Accept default [$MAPGROUP]: "-F CY -N )) -eq '') { $MAPGROUP = "$defaultMAPGROUP" }Else { $MAPGROUP }
    }
    If ($parm23 -eq 1) {
        If ((${GAMETYPE} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$GAMETYPE]: "-F CY -N )) -eq '') { $GAMETYPE = "$defaultGAMETYPE" }Else { $GAMETYPE }
    }
    If ($parm24 -eq 1) {
        If ((${COOPPLAYERS} = Read-Host -P(Write-Host "Enter Server COOPPLAYERS, Press Enter to Accept default [$COOPPLAYERS]: "-F CY -N )) -eq '') { $COOPPLAYERS = "$defaultCOOPPLAYERS" }Else { $COOPPLAYERS }
    }
    If ($parm25 -eq 1) {
        If ((${SV_LAN} = Read-Host -P(Write-Host "Enter Server SV_LAN, Press Enter to Accept default [$SV_LAN]: "-F CY -N )) -eq '') { $SV_LAN = "$defaultSV_LAN" }Else { $SV_LAN }
    }
    If ($parm26 -eq 1) {
        If ((${WORKSHOP} = Read-Host -P(Write-Host "Enter Server WORKSHOP, Press Enter to Accept default [$WORKSHOP]: "-F CY -N )) -eq '') { $WORKSHOP = "$defaultWORKSHOP" }Else { $WORKSHOP }
    }
    If ($parm27 -eq 1) {
        If ((${SV_PURE} = Read-Host -P(Write-Host "Enter Server SV_PURE, Press Enter to Accept default [$SV_PURE]: "-F CY -N )) -eq '') { $SV_PURE = "$defaultSV_PURE" }Else { $SV_PURE }
    }
    If ($parm28 -eq 1) {
        If ((${xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$xx]: "-F CY -N )) -eq '') { $xx = "$xx" }Else { $xx }
    }
    If ($parm29 -eq 1) {
        If ((${xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$xx]: "-F CY -N )) -eq '') { $xx = "$xx" }Else { $xx }
    }
}
Function Get-UserInput {
    If ($version -eq 0) {
        #Write-Host "$SMILEY_BLACK Press Enter to Accept default $SMILEY_BLACK" -F Y
        Set-Console
        If ($ip) {
            If (($global:IP = Read-Host -P(Write-Host "Enter Server IP, Press Enter to Accept default [$IP]: "-F CY -N )) -eq '') { $IP = "$IP" }Else { $IP }
        }
        If ($port) {
            If ((${global:PORT} = Read-Host -P(Write-Host "Enter Server PORT, Press Enter to Accept  [$PORT]: "-F CY -N )) -eq '') { $PORT = "$PORT" }Else { $PORT }
        }
        If ($queryport) {
            If ((${global:QUERYPORT} = Read-Host -P(Write-Host "Enter Server QUERY PORT, Press Enter to Accept  [$QUERYPORT]: "-F CY -N )) -eq '') { $QUERYPORT = "$QUERYPORT" }Else { $QUERYPORT }
        }
        If ($RCONPORT) {
            If ((${global:RCONPORT} = Read-Host -P(Write-Host "Enter Server RCON PORT, Press Enter to Accept  [$RCONPORT]: "-F CY -N )) -eq '') { $RCONPORT = "$RCONPORT" }Else { $RCONPORT }
        }
        If ($RANDOMPASSWORD) {
            If ((${global:RCONPASSWORD} = Read-Host -P(Write-Host "Enter Server RCON PASSWORD, Press Enter to Accept  [$RANDOMPASSWORD]: "-F CY -N )) -eq '') { $RCONPASSWORD = "$RANDOMPASSWORD" }Else { $RCONPASSWORD }
        }
        If (${HOSTNAME}) {
            If ((${global:HOSTNAME} = Read-Host -P(Write-Host "Enter Server HOSTNAME, Press Enter to Accept  [$env:USERNAME]: "-F CY -N )) -eq '') { $HOSTNAME = "$env:USERNAME" }Else { $HOSTNAME }
        }
        If (${SERVERPASSWORD}) {
            If ((${global:SERVERPASSWORD} = Read-Host -P(Write-Host "Enter Server SERVER PASSWORD, Press Enter to Accept  [$SERVERPASSWORD]: "-F CY -N )) -eq '') { $SERVERPASSWORD = "$SERVERPASSWORD" }Else { $SERVERPASSWORD }
        }
        If (${MAXPLAYERS}) {
            If ((${global:MAXPLAYERS} = Read-Host -P(Write-Host "Enter Server MAX PLAYERS, Press Enter to Accept  [$MAXPLAYERS]: "-F CY -N )) -eq '') { $MAXPLAYERS = "$MAXPLAYERS" }Else { $MAXPLAYERS }
        }
        If (${GSLT}) {
            If ((${global:GSLT} = Read-Host -P(Write-Host "Enter Server GSLT, Press Enter to Accept  [$GSLT]: "-F CY -N )) -eq '') { $GSLT = "$GSLT" }Else { $GSLT }
        }
        If (${MAP}) {
            If ((${global:MAP} = Read-Host -P(Write-Host "Enter Server MAP, Press Enter to Accept  [$MAP]: "-F CY -N )) -eq '') { $MAP = "$MAP" }Else { $MAP }
        }
        If (${clientport}) {
            If ((${global:clientport} = Read-Host -P(Write-Host "Enter Server client port, Press Enter to Accept  [$clientport]: "-F CY -N )) -eq '') { $clientport = "$clientport" }Else { $clientport }
        }
        If (${sourcetvport}) {
            If ((${global:sourcetvport} = Read-Host -P(Write-Host "Enter Server source tv port, Press Enter to Accept  [$sourcetvport]: "-F CY -N )) -eq '') { $sourcetvport = "$sourcetvport" }Else { $sourcetvport }
        }
        If (${GAMEMODE}) {
            If ((${global:GAMEMODE} = Read-Host -P(Write-Host "Enter Server GAME MODE, Press Enter to Accept  [$GAMEMODE]: "-F CY -N )) -eq '') { $GAMEMODE = "$GAMEMODE" }Else { $GAMEMODE }
        }
        If (${DIFF} ) {
            If ((${global:DIFF} = Read-Host -P(Write-Host "Enter Server Difficulty, Press Enter to Accept  [$DIFF]: "-F CY -N )) -eq '') { $DIFF = "$DIFF" }Else { $DIFF }
        }
        If (${ADMINPASSWORD}) {
            If ((${global:ADMINPASSWORD} = Read-Host -P(Write-Host "Enter Server ADMIN PASSWORD, Press Enter to Accept  [$ADMINPASSWORD]: "-F CY -N )) -eq '') { $ADMINPASSWORD = "$ADMINPASSWORD" }Else { $ADMINPASSWORD }
        }
        If (${TICKRATE}) {
            If ((${global:TICKRATE} = Read-Host -P(Write-Host "Enter Server TICKRATE, Press Enter to Accept  [$TICKRATE]: "-F CY -N )) -eq '') { $TICKRATE = "$TICKRATE" }Else { $TICKRATE }
        }
        If (${SAVEINTERVAL} ) {
            If ((${global:SAVEINTERVAL} = Read-Host -P(Write-Host "Enter Server SAVEINTERVAL, Press Enter to Accept  [$SAVEINTERVAL]: "-F CY -N )) -eq '') { $SAVEINTERVAL = "$SAVEINTERVAL" }Else { $SAVEINTERVAL }
        }
        If (${WORLDSIZE}) {
            If ((${global:WORLDSIZE} = Read-Host -P(Write-Host "Enter Server WORLDSIZE, Press Enter to Accept  [$WORLDSIZE]: "-F CY -N )) -eq '') { $WORLDSIZE = "$WORLDSIZE" }Else { $WORLDSIZE }
        }
        If (${SEED}) {
            If ((${global:SEED} = Read-Host -P(Write-Host "Enter Server SEED, Press Enter to Accept  [$SEED]: "-F CY -N )) -eq '') { $SEED = "$SEED" }Else { $SEED }
        }
        If (${RCONWEB}) {
            If ((${global:RCONWEB} = Read-Host -P(Write-Host "Enter Server RCONWEB, Press Enter to Accept  [$RCONWEB]: "-F CY -N )) -eq '') { $RCONWEB = "$RCONWEB" }Else { $RCONWEB }
        }
        If (${steamID64}) {
            If ((${global:steamID64} = Read-Host -P(Write-Host "Enter steamID64, Press Enter to Accept  [$steamID64]: "-F CY -N )) -eq '') { $steamID64 = "$steamID64" }Else { $steamID64 }
        }
        If (${GALAXYNAME}) {
            If ((${global:GALAXYNAME} = Read-Host -P(Write-Host "Enter GALAXYNAME, Press Enter to Accept  [$GALAXYNAME]: "-F CY -N )) -eq '') { $GALAXYNAME = "$GALAXYNAME" }Else { $GALAXYNAME }
        }
        If (${MAPGROUP}) {
            If ((${global:MAPGROUP} = Read-Host -P(Write-Host "Enter Server MAPGROUP, Press Enter to Accept  [$MAPGROUP]: "-F CY -N )) -eq '') { $MAPGROUP = "$MAPGROUP" }Else { $MAPGROUP }
        }
        If (${GAMETYPE}) {
            If ((${global:GAMETYPE} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept  [$GAMETYPE]: "-F CY -N )) -eq '') { $GAMETYPE = "$GAMETYPE" }Else { $GAMETYPE }
        }
        If (${COOPPLAYERS}) {
            If ((${global:COOPPLAYERS} = Read-Host -P(Write-Host "Enter Server COOPPLAYERS, Press Enter to Accept  [$COOPPLAYERS]: "-F CY -N )) -eq '') { $COOPPLAYERS = "$COOPPLAYERS" }Else { $COOPPLAYERS }
        }
        If (${SV_LAN}) {
            If ((${global:SV_LAN} = Read-Host -P(Write-Host "Enter Server SV_LAN, Press Enter to Accept  [$SV_LAN]: "-F CY -N )) -eq '') { $SV_LAN = "$SV_LAN" }Else { $SV_LAN }
        }
        If (${WORKSHOP}) {
            If ((${global:WORKSHOP} = Read-Host -P(Write-Host "Enter Server WORKSHOP, Press Enter to Accept  [$WORKSHOP]: "-F CY -N )) -eq '') { $WORKSHOP = "$WORKSHOP" }Else { $WORKSHOP }
        }
        If (${SV_PURE}) {
            If ((${global:SV_PURE} = Read-Host -P(Write-Host "Enter Server SV_PURE, Press Enter to Accept  [$SV_PURE]: "-F CY -N )) -eq '') { $SV_PURE = "$SV_PURE" }Else { $SV_PURE }
        }
        If ($parm28 -eq 1) {
            If ((${xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$xx]: "-F CY -N )) -eq '') { $xx = "$xx" }Else { $xx }
        }
        If ($parm29 -eq 1) {
            If ((${xx} = Read-Host -P(Write-Host "Enter Server xx, Press Enter to Accept default [$xx]: "-F CY -N )) -eq '') { $xx = "$xx" }Else { $xx }
        }
    }
}