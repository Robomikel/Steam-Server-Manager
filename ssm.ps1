#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
$global:command = $($args[0])
$global:serverfiles = $($args[1])
$global:currentdir = Get-Location
$global:serverdir = "$currentdir\$serverfiles"
${global:EXTIP} = (Invoke-WebRequest -uri "http://ifconfig.me/ip"  -UseBasicParsing -ea SilentlyContinue ).Content
${global:IP} = ((ipconfig | findstr [0-9].\.)[0]).Split()[-1]
$global:Date = get-date -Format yyyyMMddTHHmmssffff
$global:loggingDate = get-date -Format MM-dd-yyyy-hh:mm:ss
$global:logDate = Get-Date -Format MM-dd-yyyy

# Game-Server-configs
$global:githuburl = "https://raw.githubusercontent.com/GameServerManagers/Game-Server-Configs/master"

# NodeJs Version "12.13.1"
$global:nodeversion = "12.15.0"
$global:nodejsurl = "https://nodejs.org/dist/v$nodeversion/node-v$nodeversion-win-x64.zip"
$global:nodejsoutput = "node-v$nodeversion-win-x64.zip"
$global:nodejsdirectory = "$currentdir\node-v$nodeversion-win-x64"
$global:nodejsexecutable = "$nodejsdirectory\node.exe"

# Oxide
$global:oxiderustlatestlink = "https://umod.org/games/rust/download"
$global:oxideoutput = "$currentdir\oxide.zip"
$global:oxidedirectory = "$currentdir\oxide"

# Metamod
$global:metamodmversion = "1.10"
$global:metamodoutput = "$currentdir\metamod.zip"
$global:metamoddirectory = "$currentdir\metamod"

# Sourcemod
$global:sourcemodmversion = "1.10"
$global:sourcemodoutput = "$currentdir\sourcemod.zip"
$global:sourcemoddirectory = "$currentdir\sourcemod"

# 7-Zip Portable
$global:sevenzipurl = "https://www.7-zip.org/a/7za920.zip"
$global:sevenzipoutput = "$currentdir\7za920.zip"
$global:sevenzipversion = "7za920"
$global:sevenzipdirectory = "$currentdir\$sevenzipversion"
$global:sevenzipexecutable = "$sevenzipdirectory\7za.exe"

# Steam
$global:steamurl = "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
$global:steamoutput = "steamcmd.zip"
$global:steamdirectory = "$currentdir\SteamCMD"
$global:steamexecutable = "$steamdirectory\steamCMD.exe"
$global:steamcmdparmas = @("+@ShutdownOnFailedCommand 1", "+@NoPromptForPassword 1", "+login", "anonymous","$username", "$password", "+force_install_dir $serverdir", "+app_update $appid $branch", "+app_update $appid $branch validate", "+Exit")

# Steamer url
$global:steamerurl = "https://github.com/Robomikel/Steam-Server-Manger/archive/master.zip"

# Mcrcon
$global:mcrconurl = "https://github.com/Tiiffi/mcrcon/releases/download/v0.7.1/mcrcon-0.7.1-windows-x86-32.zip"
$global:mcrconoutput = "mcrcon.zip"
$global:mcrcondirectory = "$currentdir\mcrcon"
$global:mcrconexecutable = "$mcrcondirectory\mcrcon.exe"

# Forge
$global:forgeversion = "1.15.2-31.1.2"

$global:RANDOMPASSWORD = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 11 | ForEach-Object { [char]$_ })

$global:SMILEY_WHITE = ([char]9786)
$global:SMILEY_BLACK = ([char]9787)
$global:GEAR = ([char]9788)
$global:HEART = ([char]9829)
$global:DIAMOND = ([char]9830)
$global:CLUB = ([char]9827)
$global:SPADE = ([char]9824)
$global:CIRCLE = ([char]8226)
$global:NOTE1 = ([char]9834)
$global:NOTE2 = ([char]9835)
$global:CHECKMARK = ([char]8730) 

Get-ChildItem -Path $currentdir\functions -Filter *.ps1 | ForEach-Object { . $_.FullName }
Get-ChildItem -Path $currentdir\config-default -Filter *.ps1 | ForEach-Object { . $_.FullName }
Set-SteamerSetting
# If ($ssmlogging -eq "on") { Start-Transcript -Path "$currentdir\log\ssm\Steamer-$Date.log" -Append -NoClobber}
If (!(Test-Path $currentdir\log\ssm)){mkdir $currentdir\log\ssm}
If (!(Test-Path $currentdir\config)){mkdir $currentdir\config}
If (Test-Path $currentdir\config\*.ps1) {
    Write-log "Found custom config .ps1"
    Get-ChildItem -Path $currentdir\config -Filter *.ps1 | ForEach-Object { . $_.FullName }
}
Set-Console  >$null 2>&1
Set-Steamer
##########################################################################