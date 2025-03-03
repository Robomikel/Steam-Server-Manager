#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
param(
    [ValidateSet('install', 'update', 'force-update', 'validate', 'start', 'stop', 'restart', 'monitor', 'backup', 'restore', 'install-monitor', 'install-mod', 'install-ws', 'install-restart', 'install-backup', 'query', 'mcrcon', 'discord', 'details', 'install-vcredist','install-Ntop',  'stats', 'menu', 'exit', 'ssm', 'update-mods','start-pode')]
    [Parameter(ParameterSetName = "steamer", Position = 0)]
    [string]$command,
    [Parameter(ParameterSetName = "steamer", Position = 1)]
    [string]$serverfiles,
    [switch]$disableclearvariable)
If ($serverfiles) {    
    if ($serverfiles.Contains('\')) {
        $serverfiles = Split-Path $serverfiles -Leaf
    }
}
# $command = $($args[0])
# $serverfiles = $($args[1])
$currentdir = $PSScriptRoot
$ipv4 = '^((?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
${IP} = ((ipconfig | findstr [0-9].\.)[0]).Split()[-1]
$Date = get-date -Format yyyyMMddTHHmmssffff
$loggingDate = get-date -Format MM-dd-yyyy-hh:mm:ss
$errorloggingDate = get-date -Format MM-dd-yyyy-hhmm
$logDate = Get-Date -Format MM-dd-yyyy

# Game-Server-configs
$githuburl = "https://raw.githubusercontent.com/GameServerManagers/Game-Server-Configs/master"

# NodeJS
# $nodejslatest = "latest-v12.x"
$nodejslatest = "v20.17.0" # Max version for Gamedig currently
# $nodejslatest = "latest-v16.x" # this version doesn't work for gamedig
$nodejsurl = "https://nodejs.org/download/release/$nodejslatest/$nodeversion"
$nodejsdirectory = "$currentdir\$nodejslatest"
$nodejsexecutable = "$nodejsdirectory\node.exe"
$nodejsprogramexecutable = "C:\Program Files\nodejs\node.exe"

# Oxide
# https://github.com/OxideMod/Oxide.Rust
$oxiderustowner = "OxideMod" 
$oxiderustrepo = "Oxide.Rust"

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

# Black Mesa DM SrcCoop
$bmdmsrccoopowner = 'ampreeT'
$bmdmsrccooprepo = 'SourceCoop'

# GC-Server-Conf-Template
$gcserverconfowner = 'Buff-oG'
$gcserverconfrepo = 'GC-Server-Conf-Template'

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
$forgeversion = "1.19.3-44.1.0"

# Pode
$Podesetupowner = 'Badgerati'
$Podesetuprepo = 'Pode'
$podedirectory = "$currentdir\pode"

# AssettoServer
$AssettoServerowner = 'compujuckel'
$AssettoServersetuprepo = 'AssettoServer'
$AssettoServerdirectory = "$currentdir\AssettoServer"

# TShock
$TShockowner = 'Pryaxis'
$TShocksetuprepo = 'TShock'
$TShockdirectory = "$currentdir\TShock"

# NTop
$NTopowner = 'gsass1'
$NTopsetuprepo = 'NTop'
$NTopdirectory = "$currentdir\NTop.exe"

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

# Runs better on PowerShell 5
# $posh = switch -Regex ([string]$ps = $($pSVersionTable.PSVersion)) {
#     ("7.4") {"C:\Program Files\PowerShell\7\pwsh"}
#     ("7.5") {"C:\Program Files (x86)\PowerShell\7-preview\pwsh"}
#     Default {"powershell"}
# }
$posh = "powershell"

If (!(Test-Path $currentdir\log\ssm)) { New-Item -ItemType Directory $currentdir\log\ssm >$null 2>&1 }
Get-ChildItem -Path $currentdir\functions -Filter *.ps1 | ForEach-Object { . $_.FullName }
# Get-ChildItem -Path $currentdir\config-default -Filter *.ps1 | ForEach-Object { . $_.FullName }
Set-SteamerSetting
Get-CustomSettings
if ($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent) { $logo = "off" }
Test-PSversion
# If ($ssmlogging -eq "on") { Start-Transcript -Path "$currentdir\log\ssm\Steamer-$Date.log" -Append -NoClobber}

Set-Console  >$null 2>&1
Set-Steamer
##########################################################################