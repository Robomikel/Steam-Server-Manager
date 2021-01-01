#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
param(
    [ValidateSet('install', 'update', 'force-update', 'validate', 'start', 'stop', 'restart', 'monitor', 'backup', 'restore', 'install-monitor', 'install-mod', 'install-ws', 'install-Restart', 'query', 'mcrcon', 'discord', 'details', 'install-VcRedist', 'stats', 'menu', 'exit','ssm','update-mods')]    
    $command,
    $serverfiles)
If ($serverfiles) {    
    if ($serverfiles.Contains('\')) {
        $serverfiles = Split-Path $serverfiles -Leaf
    }
}
# $command = $($args[0])
# $serverfiles = $($args[1])
$currentdir = Get-Location
$serverdir = "$currentdir\$serverfiles"
$ipv4 = '^((?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
${IP} = ((ipconfig | findstr [0-9].\.)[0]).Split()[-1]
$Date = get-date -Format yyyyMMddTHHmmssffff
$loggingDate = get-date -Format MM-dd-yyyy-hh:mm:ss
$errorloggingDate = get-date -Format MM-dd-yyyy-hhmm
$logDate = Get-Date -Format MM-dd-yyyy

# Game-Server-configs
$githuburl = "https://raw.githubusercontent.com/GameServerManagers/Game-Server-Configs/master"

# NodeJS 12 LTS
$nodejsurl = "https://nodejs.org/download/release/latest-v12.x/$nodeversion"
$nodejsdirectory = "$currentdir\latest-v12.x"
$nodejsexecutable = "$nodejsdirectory\node.exe"
$nodejsprogramexecutable = "C:\Program Files\nodejs\node.exe"

# Oxide
$oxiderustlatestlink = "https://umod.org/games/rust/download"
$oxideoutput = "$currentdir\oxide.zip"
$oxidedirectory = "$currentdir\oxide"

# Sourcemod
#"https://sm.alliedmods.net/smdrop/$sourcemodmversion/sourcemod-latest-windows"

# Metamod
#"https://mms.alliedmods.net/mmsdrop/$metamodmversion/mmsource-latest-windows"

# CSGO Get5
# github release
# $csgoget5url = "https://github.com/splewis/get5/releases/download/0.7.1/get5_0.7.1.zip"
# Latest Dev release
$csgoget5url = "https://ci.splewis.net/job/get5/lastSuccessfulBuild/artifact/builds/get5/"

# CSGO Pug-setup
$Pugsetupowner = 'splewis'
$Pugsetuprepo = 'csgo-pug-setup'

# SteamWorks
$steamworksurl = "https://users.alliedmods.net/~kyles/builds/SteamWorks/"

# 7-Zip Portable
$sevenzipurl = "https://www.7-zip.org/a/7za920.zip"
$sevenzipoutput = "$currentdir\7za920.zip"
$sevenzipversion = "7za920"
$sevenzipdirectory = "$currentdir\$sevenzipversion"
$sevenzipexecutable = "$sevenzipdirectory\7za.exe"

# 7-Zip x64 - used to see if 7zip is installed already
$sevenzipprogramdirectory = "C:\Program Files\7-Zip"
$sevenzipprogramexecutable = "$sevenzipprogramdirectory\7z.exe"

# Steam
$steamurl = "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
$steamoutput = "steamcmd.zip"
$steamdirectory = "$currentdir\SteamCMD"
$steamexecutable = "$steamdirectory\steamCMD.exe"
# $steamcmdparmas = @("+@ShutdownOnFailedCommand 1", "+@NoPromptForPassword 1", "+login", "anonymous","$username", "$password", "+force_install_dir $serverdir", "+app_update $appid $branch", "+app_update $appid $branch validate", "+Exit")

# Steamer url
$steamerurl = "https://github.com/Robomikel/Steam-Server-Manger/archive/master.zip"

# Mcrcon
$mcrcondirectory = "$currentdir\mcrcon"
$mcrconexecutable = "$mcrcondirectory\mcrcon.exe"
$mcrconowner = "Tiiffi"
$mcrconrepo = "mcrcon"

# Forge
$forgeversion = "1.16.4-35.1.4"

$RANDOMPASSWORD = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 14 | ForEach-Object { [char]$_ })

$SMILEY_WHITE = ([char]9786)
$SMILEY_BLACK = ([char]9787)
$GEAR = ([char]9788)
$HEART = ([char]9829)
$DIAMOND = ([char]9830)
$CLUB = ([char]9827)
$SPADE = ([char]9824)
$CIRCLE = ([char]8226)
$NOTE1 = ([char]9834)
$NOTE2 = ([char]9835)
$CHECKMARK = ([char]8730) 

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

