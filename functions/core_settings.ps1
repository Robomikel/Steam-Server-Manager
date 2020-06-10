#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Set-SteamerSetting {
    Write-log "Function: Set-SteamerSetting"
    #                               ####  Steamer Settings #######
    #                               Show Backup Console
    $global:Showbackupconsole       = "off"
    #                               backup log open
    $global:backuplogopen           = "on"
    #                               backup logs
    $global:backuplogs              = "on"
    #                               app data backup log open 
    $global:appdatabackuplogopen    = "on"
    #                               Appdata backup 
    $global:appdatabackup           = "on"
    #                               max backups  
    $global:maxbackups              = "2"
    #                               Stop On Backup
    $global:stoponbackup            = "on"
    #                               logo 
    $global:logo                    = "on"
    #                               Admin message
    $global:admincheckmessage       = "on"
    #                               Update on start
    $global:updateonstart           = "on"
    #                               Check Update on start
    $global:checkupdateonstart      = "on"
    #                               check scheduled Task
    $global:Checktask               = "on"
    #                               Discord Alert
    $global:DiscordAlert            = "on"
    #                               Discord backup Alert
    $global:DiscordBackupAlert      = "on"
    #                               Discord Update Alert 
    $global:DiscordUpdateAlert      = "on"
    #                               Discord Restart Alert 
    $global:DiscordRestartAlert     = "on"
    #                               Use private IP for Query and mcrcon
    $global:Useprivate              = "off"
    #                               consolelogging
    $global:consolelogging          = "on"
    #                               consolelogging count 
    $global:consolelogcount         = "10"
    #                               ssmlogging
    $global:ssmlogging              = "on"
    #                               ssmlogging count 
    $global:ssmlogcount             = "10"
    #                               Console Text Color 
    $global:textcolor               = "Blue" # DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
    #                               Version  0 prompt for input, 1 no prompt during install
    $global:Version                 = "1"
    #                               Server List Directory
    $global:serverlistdir           = "$currentdir\data"
    #                               Backup Directory
    $global:backupdir               = "$currentdir\backups"
    #                               ssm log Directory
    $global:ssmlogdir               = "$currentdir\log\ssm"
    #                               log Directory
    $global:logdir                  = "$currentdir\log"
    #                               SSM Log
    $global:ssmlog                  = "$ssmlogdir\ssm-$logdate.log"
    #                               MC Version
    $global:mcversion               = "$serverfiles\version.txt"
    #                               Test Connection to Steam Master
    $global:steammastercheck        = "on"
    #                               Server Console log to Pastebin
    $global:pastebinconsolelog      = "off"
    #                               Discord Webhook 
    $global:discordwebhook          = ""
    #                               Discord Display IP and Steam API IP. (NAT address may not resolve correctly. Use correct server Public IP here. Leave Blank for N/A)
    $global:discorddisplayip        = ""
    Set-SteamerSettingLog
}

Function Set-SteamerSettingLog {
    Write-log "Function: Set-SteamerSettingLog"
    Write-log "   #                               ####  Steamer Settings #######
    #                               Show Backup Console
    `$Showbackupconsole       = $Showbackupconsole
    #                               backup log open
    `$backuplogopen           = $backuplogopen
    #                               backup logs
    `$backuplogs              = $backuplogs 
    #                               app data backup log open 
    `$appdatabackuplogopen    = $appdatabackuplogopen
    #                               Appdata backup 
    `$appdatabackup           = $appdatabackup 
    #                               max backups  
    `$maxbackups              = $maxbackups 
    #                               Stop On Backup
    `$stoponbackup            = $stoponbackup 
    #                               logo 
    `$logo                    = $logo 
    #                               Admin message
    `$admincheckmessage       = $admincheckmessage  
    #                               Update on start
    `$updateonstart           = $updateonstart 
    #                               Check Update on start
    `$checkupdateonstart      = $checkupdateonstart
    #                               check scheduled Task
    `$Checktask               = $Checktask  
    #                               Discord Alert
    `$DiscordAlert            = $DiscordAlert  
    #                               Discord backup Alert
    `$DiscordBackupAlert      = $DiscordBackupAlert 
    #                               Discord Update Alert 
    `$DiscordUpdateAlert      = $DiscordUpdateAlert 
    #                               Discord Restart Alert 
    `$DiscordRestartAlert     = $DiscordRestartAlert
    #                               Use private IP for Query and mcrcon
    `$Useprivate              = $Useprivate  
    #                               consolelogging
    `$consolelogging          = $consolelogging 
    #                               consolelogging count 
    `$consolelogcount         = $consolelogcount 
    #                               ssmlogging
    `$ssmlogging              = $ssmlogging   
    #                               ssmlogging count 
    `$ssmlogcount             = $ssmlogcount   
    #                               Console Text Color 
    `$textcolor               = $textcolor  
    #                               Version  0 prompt for input, 1 no prompt during install
    `$Version                 = $Version  
    #                               Server List Directory
    `$serverlistdir           = $serverlistdir
    #                               Backup Directory
    `$backupdir               = $backupdir
    #                               ssm log Directory
    `$ssmlogdir               = $ssmlogdir
    #                               log Directory
    `$logdir                  = $logdir
    #                               SSM Log
    `$ssmlog                  = $ssmlog
    #                               MC Version
    `$mcversion               = $mcversion
    #                               Test Connection to Steam Master
    `$steammastercheck        = $steammastercheck 
    #                               Server Console log to Pastebin
    `$pastebinconsolelog      = $pastebinconsolelog
    #                               Discord Webhook 
    `$discordwebhook          = $discordwebhook  
    #                               Discord Display IP and Steam API IP. (NAT address may not resolve correctly. Use correct server Public IP here. Leave Blank for N/A)
    `$discorddisplayip        = $discorddisplayip  "
}

