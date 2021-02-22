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
    $global:Showbackupconsole       = "on"
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
    #                               Update on start. Depends on "Check Update on start"
    $global:updateonstart           = "on"
    #                               Check Update on start.
    $global:checkupdateonstart      = "on"
    #                               Stop on "Update on start" 
    $global:stoponupdateonstart     = "on"
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
    #                               Monitor Query
    $global:monquery                = "off"
    #                               consolelogging
    $global:consolelogging          = "on"
    #                               consolelogging count 
    $global:consolelogcount         = "10"
    #                               ssmlogging
    $global:ssmlogging              = "on"
    #                               ssmlogging count 
    $global:ssmlogcount             = "10"
    #                               Console Text Color 
    $global:textcolor               = "White" # DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
    #                               Version  0 prompt for input, 1 no prompt during install
    $global:Version                 = "0"
    #                               Server List Directory
    $global:serverlistdir           = "$currentdir\data"
    #                               Backup Directory
    $global:backupdir               = "$bwd\backups"
    #                               ssm log Directory
    $global:ssmlogdir               = "$currentdir\log\ssm"
    #                               log Directory
    $global:logdir                  = "$currentdir\log"
    #                               SSM Log
    $global:ssmlog                  = "$ssmlogdir\ssm-$logdate.log"
    #                               Empty Variable checking
    $global:testvariable            = "on"
    #                               Debug log
    $global:debuglog                = "off"
    #                               SSM Error Log
    $global:ssmerrorlog             = "$ssmlogdir\ssm-Error-$errorloggingDate.log"
    #                               MC Version
    $global:mcversion               = "`$serverfiles\version.txt"
    #                               Test Connection to Steam Master
    $global:steammastercheck        = "on"
    #                               Server Console log to Pastebin
    $global:pastebinconsolelog      = "off"
    #                               Pastebin Time -  Never: N, 10 Minutes: 10M, 1 Hour: 1H, 1 Day: 1D, 1 Week: 1W, 2 Weeks: 2W, 1 Month: 1M
    $global:pastebinexpires         = "1D"
    #                               Pastebin username
    $global:PastebinUsername        = ""
    #                               Pastebin pwd
    $global:PastebinPassword        = ""
    #                               Pastebin Dev Key
    $global:PastebinDeveloperKey    = ''
    #                               Discord Webhook 
    $global:discordwebhook          = ""
    #                               Discord Display IP and Steam API IP.
    $global:discorddisplayip        = ""
    #                               Discord Icon URL
    $global:AuthorIconURL           = "https://i.imgur.com/B8SWNyO.png?1"
    #                               Discord Thumbnail URL 
    $global:ThumbnailURL            = "https://i.imgur.com/B8SWNyO.png?1"
    #                               Discord Avatar URL
    $global:AvatarUrl               = "https://i.imgur.com/B8SWNyO.png?1"
    #                               SourceMod Version
    $global:smversion               = 'stable' # stable / dev
    #                               MetaMod Version
    $global:mmversion               = 'stable' # stable / master 

    #############   Custom Directories        ###############
    #                                Backup Directory 
    $global:bwd                     = "$PSScriptRoot"
    #                               Serverfiles Directory
    $global:sfwd                    = "$PSScriptRoot"
    #########################################################
    #                                 Do Not Change
    $global:serverdir               = "$sfwd\$serverfiles"

    # Set-SteamerSettingLog
}

