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
            $global:infomessage = "backupstart"
            Get-Infomessage
            Set-Location $sevenzipdirectory
            Start-Process 7za -ArgumentList ("a $backupdir\Backup_$serverfiles-$Date.zip $serverdir\* > backup_$logDate.log") -Wait
            If (!$?) {
                $global:warnmessage = "backupfailed"
                Get-warnmessage
    
            }
        }
        ElseIf ($Showbackupconsole -eq "off") {
            $global:infomessage = "backupstart"
            Get-Infomessage
            Set-Location $sevenzipdirectory
            #./7za a $currentdir\backups\Backup_$serverfiles-$BackupDate.zip $currentdir\$serverfiles\* -an > backup.log
            ./7za a $backupdir\Backup_$serverfiles-$Date.zip     $serverdir\* > backup_$logDate.log
            If (!$?) {
                $global:warnmessage = "backupfailed"
                Get-warnmessage
    
            }
        }
        $global:infomessage = "backupdone"
        Get-Infomessage
        $global:infomessage = "savecheck"
        Get-Infomessage
        If ($appdatabackup -eq "on") { 
            Get-Savelocation 
        }
        New-ServerBackupLog
        If ($backuplogopen -eq "on") {
            Set-Location $sevenzipdirectory 
            .\backup_*.log >$null 2>&1
            If (!$?) {
                $global:warnmessage = "backupfailed"
                Get-warnmessage
    
            } 
        }
        Limit-Backups
        $global:alert = "Backup"
        New-DiscordAlert
        Set-Location $currentdir
    }
    ElseIf (!$sevenzipdirectory -or !$serverfiles -or !$backupdir) {
        $global:warnmessage = "backupfailed"
        Get-warnmessage
        
    }
}
Function New-backupAppdata {
    If ($Showbackupconsole -eq "on") {
        $global:infomessage = "appdatabackupstart"
        Get-Infomessage
        Set-Location $sevenzipdirectory
        Start-Process 7za -ArgumentList ("a $backupdir\AppDataBackup_$serverfiles-$Date.zip $env:APPDATA\$saves\* > AppDatabackup_$logDate.log") -Wait
        If (!$?) {
            $global:warnmessage = "backupfailed"
            Get-warnmessage

        }
    }
    ElseIf ($Showbackupconsole -eq "Off") {
        $global:infomessage = "appdatabackupstart"
        Get-Infomessage
        Set-Location $sevenzipdirectory
        ./7za a $backupdir\AppDataBackup_$serverfiles-$Date.zip $env:APPDATA\$saves\* > AppDatabackup_$logDate.log
        If (!$?) {
            $global:warnmessage = "backupfailed"
            Get-warnmessage

        }
    }   
    $global:infomessage = "appdatabackupdone"
    Get-Infomessage
    If ($appdatabackuplogopen -eq "on") {
        Set-Location $sevenzipdirectory 
        .\AppDatabackup_*.log >$null 2>&1
        If (!$?) {
            $global:warnmessage = "backupfailed"
            Get-warnmessage

        }  
    }
    Limit-AppdataBackups
}

Function Limit-Backups {
    If ($backupdir -and $maxbackups ) {
        $global:infomessage = "purgebackup"
        Get-Infomessage
        Set-Location $sevenzipdirectory
        Get-Childitem $backupdir -Recurse | where-object name -like Backup_$serverfiles-*.zip | Sort-Object CreationTime -desc | Select-Object -Skip $maxbackups | Remove-Item -Force 
        If (!$?) {
            $global:warnmessage = "limitbackupfailed"
            Get-warnmessage

        }
        Set-Location $currentdir
    }
    ElseIf (!$backupdir -and !$maxbackups ) {
        $global:warnmessage = "limitbackupfailed"
        Get-warnmessage
        

    }
}

Function Limit-AppdataBackups {
    If ($backupdir -and $maxbackups ) {
        $global:infomessage = "purgeappdatabackup"
        Get-Infomessage
        Set-Location $sevenzipdirectory
        Get-Childitem $backupdir -Recurse | where-object name -like AppDataBackup__$serverfiles-*.zip | Sort-Object CreationTime -desc | Select-Object -Skip $maxbackups | Remove-Item -Force 
        If (!$?) {
            $global:warnmessage = "limitbackupfailed"
            Get-warnmessage

        }
        Set-Location $currentdir
    }
    ElseIf (!$backupdir -and !$maxbackups ) {
        $global:warnmessage = "limitbackupfailed"
        Get-warnmessage
        

    }
}