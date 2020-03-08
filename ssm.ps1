#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
$script:command = $($args[0])
$script:serverfiles = $($args[1])
$script:currentdir = Get-Location
$script:serverdir = "$currentdir\$serverfiles"
${script:EXTIP} = (Invoke-WebRequest -uri "http://ifconfig.me/ip"  -UseBasicParsing -ea SilentlyContinue ).Content
${script:IP} = ((ipconfig | findstr [0-9].\.)[0]).Split()[-1]
$script:Date = get-date -Format yyyyMMddTHHmmssffff
$script:loggingDate = get-date -Format MM-dd-yyyy-hh:mm:ss
$script:logDate = Get-Date -Format MM-dd-yyyy

# Default-config
$script:defaultconfigurl = "https://raw.githubusercontent.com/Robomikel/config-default/master"
$script:defaultconfigdirectory = "$currentdir\config-default"

# Game-Server-configs
$script:githuburl = "https://raw.githubusercontent.com/GameServerManagers/Game-Server-Configs/master"

# NodeJs Version "12.13.1"
$script:nodeversion = "12.15.0"
$script:nodejsurl = "https://nodejs.org/dist/v$nodeversion/node-v$nodeversion-win-x64.zip"
$script:nodejsoutput = "node-v$nodeversion-win-x64.zip"
$script:nodejsdirectory = "$currentdir\node-v$nodeversion-win-x64"
$script:nodejsexecutable = "$nodejsdirectory\node.exe"

# Oxide
$script:oxiderustlatestlink = "https://umod.org/games/rust/download"
$script:oxideoutput = "$currentdir\oxide.zip"
$script:oxidedirectory = "$currentdir\oxide"

# Metamod
$script:metamodmversion = "1.10"
$script:metamodoutput = "$currentdir\metamod.zip"
$script:metamoddirectory = "$currentdir\metamod"

# Sourcemod
$script:sourcemodmversion = "1.10"
$script:sourcemodoutput = "$currentdir\sourcemod.zip"
$script:sourcemoddirectory = "$currentdir\sourcemod"

# 7-Zip Portable
$script:sevenzipurl = "https://www.7-zip.org/a/7za920.zip"
$script:sevenzipoutput = "$currentdir\7za920.zip"
$script:sevenzipversion = "7za920"
$script:sevenzipdirectory = "$currentdir\$sevenzipversion"
$script:sevenzipexecutable = "$sevenzipdirectory\7za.exe"

# Steam
$script:steamurl = "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
$script:steamoutput = "steamcmd.zip"
$script:steamdirectory = "$currentdir\SteamCMD"
$script:steamexecutable = "$steamdirectory\steamCMD.exe"
$script:steamcmdparmas = @("+@ShutdownOnFailedCommand 1", "+@NoPromptForPassword 1", "+login", "anonymous","$username", "$password", "+force_install_dir $serverdir", "+app_update $appid $branch", "+app_update $appid $branch validate", "+Exit")

# Steamer url
$script:steamerurl = "https://github.com/Robomikel/Steam-Server-Manger/archive/master.zip"

# Mcrcon
$script:mcrconurl = "https://github.com/Tiiffi/mcrcon/releases/download/v0.7.1/mcrcon-0.7.1-windows-x86-32.zip"
$script:mcrconoutput = "mcrcon.zip"
$script:mcrcondirectory = "$currentdir\mcrcon"
$script:mcrconexecutable = "$mcrcondirectory\mcrcon.exe"

# Forge
$script:forgeversion = "1.15.2-31.1.2"

$script:RANDOMPASSWORD = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 11 | ForEach-Object { [char]$_ })

$script:SMILEY_WHITE = ([char]9786)
$script:SMILEY_BLACK = ([char]9787)
$script:GEAR = ([char]9788)
$script:HEART = ([char]9829)
$script:DIAMOND = ([char]9830)
$script:CLUB = ([char]9827)
$script:SPADE = ([char]9824)
$script:CIRCLE = ([char]8226)
$script:NOTE1 = ([char]9834)
$script:NOTE2 = ([char]9835)
$script:CHECKMARK = ([char]8730) 

Get-ChildItem -Path $currentdir\functions -Filter *.ps1 | ForEach-Object { . $_.FullName }
Get-ChildItem -Path $currentdir\config-default -Filter *.ps1 | ForEach-Object { . $_.FullName }
Set-SteamerSetting
# If ($ssmlogging -eq "on") { Start-Transcript -Path "$currentdir\log\ssm\Steamer-$Date.log" -Append -NoClobber}
If (!(Test-Path $currentdir\log\ssm)){mkdir $currentdir\log\ssm}
Set-Console  >$null 2>&1
Set-Steamer
##########################################################################