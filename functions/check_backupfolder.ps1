#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-BackupFolder {
    If ($backupdir) {
        If (Test-Path $backupdir) { 
            Add-Content $ssmlog "[$loggingDate] Backup folder exists! "
        } 
        ElseIf (!(Test-Path $backupdir)) {  
            Add-Content $ssmlog "[$loggingDate] Creating backup folder "
            New-Item  "$currentdir" -Name "backups" -ItemType "directory" | Out-File -Append -Encoding Default  $ssmlog
            If (!$?) {
                $global:warnmessage = "createfolderfailed"
                Get-warnmessage
                
            }
        }
    }
    ElseIf (!($backupdir)){
        $global:warnmessage = "backupfnfailed"
        Get-warnmessage
        
    }
}