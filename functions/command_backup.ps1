#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-BackupServer {
    If ($stoponbackup = "on") { 
        Get-StopServer 
    }
    
    Write-Host '****   Server Backup Started!   ****' -F M -B Black
    Set-Location $sevenzipdirectory
    #./7za a $currentdir\backups\Backup_$serverfiles-$BackupDate.zip $currentdir\$serverfiles\* -an > backup.log
    ./7za a $backupdir\Backup_$serverfiles-$Date.zip $currentdir\$serverfiles\* > backup.log
    Write-Host '****   Server Backup is Done!   ****' -F Y -B Black
    Write-Host "****   Checking Save location(appData)   ****" -F Y -B Black
    If ($appdatabackup -eq "on") { 
        Get-Savelocation 
    }
    New-ServerBackupLog
    If ($backuplogopen -eq "on") {
        Set-Location $sevenzipdirectory 
        .\backup.log 
    }
    Limit-Backups
    $global:alert = "Backup"
    New-DiscordAlert
    Set-Location $currentdir
    
}
Function New-backupAppdata {
    Write-Host '****   Server App Data Backup Started!   ****' -F M -B Black
    Set-Location $sevenzipdirectory
    ./7za a $backupdir\AppDataBackup_$serverfiles-$Date.zip $env:APPDATA\$saves\* > AppDatabackup.log
    Write-Host '****   Server App Data Backup is Done!   ****' -F Y -B Black
    If ($appdatabackuplogopen -eq "on") { 
        .\AppDatabackup.log 
    }
    Limit-AppdataBackups
}

Function Limit-Backups {
    Write-Host '****   Purging Backups   ****' -F M -B Black
    Set-Location $sevenzipdirectory
    Get-Childitem $backupdir\ -Recurse | where-object name -like Backup_$serverfiles-*.zip | Sort-Object CreationTime -desc | Select-Object -Skip $maxbackups | Remove-Item -Force 
    Set-Location $currentdir
}

Function Limit-AppdataBackups {
    Write-Host '****   Purging AppData Backups   ****' -F M -B Black
    Set-Location $sevenzipdirectory
    Get-Childitem $backupdir\ -Recurse | where-object name -like AppDataBackup__$serverfiles-*.zip | Sort-Object CreationTime -desc | Select-Object -Skip $maxbackups | Remove-Item -Force 
    Set-Location $currentdir
}