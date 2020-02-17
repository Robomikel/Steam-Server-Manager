#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-BackupServer {
    Write-Host '****   Server Backup Started!   ****' -F M -B Black
    Set-Location $global:currentdir\7za920\
    Get-Childitem $global:currentdir\backups\ -Recurse | where-object name -like Backup_$global:server-*.zip | Sort-Object CreationTime -desc | Select-Object -Skip $global:backupcount | Remove-Item -Force 
    #./7za a $global:currentdir\backups\Backup_$global:server-$BackupDate.zip $global:currentdir\$global:server\* -an > backup.log
    ./7za a $global:currentdir\backups\Backup_$global:server-$global:Date.zip $global:currentdir\$global:server\* > backup.log
    Write-Host '****   Server Backup is Done!   ****' -F Y -B Black
    Write-Host "****   Checking Save location(appData)   ****" -F Y -B Black
    If ($global:appdatabackup -eq "1") { 
        Get-Savelocation 
    }
    New-ServerBackupLog
    If ($global:backuplog -eq "1") { 
        .\backup.log 
    }
    Set-Location $global:currentdir
}
Function New-backupAppdata {
    Write-Host '****   Server App Data Backup Started!   ****' -F M -B Black
    Set-Location $global:currentdir\7za920\ 
    ./7za a $global:currentdir\backups\AppDataBackup_$global:server-$global:Date.zip $env:APPDATA\$global:saves\* > AppDatabackup.log
    Write-Host '****   Server App Data Backup is Done!   ****' -F Y -B Black
    If ($global:appdatabackuplog -eq "1") { 
        .\AppDatabackup.log 
    }
}