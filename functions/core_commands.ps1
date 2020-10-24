#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Select-Steamer {
    [CmdletBinding()]
    param(       
        [Parameter(
            Mandatory = $false,
            # HelpMessage = " CTL + C and ./ssm ?   ", 
            Position = 0
        )]
        [String] $global:command,
        #[ValidatePattern('^[a-z,A-Z]$')]
        [Parameter(
            Mandatory = $false,
            # HelpMessage = "Input Server Folder Name: ", 
            Position = 1 
        )]$global:serverfiles
    )
    Write-log "Function: Select-Steamer"
    Write-log "command:  $command $serverfiles"
    Set-Console  >$null 2>&1

    switch ($command) {
        { ($command -eq "ssm") -and ($serverfiles -eq "update") } { Get-UpdateSteamer; Break }
        'install' { Read-Param; Get-PreviousInstall; Get-TestString; Get-Appid; New-ServerFolder; Get-Steam; Set-SteamInfo; Read-AppID; New-CreateVariables; Get-Finished; Test-VariablesNull; Get-ClearVariables; Break }
        'update' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Get-ChecktaskDisable; Get-ServerBuildCheck; Get-ChecktaskEnable; Get-Finished; Test-VariablesNull; Get-ClearVariables; Break }
        'force-update' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Get-CheckNonSteam; Get-ChecktaskDisable; Get-UpdateServer; Get-ChecktaskEnable; Get-Finished; Test-VariablesNull; Get-ClearVariables; Break }
        'validate' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Get-CheckNonSteam; Get-ChecktaskDisable; Get-StopServer; Get-Steam; Get-ValidateServer; Get-ChecktaskEnable; Get-Finished; Test-VariablesNull; Get-ClearVariables; Break }
        'start' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Get-CheckServer; Edit-ServerConfig; Get-ServerBuildCheck; Select-StartServer; Get-ChecktaskEnable; Test-VariablesNull; Get-ClearVariables; Break }
        'stop' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Get-ChecktaskDisable; Get-StopServer; Test-VariablesNull; Get-ClearVariables; Break }
        'restart' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Get-ChecktaskDisable; Get-ServerBuildCheck; Get-RestartsServer; Get-ChecktaskEnable; Test-VariablesNull; Get-ClearVariables; Break }
        'monitor' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Get-MonitorServer; Test-VariablesNull; Get-ClearVariables; Break }
        'backup' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Get-SevenZipCheck; Get-ChecktaskDisable; New-BackupFolder  ; New-BackupServer; Get-ChecktaskEnable; Get-Finished; Test-VariablesNull; Get-ClearVariables; Break }
        'restore' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Get-SevenZipCheck; Get-ChecktaskDisable; New-BackupFolder  ; Get-BackupMenu ; Get-ChecktaskEnable; Get-Finished; Test-VariablesNull; Get-ClearVariables; Break }
        'install-monitor' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Set-MonitorJob; Test-VariablesNull; Get-ClearVariables; Break }
        'install-mod' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Get-Modinstall; Test-VariablesNull; Get-ClearVariables; Break }
        'install-ws' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Install-SteamWS; Test-VariablesNull; Get-ClearVariables; Break }
        'install-Restart' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Set-RestartJob; Test-VariablesNull; Get-ClearVariables; Break }
        'query' { Read-Param; Get-NodeJSCheck; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; Get-GamedigServerv2; Test-VariablesNull; Get-ClearVariables; Break }
        'mcrcon' { Read-Param; Get-FolderNames; Get-createdvaribles ; Get-CheckForVars; Get-MCRconCheck; set-connectMCRcon; Test-VariablesNull; Get-ClearVariables; Break }
        'discord' { Read-Param; Get-FolderNames; Get-createdvaribles; Get-CheckForVars; New-DiscordAlert; Test-VariablesNull; Get-ClearVariables; Break }
        'details' { Read-Param; Get-FolderNames; Get-createdvaribles ; Get-CheckForVars; Test-PSversion; Get-details; Test-VariablesNull; Get-ClearVariables; Break }
        'install-VcRedist' { Install-VisualCPlusPlus; Get-ClearVariables; Break }
        'menu' { Get-SSMMenu}
        'exit' { exit; Break }
        Default { Get-Help }
    }
}

Function Read-Param {
    Write-log "Function Read-Param"
    switch ($serverfiles) {
        { (!$serverfiles) } { Write-Host 'Input Server Folder Name: ' -F C -N; $global:serverfiles = Read-host ; Get-TestString }
    }
}

Function Get-SSMMenu {
    Write-Host ".:.:.:.:.:.:.:. SSM Command Menu .:.:.:.:.:.:.:.
    Choose Command: " -F Cyan
    $command = Menu @('install A-H', 'install I-Z','start', 'stop', 'update', 'restart', 'monitor', 'backup', 'restore', 'validate', 'install-monitor', 'install-mod', 'install-ws', 'force-update', 'install-Restart', 'query', 'mcrcon', 'discord', 'details', 'exit')
    clear-Host
    Set-Console  >$null 2>&1
    If ($command -ne "install A-H" -and $command -ne "install I-Z") {
        Write-Host ".:.:.:.:.:.:.:. SSM Server Menu .:.:.:.:.:.:.:.
    Choose Server: 
    loading..." -F Cyan
        $serverfiles = Menu (iex "((gci $currentdir -r |  ? name -like Variables-*.ps1 | select DirectoryName).DirectoryName).Replace(`"$currentdir\`",`"`" )")
        Select-Steamer $command $serverfiles
    }
    ElseIf ($command -eq "install A-H") {
        $gamename = Menu (iex "Import-Csv $currentdir\data\serverlist.csv | Select-Object -ExpandProperty Game | Select-Object -First 40" )
        $serverfiles = Import-Csv $currentdir\data\serverlist.csv | where-object Game -like "$gamename" | Select-Object -ExpandProperty ServerFolder 
        $command = "install"
        Select-Steamer $command $serverfiles
    }
    ElseIf ($command -eq "install I-Z") {
        $gamename = Menu (iex "Import-Csv $currentdir\data\serverlist.csv | Select-Object -ExpandProperty Game | Select-Object -Last 40" )
        $serverfiles = Import-Csv $currentdir\data\serverlist.csv | where-object Game -like "$gamename" | Select-Object -ExpandProperty ServerFolder 
        $command = "install"
        Select-Steamer $command $serverfiles
    }
}
