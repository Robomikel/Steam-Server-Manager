#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Set-SteamerSetting {
    # Write-log "Function: Set-SteamerSetting"
    #                               ####  Steamer Settings #######
    #                               Show Backup Console
    $script:Showbackupconsole       = "on"
    #                               backup log open
    $script:backuplogopen           = "on"
    #                               backup logs
    $script:backuplogs              = "on"
    #                               app data backup log open 
    $script:appdatabackuplogopen    = "on"
    #                               Appdata backup 
    $script:appdatabackup           = "on"
    #                               max backups  
    $script:maxbackups              = "2"
    #                               Stop On Backup
    $script:stoponbackup            = "on"
    #                               logo 
    $script:logo                    = "on"
    #                               Admin message
    $script:admincheckmessage       = "on"
    #                               Update on start. Depends on "Check Update on start"
    $script:updateonstart           = "on"
    #                               Check Update on start.
    $script:checkupdateonstart      = "on"
    #                               Stop on "Update on start" 
    $script:stoponupdateonstart     = "on"
    #                               check scheduled Task
    $script:Checktask               = "on"
    #                               Discord Alert
    $script:DiscordAlert            = "on"
    #                               Discord backup Alert
    $script:DiscordBackupAlert      = "on"
    #                               Discord Update Alert 
    $script:DiscordUpdateAlert      = "on"
    #                               Discord Restart Alert 
    $script:DiscordRestartAlert     = "on"
    #                               Use private IP for Query and mcrcon
    $script:Useprivate              = "off"
    #                               consolelogging
    $script:consolelogging          = "on"
    #                               consolelogging count 
    $script:consolelogcount         = "10"
    #                               ssmlogging
    $script:ssmlogging              = "on"
    #                               ssmlogging count 
    $script:ssmlogcount             = "10"
    #                               Console Text Color 
    $script:textcolor               = "White" # DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
    #                               Version  0 prompt for input, 1 no prompt during install
    $script:Version                 = "0"
    #                               Server List Directory
    $script:serverlistdir           = "$currentdir\data"
    #                               Backup Directory
    $script:backupdir               = "$currentdir\backups"
    #                               ssm log Directory
    $script:ssmlogdir               = "$currentdir\log\ssm"
    #                               log Directory
    $script:logdir                  = "$currentdir\log"
    #                               SSM Log
    $script:ssmlog                  = "$ssmlogdir\ssm-$logdate.log"
    #                               Empty Variable checking
    $script:testvariable            = "on"
    #                               Debug log
    $script:debuglog                = "on"
    #                               SSM Error Log
    $script:ssmerrorlog             = "$ssmlogdir\ssm-Error-$errorloggingDate.log"
    #                               MC Version
    $script:mcversion               = "`$serverfiles\version.txt"
    #                               Test Connection to Steam Master
    $script:steammastercheck        = "on"
    #                               Server Console log to Pastebin
    $script:pastebinconsolelog      = "off"
    #                               Pastebin Time -  Never: N, 10 Minutes: 10M, 1 Hour: 1H, 1 Day: 1D, 1 Week: 1W, 2 Weeks: 2W, 1 Month: 1M
    $script:pastebinexpires         = "1D"
    #                               Pastebin username
    $script:PastebinUsername        = ""
    #                               Pastebin pwd
    $script:PastebinPassword        = ""
    #                               Pastebin Dev Key
    $script:PastebinDeveloperKey    = ''
    #                               Discord Webhook 
    $script:discordwebhook          = ""
    #                               Discord Display IP and Steam API IP.
    $script:discorddisplayip        = ""
    #                               Discord Icon URL
    $script:AuthorIconURL           = "https://i.imgur.com/yp6wLLa.png"
    #                               Discord Thumbnail URL 
    $script:ThumbnailURL            = "https://i.imgur.com/yp6wLLa.png"
    #                               Discord Avatar URL
    $script:AvatarUrl               = "https://i.imgur.com/yp6wLLa.png"
    # Set-SteamerSettingLog
}