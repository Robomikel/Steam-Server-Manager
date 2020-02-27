#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-BackupFolder {
    If (($backupdir) -and ($currentdir)) {
        If ((Test-Path $backupdir)) { 
            # Write-Host '****   Backup folder exists!   ****' -F Y -B Black  
            Add-Content $ssmlogdir\ssm-$logDate.log "[$loggingDate]****   Backup folder exists!   ****"
        } 
        ElseIf (!(Test-Path $backupdir)) {  
            # Write-Host '****   Creating backup folder   ****' -F M -B Black
            Add-Content $ssmlogdir\ssm-$logDate.log "[$loggingDate]****   Creating backup folder   ****"
            New-Item  "$currentdir" -Name "backups" -ItemType "directory" 3>&1 2>&1 >>  $ssmlogdir\ssm-$logDate.log
            If (!$?) {
                Write-Warning 'Creating backup folder Failed'
                Break
            }
        }
    }
    ElseIf (!$?) {
        Add-Content $ssmlogdir\ssm-$logDate.log "[$loggingDate]**** fn_New-BackupFolder failed missing $currentdir, $backupdir ****"
        # Write-Warning 'Fn - New-BackupFolder Failed'
        Break
    }
}