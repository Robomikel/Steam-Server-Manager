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
    Set-Location $currentdir\7za920\
    Get-Childitem $currentdir\backups\ -Recurse | where-object name -like Backup_$server-*.zip | Sort-Object CreationTime -desc | Select-Object -Skip $backupcount | Remove-Item -Force 
    #./7za a $currentdir\backups\Backup_$server-$BackupDate.zip $currentdir\$server\* -an > backup.log
    ./7za a $currentdir\backups\Backup_$server-$Date.zip $currentdir\$server\* > backup.log
    Write-Host '****   Server Backup is Done!   ****' -F Y -B Black
    Write-Host "****   Checking Save location(appData)   ****" -F Y -B Black
    If ($appdatabackup -eq "on") { 
        Get-Savelocation 
    }
    New-ServerBackupLog
    If ($backuplogopen -eq "on") { 
        .\backup.log 
    }
    $global:alert = "Backup"
    New-DiscordAlert
    Set-Location $currentdir
}
Function New-backupAppdata {
    Write-Host '****   Server App Data Backup Started!   ****' -F M -B Black
    Set-Location $currentdir\7za920\ 
    ./7za a $currentdir\backups\AppDataBackup_$server-$Date.zip $env:APPDATA\$saves\* > AppDatabackup.log
    Write-Host '****   Server App Data Backup is Done!   ****' -F Y -B Black
    If ($appdatabackuplogopen -eq "on") { 
        .\AppDatabackup.log 
    }
}