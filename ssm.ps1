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
$ipv4 = '^((?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
# Moved $extip to function to prevent constant lookups. Only grabs when needed. hopefully will increase performance as well.
#${global:EXTIP} = If ((((${global:EXTIP} =  (Resolve-DnsName -Name o-o.myaddr.l.google.com  -Server 8.8.8.8 -DnsOnly TXT).Strings).Count) -gt 1)-or($extip -notmatch $ipv4)){(Invoke-WebRequest "http://ifconfig.me/ip" -UseBasicParsing -ea SilentlyContinue ).Content} Else {$extip[0]}
# ${global:EXTIP} = (Invoke-WebRequest -uri "http://ifconfig.me/ip"  -UseBasicParsing -ea SilentlyContinue ).Content
${global:IP} = ((ipconfig | findstr [0-9].\.)[0]).Split()[-1]
$global:Date = get-date -Format yyyyMMddTHHmmssffff
$global:loggingDate = get-date -Format MM-dd-yyyy-hh:mm:ss
$global:errorloggingDate = get-date -Format MM-dd-yyyy-hhmm
$global:logDate = Get-Date -Format MM-dd-yyyy


# Game-Server-configs
$global:githuburl = "https://raw.githubusercontent.com/GameServerManagers/Game-Server-Configs/master"

#
# Moved to install_nodejs.ps1
# $global:nodejscurrentlink = Invoke-WebRequest -Uri "https://nodejs.org/download/release/latest-v12.x/" -UseBasicParsing
# $global:nodeversion = $nodejscurrentlink.Links.href | Select-String -Pattern win-x64.zip
$global:nodejsurl = "https://nodejs.org/download/release/latest-v12.x/$nodeversion"
# $global:nodejsoutput = "$nodeversion"
$global:nodejsdirectory = "$currentdir\latest-v12.x"
$global:nodejsexecutable = "$nodejsdirectory\node.exe"
# NodeJS Program
$global:nodejsprogramexecutable = "C:\Program Files\nodejs\node.exe"

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

# 7-Zip x64 - used to see if 7zip is installed already
$global:sevenzipprogramdirectory = "C:\Program Files\7-Zip"
$global:sevenzipprogramexecutable = "$sevenzipprogramdirectory\7z.exe"

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
$global:forgeversion = "1.16.3-34.1.25"

$global:RANDOMPASSWORD = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 14 | ForEach-Object { [char]$_ })

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

If (!(Test-Path $currentdir\log\ssm)){mkdir $currentdir\log\ssm >$null 2>&1}
Get-ChildItem -Path $currentdir\functions -Filter *.ps1 | ForEach-Object { . $_.FullName }
# Get-ChildItem -Path $currentdir\config-default -Filter *.ps1 | ForEach-Object { . $_.FullName }
Set-SteamerSetting
Get-CustomSettings
Test-PSversion
# If ($ssmlogging -eq "on") { Start-Transcript -Path "$currentdir\log\ssm\Steamer-$Date.log" -Append -NoClobber}

Set-Console  >$null 2>&1
Set-Steamer
##########################################################################

