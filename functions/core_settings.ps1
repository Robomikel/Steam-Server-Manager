#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Set-SteamerSetting {
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
    #                               Discord backup Alert
    $global:DiscordBackupAlert      = "on"
    #                               Discord Update Alert 
    $global:DiscordUpdateAlert      = "on"
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
    #                               Message Text Color 
    $global:textcolor               = "Blue" # DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
    #                               Version  0 prompt min, 1 prompt max, 2 no prompt
    #$global:Version                 = "1"
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
    #                               Test Connection to Steam Master
    $global:steammastercheck        = "on"
    #                               Server Console log to Pastebin
    $global:pastebinconsolelog      = "off"

}

