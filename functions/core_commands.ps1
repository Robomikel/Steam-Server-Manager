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
        $global:command,
        [string[]]
        [Parameter(Mandatory = $false, Position = 1)]
        #[ValidatePattern('^[a-z,A-Z]$')]
        $global:server)
    Set-Console  >$null 2>&1
    If (($global:command -eq "install") -and ($null -eq $global:server)) {     
        Write-Host 'Input Server Folder Name make unique to instance [i.e. sdtdserver (No Spaces!)]: ' -F C -N
        $global:server = Read-host
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
    elseif ($global:command -eq "install") {
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
    elseif (($global:command -eq "update") -and ($null -eq $global:server)) {   
        Write-Host 'Server FolderName for server updates: ' -F C -N
        $global:server = Read-host
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
    elseif ($global:command -eq "update") {
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
    elseif (($global:command -eq "ForceUpdate") -and ($null -eq $global:server)) {   
        Write-Host 'Server FolderName for server updates: ' -F C -N
        $global:server = Read-host
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
    elseif ($global:command -eq "ForceUpdate") {
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
    elseif (($global:command -eq "validate") -and ($null -eq $global:server)) {
        Write-Host 'Server FolderName for server validate: ' -F C -N
        $global:server = Read-host
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
    elseif ($global:command -eq "validate") {
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
    elseif (($global:command -eq "start") -and ($null -eq $global:server)) {
        Write-Host 'Server FolderName for server launch, warning stops running process!: ' -F C -N
        $global:server = Read-host
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
    elseif ($global:command -eq "start") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars   
        Get-CheckServer
        Get-ServerBuildCheck
        Select-StartServer
        Get-ChecktaskEnable
        Get-ClearVariables
    }
    elseif (($global:command -eq "stop") -and ($null -eq $global:server)) {
        Write-Host 'Server FolderName for server stop, warning stops running process!: ' -F C -N
        $global:server = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-ChecktaskDisable
        Get-StopServer
        Get-ClearVariables
    }
    elseif ($global:command -eq "stop") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-ChecktaskDisable
        Get-StopServer
        Get-ClearVariables 
    }
    elseif (($global:command -eq "restart") -and ($null -eq $global:server)) {
        Write-Host 'Server FolderName for server restart, warning stops running process!: ' -F C -N
        $global:server = Read-host
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
    elseif ($global:command -eq "restart") {
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
    elseif (($global:command -eq "check") -and ($null -eq $global:server)) {
        Write-Host 'Server FolderName for server check: ' -F C -N
        $global:server = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars 
        Get-CheckServer
        Get-ClearVariables
    }
    elseif ($global:command -eq "check") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-CheckServer
        Get-ClearVariables
    }
    elseif (($global:command -eq "backup") -and ($null -eq $global:server)) {
        Write-Host 'Server FolderName for server backup: ' -F C -N
        $global:server = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars 
        Get-SevenZip
        Get-ChecktaskDisable
        Get-StopServer
        New-BackupFolder
        New-BackupServer
        Get-ChecktaskEnable
        New-DiscordAlert
        Get-Finished
    }
    elseif ($global:command -eq "backup") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-SevenZip
        Get-ChecktaskDisable
        Get-StopServer
        New-BackupFolder  
        New-BackupServer
        Get-ChecktaskEnable
        New-DiscordAlert
        Get-Finished  
    }
    elseif (($global:command -eq "monitor") -and ($null -eq $global:server)) {
        Write-Host 'Server FolderName for monitor: ' -F C -N
        $global:server = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Set-MonitorJob
        Get-ClearVariables
    }
    elseif ($global:command -eq "monitor") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Set-MonitorJob
        Get-ClearVariables
    }
    elseif (($global:command -eq "ModInstall") -and ($null -eq $global:server)) {
        Write-Host 'Server FolderName for monitor: ' -F C -N
        $global:server = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-Modinstall
        Get-ClearVariables
    }
    elseif ($global:command -eq "ModInstall") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-Modinstall
        Get-ClearVariables
    }
    elseif (($global:command -eq "wsInstall") -and ($null -eq $global:server)) {
        Write-Host 'Server FolderName for monitor: ' -F C -N
        $global:server = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Install-SteamWS
        Get-ClearVariables
    }
    elseif ($global:command -eq "wsInstall") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Install-SteamWS
        Get-ClearVariables
    }
    elseif (($global:command -eq "AutoRestart") -and ($null -eq $global:server)) {
        Write-Host 'Server FolderName for AutoRestart: ' -F C -N
        $global:server = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars 
        Set-RestartJob
        Get-ClearVariables
    }
    elseif ($global:command -eq "AutoRestart") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Set-RestartJob
        Get-ClearVariables
    }
    elseif (($global:command -eq "gamedig") -and ($null -eq $global:server)) {
        Write-Host 'Server FolderName for gamedig: ' -F C -N
        $global:server = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars 
        Get-NodeJS
        Get-GamedigServerv2
        Get-ClearVariables
    }
    elseif ($global:command -eq "gamedig") {
        Get-NodeJS
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-GamedigServerv2
        Get-ClearVariables
    }
    elseif (($global:command -eq "mcrcon") -and ($null -eq $global:server)) {
        Write-Host 'Server FolderName for mcrcon: ' -F C -N
        $global:server = Read-host
        Get-TestString
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-MCRcon 
        set-connectMCRcon
        Get-ClearVariables
    }
    elseif ($global:command -eq "mcrcon") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-MCRcon
        set-connectMCRcon
        Get-ClearVariables
    }
    elseif ($global:command -eq "discord") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        New-DiscordAlert
        Get-ClearVariables
    }
    elseif ($global:command -eq "details") {
        Get-FolderNames
        Get-createdvaribles
        Get-CheckForVars
        Get-NodeJS
        Get-details
        Get-DriveSpace
        Get-ClearVariables
    }
    elseif ($global:command -eq "exit") {
        exit
    }
    elseif (($global:command -eq "ssm") -and ($global:server -eq "update")) {
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
        Write-Host "check"
        Write-Host "backup"
        Write-Host "exit"
        Write-Host "gamedig"
        Write-Host "monitor"
        Write-Host "ModInstall"
        Write-Host "mcrcon"
        Write-Host "AutoRestart"
        Write-Host "discord"
        Write-Host "details"
        Write-Host "ssm update"
    }
}
