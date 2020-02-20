# Version 2.5
#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Select-Steamer {
    param(
        [string]
        [Parameter(Mandatory = $true, Position = 0, HelpMessage = " CTL + C and ./ssm ?   ")]
        #[ValidatePattern('^[a-z,A-Z]$')]
        $command,
        [string[]]
        [Parameter(Mandatory = $false, Position = 1)]
        #[ValidatePattern('^[a-z,A-Z]$')]
        $serverfiles)
    Set-Console  >$null 2>&1
    If (($command -eq "install") -and ($null -eq $serverfiles)) {     
        Write-Host 'Input Server Folder Name: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-Appid
        #Get-TestInterger
        New-ServerFolder
        Get-CheckNonSteam
        Get-Steam
        Set-SteamInfo
        #Set-SteamInfoAppID
        Read-AppID
        New-CreateVariables
        Get-Finished
    }
    elseif ($command -eq "install") {
        Get-TestString
        Get-Appid
        #Get-TestInterger
        New-ServerFolder
        Get-CheckNonSteam
        Get-Steam
        Set-SteamInfo
        #Set-SteamInfoAppID
        Read-AppID
        New-CreateVariables
        Get-Finished
    }
    elseif (($command -eq "update") -and ($null -eq $serverfiles)) {   
        Write-Host 'Server FolderName for server updates: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-CheckNonSteam
        Get-ChecktaskDisable
        Get-ServerBuildCheck
        #Get-UpdateServer 
        Get-ChecktaskEnable
        Get-Finished
    }
    elseif ($command -eq "update") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-CheckNonSteam
        Get-ChecktaskDisable
        Get-ServerBuildCheck
        #Get-UpdateServer
        Get-ChecktaskEnable
        Get-Finished
    }
    elseif (($command -eq "ForceUpdate") -and ($null -eq $serverfiles)) {   
        Write-Host 'Server FolderName for server updates: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-CheckNonSteam
        Get-ChecktaskDisable
        #Get-ServerBuildCheck
        Get-UpdateServer 
        Get-ChecktaskEnable
        Get-Finished
    }
    elseif ($command -eq "ForceUpdate") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-CheckNonSteam
        Get-ChecktaskDisable
        #Get-ServerBuildCheck
        Get-UpdateServer
        Get-ChecktaskEnable
        Get-Finished
    }
    elseif (($command -eq "validate") -and ($null -eq $serverfiles)) {
        Write-Host 'Server FolderName for server validate: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-CheckNonSteam
        Get-ChecktaskDisable
        Get-StopServer
        Get-Steam
        Get-ValidateServer
        Get-ChecktaskEnable
        Get-Finished
    }
    elseif ($command -eq "validate") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-CheckNonSteam
        Get-ChecktaskDisable
        Get-StopServer
        Get-Steam
        Get-ValidateServer
        Get-ChecktaskEnable
        Get-Finished
    }
    elseif (($command -eq "start") -and ($null -eq $serverfiles)) {
        Write-Host 'Server FolderName for server launch, warning stops running process!: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars    
        Get-CheckServer
        Get-ServerBuildCheck
        Select-StartServer
        Get-ChecktaskEnable
        Get-ClearVariables
    }
    elseif ($command -eq "start") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars   
        Get-CheckServer
        Get-ServerBuildCheck
        Select-StartServer
        Get-ChecktaskEnable
        Get-ClearVariables
    }
    elseif (($command -eq "stop") -and ($null -eq $serverfiles)) {
        Write-Host 'Server FolderName for server stop, warning stops running process!: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-ChecktaskDisable
        Get-StopServer
        Get-ClearVariables
    }
    elseif ($command -eq "stop") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-ChecktaskDisable
        Get-StopServer
        Get-ClearVariables 
    }
    elseif (($command -eq "restart") -and ($null -eq $serverfiles)) {
        Write-Host 'Server FolderName for server restart, warning stops running process!: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-ChecktaskDisable
        Get-StopServer 
        Get-ServerBuildCheck
        Get-RestartsServer
        Get-ChecktaskEnable
        Get-ClearVariables
    }
    elseif ($command -eq "restart") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-ChecktaskDisable
        Get-StopServer
        Get-ServerBuildCheck
        Get-RestartsServer
        Get-ChecktaskEnable  
        Get-ClearVariables
    }
    elseif (($command -eq "monitor") -and ($null -eq $serverfiles)) {
        Write-Host 'Server FolderName for server check: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars 
        Get-CheckServer
        Get-ClearVariables
    }
    elseif ($command -eq "monitor") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-CheckServer
        Get-ClearVariables
    }
    elseif (($command -eq "backup") -and ($null -eq $serverfiles)) {
        Write-Host 'Server FolderName for server backup: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars 
        Get-SevenZipCheck
        Get-ChecktaskDisable
        New-BackupFolder
        New-BackupServer
        Get-ChecktaskEnable
        Get-Finished
    }
    elseif ($command -eq "backup") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-SevenZipCheck
        Get-ChecktaskDisable
        New-BackupFolder  
        New-BackupServer
        Get-ChecktaskEnable
        Get-Finished  
    }
    elseif (($command -eq "monitor-job") -and ($null -eq $serverfiles)) {
        Write-Host 'Server FolderName for monitor: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Set-MonitorJob
        Get-ClearVariables
    }
    elseif ($command -eq "monitor-job") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Set-MonitorJob
        Get-ClearVariables
    }
    elseif (($command -eq "Mod-Install") -and ($null -eq $serverfiles)) {
        Write-Host 'Server FolderName for monitor: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-Modinstall
        Get-ClearVariables
    }
    elseif ($command -eq "Mod-Install") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-Modinstall
        Get-ClearVariables
    }
    elseif (($command -eq "ws-Install") -and ($null -eq $serverfiles)) {
        Write-Host 'Server FolderName for monitor: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Install-SteamWS
        Get-ClearVariables
    }
    elseif ($command -eq "ws-Install") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Install-SteamWS
        Get-ClearVariables
    }
    elseif (($command -eq "AutoRestart") -and ($null -eq $serverfiles)) {
        Write-Host 'Server FolderName for AutoRestart: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars 
        Set-RestartJob
        Get-ClearVariables
    }
    elseif ($command -eq "AutoRestart") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Set-RestartJob
        Get-ClearVariables
    }
    elseif (($command -eq "query") -and ($null -eq $serverfiles)) {
        Write-Host 'Server FolderName for gamedig: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars 
        Get-NodeJSCheck
        Get-GamedigServerv2
        Get-ClearVariables
    }
    elseif ($command -eq "query") {
        Get-NodeJSCheck
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-GamedigServerv2
        Get-ClearVariables
    }
    elseif (($command -eq "mcrcon") -and ($null -eq $serverfiles)) {
        Write-Host 'Server FolderName for mcrcon: ' -F C -N
        $global:serverfiles = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-MCRconCheck 
        set-connectMCRcon
        Get-ClearVariables
    }
    elseif ($command -eq "mcrcon") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-MCRconCheck
        set-connectMCRcon
        Get-ClearVariables
    }
    elseif ($command -eq "discord") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        New-DiscordAlert
        Get-ClearVariables
    }
    elseif ($command -eq "details") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-NodeJSCheck
        Get-details
        Get-DriveSpace
        Get-ClearVariables
    }
    elseif ($command -eq "exit") {
        exit
    }
    elseif (($command -eq "ssm") -and ($serverfiles -eq "update")) {
        Get-UpdateSteamer   
    }
    else {
        Write-Host "Format:  ./ssm <Command> <serverFolderName>" -F Yellow -BackgroundColor Black
        Write-Host "IE:      ./ssm install  insserver" -F Yellow -BackgroundColor Black
        Write-Host "Command not found! Available Commands" -F Red -BackgroundColor Black
        Write-Host "install"
        Write-Host "update"
        Write-Host "ForceUpdate"
        Write-Host "validate"
        Write-Host "start"
        Write-Host "stop"
        Write-Host "restart"
        Write-Host "backup"
        Write-Host "exit"
        Write-Host "query"
        Write-Host "monitor"
        Write-Host "monitor-job"
        Write-Host "Mod-Install - SourceMod and Oxide Install"
        Write-Host "ws-Install  - WorkShop Install"
        Write-Host "mcrcon"
        Write-Host "AutoRestart"
        Write-Host "discord"
        Write-Host "details"
        Write-Host "ssm update"
    }
}
