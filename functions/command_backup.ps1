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