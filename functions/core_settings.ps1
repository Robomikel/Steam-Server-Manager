#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Set-SteamerSetting {
    #####  Steamer Settings #######
    #   backup log open
    $global:backuplogopen = "on"
    #   disable backup logs  0
    $global:backuplogs = "1"
    #  app data backup log open 
    $global:appdatabackuplogopen = "on"
    #   Appdata backup 
    $global:appdatabackup = "on"
    #   logo 
    $global:logo = "on"
    #   Admin message 0
    $global:admincheckmessage = "on"
    #   disable Auto update in check 1
    $global:AutoUpdate = "0"
    #   disable  check Task 0
    $global:DisableChecktask = "1"
    #  max backups   x
    $global:backupcount = "2"
    #  Version  0 prompt min, 1 prompt max, 2 no prompt
    $global:Version = "1"
    #  Discord backup Alert
    $global:DiscordBackupAlert = "on"
    #  Discord Update Alert 
    $global:DiscordUpdateAlert = "on"
    # Use private Ip for Gamedig, mcrcon 1
    $global:Useprivate = "0"
    # Disable  Logging 0
    $global:log = "1"
    #   Log count 
    $global:logcount = "10"
}





