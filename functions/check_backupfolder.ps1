#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-BackupFolder {
    Write-log "Function: Function New-BackupFolder"
    If ($backupdir -and $ssmlog -and $loggingDate -and $currentdir) {
        If (Test-Path $backupdir) { 
            Write-log "Backup folder exists! "
        } 
        ElseIf (!(Test-Path $backupdir)) {  
            Write-log "Creating backup folder "
            New-Item  $currentdir -Name "backups" -ItemType "directory" | Out-File -Append -Encoding Default  $ssmlog
            If (!$?) {
                Get-warnmessage "createfolderfailed"
            }
        }
    }
    ElseIf (!$backupdir) {         
        Get-warnmessage "backupfnfailed"
    }
}

Function New-configFolder {
    Write-log "Function: Function New-configFolder"
    If ($configdir -and $ssmlog -and $loggingDate -and $currentdir) {
        If (Test-Path $backupconfigdirdir) { 
            Write-log "config folder exists! "
        } 
        ElseIf (!(Test-Path $configdir)) {  
            Write-log "Creating config folder "
            New-Item  $currentdir -Name "config" -ItemType "directory" | Out-File -Append -Encoding Default  $ssmlog
            If (!$?) {
                Get-warnmessage "createfolderfailed"
            }
        }
    }
    ElseIf (!$configdir) {         
        Get-warnmessage "configfnfailed"
    }
}

Function Add-Config {
    If (Test-Path $currentdir\config\core_settings.ps1) {
        Write-log "Found custom core_settings.ps1"
        Get-ChildItem -Path $currentdir\config -Filter *.ps1 | ForEach-Object { . $_.FullName }
    }
    Else {
        $getlocalssm = $(gc $currentdir\functions\core_settings.ps1 -Force)
        If ($getlocalssm) {
            $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/Steam-Server-Manager/master/functions/core_settings.ps1" -UseBasicParsing
            If ($githubvarcontent) {
                $githubvarcontent = ($githubvarcontent).Content
                If ($githubvarcontent) {
                    If (Test-Path $currentdir\tmp) { } Else {
                        New-Item  . -Name 'tmp' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                    }
                    New-Item  "$currentdir\tmp\core_settings.ps1" -Force >$null 2>&1
                    Add-Content "$currentdir\tmp\core_settings.ps1" $githubvarcontent -InformationAction  SilentlyContinue
                    $githubvarcontenttrim = Get-Content $currentdir\tmp\core_settings.ps1 | Where-Object { $_ -notlike "" }
                    If ($githubvarcontenttrim) {
                        $ssmcontentlocaltrim = Get-Content $currentdir\functions\core_settings.ps1 | Where-Object { $_ -notlike "" }
                        If ($ssmcontentlocaltrim ) {
                            if (!(Compare-Object ($githubvarcontenttrim ) ($ssmcontentlocaltrim ))) {
                                Get-Infomessage 'core_settings' 'Create'
                                New-Item  "$currentdir\config\core_settings.ps1" -Force >$null 2>&1
                                Add-Content "$currentdir\config\core_settings.ps1" $getlocalssm -InformationAction  SilentlyContinue
                                Get-ClientSettings
                            } 
                        }
                    }
                }
            }
        }
    }
}

