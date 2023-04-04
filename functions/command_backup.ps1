#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-BackupServer {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If (($sevenzipdirectory) -and ($serverfiles) -and ($backupdir) -and ($Date) -and ("$serverdir") -and ($logdate)) { 
        If ($stoponbackup -eq "on") { 
            Get-StopServer 
        }
        if ($(Test-Path $sevenzipprogramexecutable)) {
            Write-Log "info: & $sevenzipprogramexecutable a -bsp2 -bb $backupdir\Backup_$serverfiles-$Date.zip $serverdir\* > $logdir\backup_$serverfiles-$Date.log"
            & $sevenzipprogramexecutable a -bsp2 -bb $backupdir\Backup_$serverfiles-$Date.zip $serverdir\* > $logdir\backup_$serverfiles-$Date.log
        }
        ELse {
            push-location
            Set-Location $sevenzipdirectory
            If ($Showbackupconsole -eq "on") { 
                $backuplogopen = 'off'
                Write-log "info: open backup log. show backup console on"
                clear-hostline 1
                Get-Infomessage "backupstart" 'start'
                write-log "info: Start-Process $sevenzipexecutable -ArgumentList (`"a $backupdir\Backup_$serverfiles-$Date.zip $serverdir\*`") -Wait"
                Start-Process $sevenzipexecutable -ArgumentList ("a $backupdir\Backup_$serverfiles-$Date.zip $serverdir\*") -Wait
                If (!$?) {
                    Get-warnmessage "backupfailed"
                }
            }
            ElseIf ($Showbackupconsole -eq "off") {
                clear-hostline 1
                Get-Infomessage "backupstart" 'start'
                #./7za a $currentdir\backups\Backup_$serverfiles-$BackupDate.zip $serverdir\* -an > backup.log
                Get-Childitem -Depth 1 $sevenzipdirectory | Where-Object { $_ -like '*.log' } | Remove-item 
                write-log "info: ./7za a $backupdir\Backup_$serverfiles-$Date.zip $serverdir\* > backup_$serverfiles-$Date.log"
                ./7za a $backupdir\Backup_$serverfiles-$Date.zip $serverdir\* > $logdir\backup_$serverfiles-$Date.log
                If (!$?) {
                    Get-warnmessage "backupfailed"
                }
            }
            pop-location
        }
        clear-hostline 1
        Get-Infomessage "backupdone" 
       New-ServerBackupLog
        If ($backuplogopen -eq "on") {
            Push-Location
            set-location $logdir
            if ($(Test-Path $sevenzipprogramexecutable)) {
                $lastlog = (gci | sort LastWriteTime -Descending | select -First 1).Name
                Invoke-Item $lastlog
                If (!$?) {
                    Write-Warning "Failed: Backup Log open"
                } 
            }
            ELse {
                $lastlog = (gci | sort LastWriteTime -Descending | select -First 1).Name
                Invoke-Item $lastlog
                If (!$?) {
                    Write-Warning "Failed: Backup Log open"
                } 
            }
            Pop-Location
        }
        If ($appdatabackup -eq "on") { 
            Get-Savelocation
            clear-hostline 1
            Get-Infomessage "savecheck" 
        }
        Limit-Backups
        New-DiscordAlert "Backup"
    }
    ElseIf (!$sevenzipdirectory -or !$serverfiles -or !$backupdir) {
        Get-warnmessage "backupfailed"
    }
}
Function New-backupAppdata {
    Write-log "Function: $($MyInvocation.Mycommand)"
    if ($(Test-Path $sevenzipprogramexecutable)) {
        Write-Log "info: & $sevenzipprogramexecutable a -bsp2 $backupdir\AppDataBackup_$serverfiles-$Date.zip $savedata\$saves\* > $logdir\AppDatabackup_$serverfiles-$date.log"
        & $sevenzipprogramexecutable a -bsp2 $backupdir\AppDataBackup_$serverfiles-$Date.zip $savedata\$saves\* > $logdir\AppDatabackup_$serverfiles-$date.log
    }
    Else {   
        Push-location
        Set-Location $sevenzipdirectory
        If ($Showbackupconsole -eq "on") {
            $appdatabackuplogopen = 'off'
            Write-log "info: open appdata backup log. show backup console on"
            clear-hostline 1
            Get-Infomessage "appdatabackupstart" 'start'
            Write-Log "info: Start-Process $sevenzipexecutable -ArgumentList (`"a $backupdir\AppDataBackup_$serverfiles-$Date.zip $savedata\$saves\*`") -Wait"
            Start-Process $sevenzipexecutable -ArgumentList ("a $backupdir\AppDataBackup_$serverfiles-$Date.zip $savedata\$saves\*") -Wait
            If (!$?) {
                Get-warnmessage "backupfailed"
            }
        }
        ElseIf ($Showbackupconsole -eq "Off") {
            clear-hostline 1
            Get-Infomessage "appdatabackupstart" 'start'
            Write-Log "info: ./7za a $backupdir\AppDataBackup_$serverfiles-$Date.zip $savedata\$saves\* > $logdir\AppDatabackup_$serverfiles-$date.log"
            ./7za a $backupdir\AppDataBackup_$serverfiles-$Date.zip $savedata\$saves\* > $logdir\AppDatabackup_$serverfiles-$date.log
            If (!$?) {
                Get-warnmessage "backupfailed"
            }
        }  
        Pop-location 
    }
    clear-hostline 1
    Get-Infomessage "appdatabackupdone" 
    New-ServerAppDataBackupLog
    if ($(Test-Path $sevenzipprogramexecutable)) {
        $lastlog = (gci $logdir | sort LastWriteTime | select -First 1).Name
        Invoke-Item $lastlog
        If (!$?) {
            Write-Warning "Failed: AppData Backup Log open"
        }  
    }
    Else {  
        If ($appdatabackuplogopen -eq "on") {
            $lastlog = (gci $logdir | sort LastWriteTime | select -First 1).Name
            Invoke-Item $lastlog
            If (!$?) {
                Write-Warning "Failed: AppData Backup Log open"
            }  
        }
    }
    Limit-AppdataBackups
}
Function Limit-Backups {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($backupdir -and $maxbackups ) {
        clear-hostline 1
        Get-Infomessage "purgebackup" 'info'
        Push-Location
        Set-Location $sevenzipdirectory
        Get-Childitem -Depth 1 $backupdir -Recurse | where-object name -like Backup_$serverfiles-*.zip | Sort-Object CreationTime -desc | Select-Object -Skip $maxbackups | Remove-Item -Force 
        If (!$?) {
            Get-warnmessage "limitbackupfailed"
        }
        Else {
            clear-hostline 1
            Get-Infomessage "purgebackup" 
        }
        Pop-Location
    }
    ElseIf (!$backupdir -or !$maxbackups ) {
        Get-warnmessage "limitbackupfailed"
    }
}
Function Limit-AppdataBackups {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($backupdir -and $maxbackups ) {
        clear-hostline 1
        Get-Infomessage "purgeappdatabackup" 'info'
        push-location
        Set-Location $sevenzipdirectory
        Get-Childitem -Depth 1 $backupdir -Recurse | where-object name -like AppDataBackup__$serverfiles-*.zip | Sort-Object CreationTime -desc | Select-Object -Skip $maxbackups | Remove-Item -Force 
        If (!$?) {
            Get-warnmessage "limitbackupfailed"
        }  
        Else {
            clear-hostline 1
            Get-Infomessage "purgeappdatabackup" 
        }
        pop-location
    }
    ElseIf (!$backupdir -or !$maxbackups ) {
        Get-warnmessage "limitbackupfailed"
    }
}
Function Get-BackupMenu {
    Write-log "Function: $($MyInvocation.Mycommand)"
    Show-Menu
    Get-Menu
    # $selection = Read-Host "Please make a selection"
    $restoreex = @'
    (gci $backupdir | Where Name -Like Backup_$serverfiles-*.zip | Sort-Object CreationTime -Descending | select @{ n='Name'; e={$($_.Name) + ' '  + $('{0:F2} GB' -f ($_.Length / 1Gb))}}).Name
'@
    $selection = Menu (iex "$restoreex")
    $global:restore = ($selection).Split()[0]
    # switch ($selection) {
    #    '1' { $global:restore = $option1 } 
    #    '2' { $global:restore = $option2 } 
    #     '3' { $global:restore = $option3 } 
    #    'q' { exit }
    # }
    New-BackupRestore
}
Function Show-Menu {
    Write-log "Function: $($MyInvocation.Mycommand)"
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
    ElseIf ($option.Count -eq 0 ) {
        Write-Warning "No Backups" -InformationAction Stop
        exit
    }
}
Function Get-Menu {
    Write-log "Function: $($MyInvocation.Mycommand)"
    Write-Host ".:.:.:.:.:.:.:. SSM Restore Menu .:.:.:.:.:.:.:.
   `t Choose backup: " -F Cyan
    # Write-Host ".:.:.:.:.:.:.:.:  Press: <1-3>  .:.:.:.:.:.:.:."
    # Write-Host "1: $option1"
    # Write-Host "2: $option2"
    # Write-Host "3: $option3"
    # Write-Host "Q: Press 'Q' to quit."
}
Function New-BackupRestore {
    Write-log "Function: $($MyInvocation.Mycommand)"
    Set-Console
    If (($serverfiles) -and ($backupdir) -and ($Date) -and ("$serverdir") -and ($logdate)) { 
        If ($stoponbackup -eq "on") { 
            Get-StopServer 
        }
        Write-Warning "Deleting Current $serverfiles files"
        gci $serverdir -Exclude "Variables-*.ps1" | Remove-Item -Recurse
        clear-hostline 1
        Get-Infomessage "Restore from Backup" 'start'
        Expand-Archive -Path "$backupdir\$restore" -DestinationPath  "$serverdir" -Force
        If (!$?) {
            Write-Warning "Restore from Backup failed" -InformationAction Stop
            exit
        }
        clear-hostline 1
        Get-Infomessage "Restored from Backup" 
        If ($appdatabackup -eq "on") { 
            Get-Savelocation
            # Get-Infomessage "savecheck" 
        }
        #Pop-Location
    }
    ElseIf ( !$serverfiles -or !$backupdir) {
        Write-Warning "Restore from Backup failed" -InformationAction Stop
        exit
    }
}

Function Get-AppdataBackupMenu {
    Write-log "Function: $($MyInvocation.Mycommand)"
    Show-AppdataMenu
    Get-Menu
    $restoreex = @'
    (gci $backupdir | Where Name -Like AppDataBackup_$serverfiles-*.zip | Sort-Object CreationTime -Descending | select @{ n='Name'; e={$($_.Name) + ' '  + $('{0:F2} MB' -f ($_.Length / 1MB))}}).Name
'@
    $selection = Menu (iex "$restoreex")
    $global:restore = ($selection).Split()[0]
    #    $selection = Read-Host "Please make a selection"
    ##    switch ($selection) {
    #       '1' { $global:restore = $option1 } 
    #       '2' { $global:restore = $option2 } 
    #       '3' { $global:restore = $option3 } 
    #       'q' { exit }
    #   }
    New-backupAppdatarestore
}
Function New-backupAppdatarestore {
    Set-Console
    Write-Warning "Deleting Current $saves files"
    gci $savedata\$saves -Exclude "Variables-*.ps1" | Remove-Item -Recurse
    Write-log "Function: $($MyInvocation.Mycommand)"
    Expand-Archive -Path $backupdir\$restore -DestinationPath $savedata\$saves -Force
    If (!$?) {
        Write-Warning "AppData Restore Failed" -InformationAction Stop
        exit
    }
}
Function Show-AppdataMenu {
    Write-log "Function: $($MyInvocation.Mycommand)"
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
    #   Write-Host ":::::::::::: SSM AppData Restore Menu :::::::::"
    #  Write-Host ".:.:.:.:.:.:.:.:  Press: <1-3>  .:.:.:.:.:.:.:."
    #  Write-Host "1: $option1"
    #  Write-Host "2: $option2"
    #  Write-Host "3: $option3"
    #  Write-Host "Q: Press 'Q' to quit."
}
