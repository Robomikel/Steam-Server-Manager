# Final
# .::::::.::::::::::::.,::::::   :::.     .        :  .,:::::: :::::::..   
# ;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;;'''' ;;;;``;;;;  
# '[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[, [[cccc   [[[,/[[['  
#   '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$ $$""""   $$$$$$c    
#  88b    dP    88,     888oo,__ 888   888,888 Y88" 888o888oo,__ 888b "88bo,
#   "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM""""YUMMMMMMM   "W"
#----------      Core Resource Vars    ---------------------- 
$global:command = $($args[0])
$global:server = $($args[1])
$global:currentdir = Get-Location
$global:serverdir = "$global:currentdir\$global:server"
${global:EXTIP} = (Invoke-WebRequest -uri "http://ifconfig.me/ip"  -UseBasicParsing -ea SilentlyContinue ).Content
${global:IP} = ((ipconfig | findstr [0-9].\.)[0]).Split()[-1]
$global:Date = get-date -Format yyyyMMddTHHmmssffff
# Game-Server-configs
$global:githuburl = "https://raw.githubusercontent.com/GameServerManagers/Game-Server-Configs/master"

# NodeJs Version
$global:nodeversion = "12.13.1"
$global:nodejsurl = "https://nodejs.org/dist/v$global:nodeversion/node-v$global:nodeversion-win-x64.zip"

# Oxide
$global:oxiderustlatestlink = "https://umod.org/games/rust/download"

# Metamod
$global:metamodmversion = "1.10"

# Sourcemod
$global:sourcemodmversion = "1.10"

# 7-Zip Portable
$global:sevenzip = "https://www.7-zip.org/a/7za920.zip"
# Steam
$global:steamurl = "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
$global:steamoutput = "steamcmd.zip"
# Steamer url
$global:steamerurl="https://github.com/Robomikel/Steam-Server-Manger/archive/master.zip"
# Mcrcon
$global:mcrconurl = "https://github.com/Tiiffi/mcrcon/releases/download/v0.7.1/mcrcon-0.7.1-windows-x86-32.zip"
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

Get-ChildItem -Path $global:currentdir\functions -Filter *.ps1 |ForEach-Object {. $_.FullName}
Get-ChildItem -Path $global:currentdir\config-default -Filter *.ps1 |ForEach-Object {. $_.FullName}
Set-SteamerSetting
If ($global:log -eq "1") { Start-Transcript -Path "$global:currentdir\log\ssm\Steamer-$global:Date.log" -Append -NoClobber}
Set-Console  >$null 2>&1
Set-Steamer
##########################################################################