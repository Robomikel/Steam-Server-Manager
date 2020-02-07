Function Set-SteamInfo {
    $title = 'Install Steam server with Anonymous login'
    $question = 'Use Anonymous Login?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    If ($decision -eq 1) {
        $global:ANON = "yes"
        Install-Anonserver
        Write-Host 'Entered Y'
    }
    Else {
        $global:ANON = "no"
        Install-Anonserver
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

Function Get-SourceMetMod {
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
Function Get-Oxide {
    $start_time = Get-Date
    Write-Host '****   Downloading Oxide   ****' -F M -B Black
    #(New-Object Net.WebClient).DownloadFile("$global:oxiderustlatestlink", "$global:currentdir\oxide.zip")
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $global:oxiderustlatestlink -OutFile $global:currentdir\oxide.zip
    If (!$?) { 
        Write-Host "****   Downloading Oxide Failed !!   ****" -F R -B Black ; ; Exit 
    } 
    Write-Host "Download Time: $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '****   Extracting Oxide    ****' -F M -B Black
    Expand-Archive "$global:currentdir\oxide.zip" "$global:currentdir\oxide\" -Force
    If (!$?) { 
        Write-Host "****   Extracting Oxide Failed !!   ****" -F R -B Black ; ; Exit 
    }

    Write-Host '****   Copying Oxide *****' -F M -B Black
    Copy-Item  $global:currentdir\oxide\$global:MODDIR\* -Destination $global:currentdir\$global:server\$global:MODDIR\ -Force -Recurse
    If (!$?) { 
        Write-Host "****   Copying Oxide Failed !!   ****" -F R -B Black ; ; Exit 
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
        [parameter(Position = 15)]$parm15)
    Write-Host "$global:SMILEY_BLACK Press Enter to Accept default $global:SMILEY_BLACK" -F Y
    If ($parm0 -eq 1) {
        If ((${global:IP} = Read-Host -P(Write-Host "Input IP [$global:defaultIP]: "-F CY -N )) -eq '') { $global:IP = "$global:defaultIP" }Else { $global:IP }
    }
    If ($parm1 -eq 1) {
        If ((${global:PORT} = Read-Host -P(Write-Host "Input PORT [$global:defaultPORT]: "-F CY -N )) -eq '') { $global:PORT = "$global:defaultPORT" }Else { $global:PORT }
    }
    If ($parm2 -eq 1) {
        If ((${global:QUERYPORT} = Read-Host -P(Write-Host "Input QUERYPORT [$global:defaultQUERYPORT]: "-F CY -N )) -eq '') { $global:QUERYPORT = "$global:defaultQUERYPORT" }Else { $global:QUERYPORT }
    }
    If ($parm3 -eq 1) {
        If ((${global:RCONPORT} = Read-Host -P(Write-Host "Input RCONPORT [$global:defaultRCONPORT]: "-F CY -N )) -eq '') { $global:RCONPORT = "$global:defaultRCONPORT" }Else { $global:RCONPORT }
    }
    If ($parm4 -eq 1) {
        If ((${global:RCONPASSWORD} = Read-Host -P(Write-Host "Input RCONPASSWORD [$global:RANDOMPASSWORD]: "-F CY -N )) -eq '') { $global:RCONPASSWORD = "$global:RANDOMPASSWORD" }Else { $global:RCONPASSWORD }
    }
    If ($parm5 -eq 1) {
        If ((${global:HOSTNAME} = Read-Host -P(Write-Host "Input HOSTNAME [$env:USERNAME]: "-F CY -N )) -eq '') { $global:HOSTNAME = "$env:USERNAME" }Else { $global:HOSTNAME }
    }
    If ($parm6 -eq 1) {
        If ((${global:SERVERPASSWORD} = Read-Host -P(Write-Host "Input SERVERPASSWORD [$global:defaultSERVERPASSWORD]: "-F CY -N )) -eq '') { $global:SERVERPASSWORD = "$global:defaultSERVERPASSWORD" }Else { $global:SERVERPASSWORD }
    }
    If ($parm7 -eq 1) {
        If ((${global:MAXPLAYERS} = Read-Host -P(Write-Host "Input MAXPLAYERS [$global:defaultMAXPLAYERS]: "-F CY -N )) -eq '') { $global:MAXPLAYERS = "$global:defaultMAXPLAYERS" }Else { $global:MAXPLAYERS }
    }
    If ($parm8 -eq 1) {
        If ((${global:GSLT} = Read-Host -P(Write-Host "Input GSLT [$global:defaultGSLT]: "-F CY -N )) -eq '') { $global:GSLT = "$global:defaultGSLT" }Else { $global:GSLT }
    }
    If ($parm9 -eq 1) {
        If ((${global:MAP} = Read-Host -P(Write-Host "Input MAP [$global:defaultMAP]: "-F CY -N )) -eq '') { $global:MAP = "$global:defaultMAP" }Else { $global:MAP }
    }
    If ($parm10 -eq 1) {
        If ((${global:clientport} = Read-Host -P(Write-Host "Input clientport [$global:defaultclientport]: "-F CY -N )) -eq '') { $global:clientport = "$global:defaultclientport" }Else { $global:clientport }
    }
    If ($parm11 -eq 1) {
        If ((${global:sourcetvport} = Read-Host -P(Write-Host "Input sourcetvport [$global:defaultsourcetvport]: "-F CY -N )) -eq '') { $global:sourcetvport = "$global:defaultsourcetvport" }Else { $global:sourcetvport }
    }
    If ($parm12 -eq 1) {
        If ((${global:GAMEMODE} = Read-Host -P(Write-Host "Input sourcetvport [$global:defaultGAMEMODE]: "-F CY -N )) -eq '') { $global:GAMEMODE = "$global:defaultGAMEMODE" }Else { $global:GAMEMODE }
    }
    If ($parm13 -eq 1) {
        If ((${global:DIFF} = Read-Host -P(Write-Host "Input sourcetvport [$global:defaultDIFF]: "-F CY -N )) -eq '') { $global:DIFF = "$global:defaultDIFF" }Else { $global:DIFF }
    }
    If ($parm14 -eq 1) {
        If ((${global:ADMINPASSWORD} = Read-Host -P(Write-Host "Input sourcetvport [$global:defaultADMINPASSWORD]: "-F CY -N )) -eq '') { $global:ADMINPASSWORD = "$global:defaultADMINPASSWORD" }Else { $global:ADMINPASSWORD }
    }
    If ($parm15 -eq 1) {
        If ((${global:xx} = Read-Host -P(Write-Host "Input sourcetvport [$global:xx]: "-F CY -N )) -eq '') { $global:xx = "$global:xx" }Else { $global:xx }
    }
}