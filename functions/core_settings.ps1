# Version 2.5
# .::::::.::::::::::::.,::::::   :::.     .        :  .,:::::: :::::::..   
# ;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;;'''' ;;;;``;;;;  
# '[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[, [[cccc   [[[,/[[['  
#   '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$ $$""""   $$$$$$c    
#  88b    dP    88,     888oo,__ 888   888,888 Y88" 888o888oo,__ 888b "88bo,
#   "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM""""YUMMMMMMM   "W" 
#----------      Core Settings    ----------------------
Function Set-SteamerSetting {
    #####  Steamer Settings #######
    #   disable backup log open 0
    $global:backuplog = "1"
    #   disable app data backup log open 0
    $global:appdatabackuplog = "1"
    #   disable app data backup 0
    $global:appdatabackup = "1"
    #   disable Admin message 0
    $global:admincheckmessage = "1"
    #   disable Auto update in check 1
    $global:AutoUpdate = "0"
    #   disable  check Task 0
    $global:DisableChecktask = "1"
    #  max backups   x
    $global:backupcount = "2"
    #  Version  0 prompt min, 1 prompt max, 2 no prompt
    $global:Version = "1"
    #  Disable Discord backup 0
    $global:DisableDiscordBackup = "1"
    # Disable Discord backup 0
    $global:DisableDiscordUpdate = "1"
    # Use private Ip for Gamedig, mcrcon 1
    $global:Useprivate = "0"
}





