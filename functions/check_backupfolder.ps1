#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-BackupFolder {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($backupdir -and $ssmlog  -and $loggingDate -and $bwd) {
        If (Test-Path $backupdir) { 
            Write-log "Backup folder exists! "
        } 
        ElseIf (!(Test-Path $backupdir)) {  
            Write-log "Creating backup folder "
            New-Item  $bwd -Name "backups" -ItemType "directory" | Out-File -Append -Encoding Default  $ssmlog
            If (!$?) {
                Get-warnmessage "createfolderfailed"
            }
        }
    }
    ElseIf (!$backupdir){         
        Get-warnmessage "backupfnfailed"
    }
}
