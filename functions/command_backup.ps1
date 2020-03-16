#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-BackupServer {
    If (($sevenzipdirectory) -and ($serverfiles) -and ($backupdir) -and ($Date) -and ($serverdir) -and ($logdate)) { 
        If ($stoponbackup -eq "on") { 
            Get-StopServer 
        }
        If ($Showbackupconsole -eq "on") {
            
            Get-Infomessage "backupstart"
            Set-Location $sevenzipdirectory
            Start-Process 7za -ArgumentList ("a $backupdir\Backup_$serverfiles-$Date.zip $serverdir\* > backup_$logDate.log") -Wait
            If (!$?) {
                 
                Get-warnmessage "backupfailed"
    
            }
        }
        ElseIf ($Showbackupconsole -eq "off") {
            
            Get-Infomessage "backupstart"
            Set-Location $sevenzipdirectory
            #./7za a $currentdir\backups\Backup_$serverfiles-$BackupDate.zip $currentdir\$serverfiles\* -an > backup.log
            ./7za a $backupdir\Backup_$serverfiles-$Date.zip     $serverdir\* > backup_$logDate.log
            If (!$?) {
                 
                Get-warnmessage "backupfailed"
    
            }
        }
        Get-Infomessage "backupdone"
        Get-Infomessage "savecheck"
        If ($appdatabackup -eq "on") { 
            Get-Savelocation 
        }
        New-ServerBackupLog
        If ($backuplogopen -eq "on") {
            Set-Location $sevenzipdirectory 
            .\backup_*.log >$null 2>&1
            If (!$?) {
                Get-warnmessage "backupfailed"
    
            } 
        }
        Limit-Backups
        New-DiscordAlert "Backup"

        Set-Location $currentdir
    }
    ElseIf (!$sevenzipdirectory -or !$serverfiles -or !$backupdir) {
         
        Get-warnmessage "backupfailed"
        
    }
}
Function New-backupAppdata {
    If ($Showbackupconsole -eq "on") {
        Get-Infomessage "appdatabackupstart"
        Set-Location $sevenzipdirectory
        Start-Process 7za -ArgumentList ("a $backupdir\AppDataBackup_$serverfiles-$Date.zip $env:APPDATA\$saves\* > AppDatabackup_$logDate.log") -Wait
        If (!$?) {
             
            Get-warnmessage "backupfailed"

        }
    }
    ElseIf ($Showbackupconsole -eq "Off") {
         
        Get-Infomessage "appdatabackupstart"
        Set-Location $sevenzipdirectory
        ./7za a $backupdir\AppDataBackup_$serverfiles-$Date.zip $env:APPDATA\$saves\* > AppDatabackup_$logDate.log
        If (!$?) {
             
            Get-warnmessage "backupfailed"

        }
    }   
     
    Get-Infomessage "appdatabackupdone"
    If ($appdatabackuplogopen -eq "on") {
        Set-Location $sevenzipdirectory 
        .\AppDatabackup_*.log >$null 2>&1
        If (!$?) {
             
            Get-warnmessage "backupfailed"

        }  
    }
    Limit-AppdataBackups
}

Function Limit-Backups {
    If ($backupdir -and $maxbackups ) {
        Get-Infomessage "purgebackup"
        Set-Location $sevenzipdirectory
        Get-Childitem $backupdir -Recurse | where-object name -like Backup_$serverfiles-*.zip | Sort-Object CreationTime -desc | Select-Object -Skip $maxbackups | Remove-Item -Force 
        If (!$?) {
             
            Get-warnmessage "limitbackupfailed"

        }
        Set-Location $currentdir
    }
    ElseIf (!$backupdir -and !$maxbackups ) {
         
        Get-warnmessage "limitbackupfailed"
        

    }
}

Function Limit-AppdataBackups {
    If ($backupdir -and $maxbackups ) {
        Get-Infomessage "purgeappdatabackup"
        Set-Location $sevenzipdirectory
        Get-Childitem $backupdir -Recurse | where-object name -like AppDataBackup__$serverfiles-*.zip | Sort-Object CreationTime -desc | Select-Object -Skip $maxbackups | Remove-Item -Force 
        If (!$?) {
             
            Get-warnmessage "limitbackupfailed"

        }
        Set-Location $currentdir
    }
    ElseIf (!$backupdir -and !$maxbackups ) {
         
        Get-warnmessage "limitbackupfailed"
        

    }
}