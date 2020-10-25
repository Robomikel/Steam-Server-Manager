#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-BackupServer {
    Write-log "Function: New-BackupServer"
    If (($sevenzipdirectory) -and ($serverfiles) -and ($backupdir) -and ($Date) -and ("$currentdir\$serverfiles") -and ($logdate)) { 
        If ($stoponbackup -eq "on") { 
            Get-StopServer 
        }
        If ($Showbackupconsole -eq "on") { 
            Get-Infomessage "backupstart" 'start'
            Set-Location $sevenzipdirectory
            Start-Process 7za -ArgumentList ("a $backupdir\Backup_$serverfiles-$Date.zip $currentdir\$serverfiles\* > backup_$logDate.log") -Wait
            If (!$?) {
                Get-warnmessage "backupfailed"
            }
        }
        ElseIf ($Showbackupconsole -eq "off") {
            Get-Infomessage "backupstart" 'start'
            Set-Location $sevenzipdirectory
            #./7za a $currentdir\backups\Backup_$serverfiles-$BackupDate.zip $currentdir\$serverfiles\* -an > backup.log
            Get-Childitem $sevenzipdirectory | Where-Object { $_ -like '*.log' } | Remove-item 
            ./7za a $backupdir\Backup_$serverfiles-$Date.zip     $currentdir\$serverfiles\* > backup_$logDate.log
            If (!$?) {
                Get-warnmessage "backupfailed"
            }
        }
        Get-Infomessage "backupdone" 
        If ($appdatabackup -eq "on") { 
            Get-Savelocation
            Get-Infomessage "savecheck" 
 
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
        Pop-Location -StackName 'SSM'
    }
    ElseIf (!$sevenzipdirectory -or !$serverfiles -or !$backupdir) {
        Get-warnmessage "backupfailed"
        
    }
}
Function New-backupAppdata {
    Write-log "Function: New-backupAppdata"
    If ($Showbackupconsole -eq "on") {
        Get-Infomessage "appdatabackupstart" 'start'
        Set-Location $sevenzipdirectory
        Start-Process 7za -ArgumentList ("a $backupdir\AppDataBackup_$serverfiles-$Date.zip $env:APPDATA\$saves\* > AppDatabackup_$logDate.log") -Wait
        If (!$?) {
            Get-warnmessage "backupfailed"
        }
    }
    ElseIf ($Showbackupconsole -eq "Off") {
        Get-Infomessage "appdatabackupstart" 'start'
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
    Write-log "Function: Limit-Backups"
    If ($backupdir -and $maxbackups ) {
        Get-Infomessage "purgebackup" 'info'
        Set-Location $sevenzipdirectory
        Get-Childitem $backupdir -Recurse | where-object name -like Backup_$serverfiles-*.zip | Sort-Object CreationTime -desc | Select-Object -Skip $maxbackups | Remove-Item -Force 
        If (!$?) {
            Get-warnmessage "limitbackupfailed"
        }
        Else {
            Get-Infomessage "purgebackup" 

        }
        Pop-Location -StackName 'SSM'
    }
    ElseIf (!$backupdir -or !$maxbackups ) {
        Get-warnmessage "limitbackupfailed"
    }
}
Function Limit-AppdataBackups {
    Write-log "Function: Limit-AppdataBackups"
    If ($backupdir -and $maxbackups ) {
        Get-Infomessage "purgeappdatabackup" 'info'
        Set-Location $sevenzipdirectory
        Get-Childitem $backupdir -Recurse | where-object name -like AppDataBackup__$serverfiles-*.zip | Sort-Object CreationTime -desc | Select-Object -Skip $maxbackups | Remove-Item -Force 
        If (!$?) {
            Get-warnmessage "limitbackupfailed"
        }  
        Else {
            Get-Infomessage "purgeappdatabackup" 
        }
        Pop-Location -StackName 'SSM'
    }
    ElseIf (!$backupdir -or !$maxbackups ) {
        Get-warnmessage "limitbackupfailed"
    }
}
Function Get-BackupMenu {
    Show-Menu
    Get-Menu
    # $selection = Read-Host "Please make a selection"
    $restoreex = @'
    (gci $backupdir | Where Name -Like Backup_$serverfiles-*.zip | Sort-Object CreationTime -Descending | select @{ n='Name'; e={$($_.Name) + ' '  + $('{0:F2} GB' -f ($_.Length / 1Gb))}}).Name
'@
    $selection = Menu (iex "$restoreex")
    $global:restore = $selection
    # switch ($selection) {
    #    '1' { $global:restore = $option1 } 
    #    '2' { $global:restore = $option2 } 
   #     '3' { $global:restore = $option3 } 
    #    'q' { exit }
    # }
    New-BackupRestore
}
Function Show-Menu {
    $option = (gci $backupdir | Where Name -Like Backup_$serverfiles-*.zip | Sort-Object CreationTime -Descending ).Name
    If ($option.Count -eq 1 ) {
        $global:option1 = $option
        #Get-Menu
    }
    ElseIf ($option.Count -ne 0 ) {
        $global:option1 = $option[0] 
        $global:option2 = $option[1] 
        $global:option3 = $option[2]
        #Get-Menu
    }
    ElseIf ($option.Count -eq 0 )  {
        Write-Warning "No Backups" -InformationAction Stop
        exit
    }
}
Function Get-Menu {
    Write-Host ".:.:.:.:.:.:.:. SSM Restore Menu .:.:.:.:.:.:.:.
   `t Choose backup: " -F Cyan
   # Write-Host ".:.:.:.:.:.:.:.:  Press: <1-3>  .:.:.:.:.:.:.:."
   # Write-Host "1: $option1"
   # Write-Host "2: $option2"
   # Write-Host "3: $option3"
   # Write-Host "Q: Press 'Q' to quit."
}
Function New-BackupRestore {
    Write-log "Function: New-BackupRestore"
    If (($serverfiles) -and ($backupdir) -and ($Date) -and ("$currentdir\$serverfiles") -and ($logdate)) { 
        If ($stoponbackup -eq "on") { 
            Get-StopServer 
        }
        Get-Infomessage "Restore from Backup" 'start'
        Expand-Archive -Path "$backupdir\$restore" -DestinationPath  "$currentdir\$serverfiles" -Force
        If (!$?) {
            Write-Warning "Restore from Backup failed" -InformationAction Stop
            exit
        }
        Get-Infomessage "Restore from Backup" 
        If ($appdatabackup -eq "on") { 
            Get-Savelocation
            # Get-Infomessage "savecheck" 
        }
        Pop-Location -StackName 'SSM'
    }
    ElseIf ( !$serverfiles -or !$backupdir) {
        Write-Warning "Restore from Backup failed" -InformationAction Stop
        exit
    }
}

Function Get-AppdataBackupMenu {
    Show-AppdataMenu
    $selection = Read-Host "Please make a selection"
    switch ($selection) {
        '1' { $global:restore = $option1 } 
        '2' { $global:restore = $option2 } 
        '3' { $global:restore = $option3 } 
        'q' { exit }
    }
    New-backupAppdatarestore
}
Function New-backupAppdatarestore {
    Write-log "Function: New-backupAppdatarestore"
    Expand-Archive -Path $backupdir\$restore -DestinationPath $env:APPDATA\$saves -Force
    If (!$?) {
        Write-Warning "AppData Restore Failed" -InformationAction Stop
        exit
    }
}
Function Show-AppdataMenu {
    $option = (gci $backupdir | Where Name -Like AppDataBackup_$serverfiles-*.zip | Sort-Object CreationTime -Descending ).Name
    If ($option.Count -eq 1 ) {
        $global:option1 = $option
    }
    ElseIf ($option.Count -eq 0 ) {
        Write-Warning "No AppDataBackups" -InformationAction Stop
        exit
        }
    Else {
        $global:option1 = $option[0] 
        $global:option2 = $option[1] 
        $global:option3 = $option[2]
    }
    Write-Host ":::::::::::: SSM AppData Restore Menu :::::::::"
    Write-Host ".:.:.:.:.:.:.:.:  Press: <1-3>  .:.:.:.:.:.:.:."
    Write-Host "1: $option1"
    Write-Host "2: $option2"
    Write-Host "3: $option3"
    Write-Host "Q: Press 'Q' to quit."
}