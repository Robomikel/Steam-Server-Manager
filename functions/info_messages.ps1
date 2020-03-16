#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Infomessage {
Param($infomessage,$package)
    $global:info = "[info]" | Receive-Information
    If ($infomessage) {
        If ($infomessage -eq "discord") {
            $global:message = ' Sending Discord Alert' | Receive-Message
        }
        ElseIf ($infomessage -eq "stop") {
            $global:message = ' Stopping Server Process' | Receive-Message
        }
        ElseIf ($infomessage -eq "stopped") {
            $global:message = ' Server Process Stopped' | Receive-Message
        }       
        ElseIf ($infomessage -eq "notrunning") {
            $global:message = ' Server Not Running' | Receive-Message
        }
        ElseIf ($infomessage -eq "running") {
            $global:message = ' Server Running' | Receive-Message
        }
        ElseIf ($infomessage -eq "Starting") {
            $global:message = ' Starting Server' | Receive-Message
        }
        ElseIf ($infomessage -eq "stopping") {
            $global:message = ' Stopping Server' | Receive-Message
        }
        ElseIf ($infomessage -eq "done") {
            $global:message = 'Server Install is done' | Receive-Message
        }
        ElseIf ($infomessage -eq "backupstart") {
            $global:message = ' Server Backup Started ' | Receive-Message
        }
        ElseIf ($infomessage -eq "backupdone") {
            $global:message = ' Server Backup is Done ' | Receive-Message
        }
        ElseIf ($infomessage -eq "savecheck") {
            $global:message = ' Checking Save location(appData)' | Receive-Message
        }
        ElseIf ($infomessage -eq "appdatabackupstart") {
            $global:message = ' Server App Data Backup Started' | Receive-Message
        }
        ElseIf ($infomessage -eq "appdatabackupdone") {
            $global:message = ' Server App Data Backup is Done' | Receive-Message
        }
        ElseIf ($infomessage -eq "purgebackup") {
            $global:message = ' Purging Backups' | Receive-Message
        }
        ElseIf ($infomessage -eq "purgeappdatabackup") {
            $global:message = ' Purging AppData Backups' | Receive-Message
        }
        ElseIf ($infomessage -eq "finished") {
            $global:message = " Server $command is done ./ssm start $serverfiles " | Receive-Message
        }
        ElseIf ($infomessage -eq "Downloading") {
            $global:message = " Downloading $package" | Receive-Message
        }
        ElseIf ($infomessage -eq "Downloaded") {
            $global:message = " Downloaded $package" | Receive-Message
        }
        ElseIf ($infomessage -eq "Extracting") {
            $global:message = " Extracting $package" | Receive-Message
        }
        ElseIf ($infomessage -eq "Extracted") {
            $global:message = " Extracted $package" | Receive-Message
        }
        ElseIf ($infomessage -eq "copying-installing") {
            $global:message = " copying-installing $package" | Receive-Message
        }
        ElseIf ($infomessage -eq "copied-installed") {
            $global:message = " copied-installed $package" | Receive-Message
        }
        ElseIf ($infomessage -eq "getting") {
            $global:message = ' Getting Server Variables' | Receive-Message
        }
        ElseIf ($infomessage -eq "clearing") {
            $global:message = " Clearing Variables" | Receive-Message
        }
        ElseIf ($infomessage -eq "creating") {
            $global:message = " Creating Variables and adding launch params" | Receive-Message
        }
        ElseIf ($infomessage -eq "downloadtime") {
            $global:message = " Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s) " | Receive-Message
        }
        ElseIf ($infomessage -eq "validating") {
            $global:message = " Validating Server $serverfiles" | Receive-Message
        }
        ElseIf ($infomessage -eq "updating") {
            $global:message = " Updating Server $serverfiles" | Receive-Message
        }
        ElseIf ($infomessage -eq "installing") {
            $global:message = " Installing Server $serverfiles" | Receive-Message
        }
        ElseIf ($infomessage -eq "availableupdates") {
            $global:message = " Avaiable Updates on $serverfiles" | Receive-Message
        }
        ElseIf ($infomessage -eq "noupdates") {
            $global:message = " No Updates found for $serverfiles" | Receive-Message
        }
        Start-Sleep 0.3
        # Write-Information "[info]" -InformationAction Continue
        Write-Information "$message" -InformationAction Continue
        Add-Content $ssmlog "[$loggingdate] Message: $infomessage"
    }
}
Function Get-WarnMessage($warnmessage,$package) {
    
Add-Content $ssmlog "[$loggingdate] Getting Warning "
    If ($warnmessage) {
        
        If ($warnmessage -eq 'missingwebhook') {
            $global:message = ' Missing Discord Webhook'
        }
        ElseIf ($warnmessage -eq 'AlertFailed') {
            $global:message = ' Discord Alert Failed'
        }
        ElseIf ($warnmessage -eq 'createfolderfailed') {
            $global:message = ' Creating backup folder Failed'
        }
        ElseIf ($warnmessage -eq 'backupfnfailed') {
            $global:message = ' Fn_New-BackupFolder Failed'
        }
        ElseIf ($warnmessage -eq 'backupfailed') {
            $global:message = " Server Backup Failed: :  $LASTEXITCODE"
        }
        ElseIf ($warnmessage -eq 'limitbackupfailed') {
            $global:message = " Limit-Backups Failed:  $backupdir $maxbackups"
        }
        ElseIf ($warnmessage -eq 'missingvars') {
            $global:message = ' Missing Variables'
        }
        ElseIf ($warnmessage -eq 'missingVariables') {
            $global:message = " Missing $serverdir\Variables-$serverfiles.ps1"
        }
        ElseIf ($warnmessage -eq 'chkvarsfailed') {
            $global:message = ' Fn_Get-CheckForVars Failed'
        }
        ElseIf ($warnmessage -eq 'fnmcrconfailed') {
            $global:message = ' Fn_Get-MCRconCheck Failed'
        }
        ElseIf ($warnmessage -eq 'stoppedfailed') {
            $global:message = ' Process stopping Failed'
        }
        ElseIf ($warnmessage -eq 'invalidnumbers') {
            $global:message = ' Input Valid AppID  Numbers only'
        }
        ElseIf ($warnmessage -eq 'invalidCharacters') {
            $global:message = ' Input Alpha Characters only'
        }
        ElseIf ($warnmessage -eq 'readappidfailed') {
            $global:message = ' Read-AppID Failed'
        }
        ElseIf ($warnmessage -eq 'fnnodejsfailed') {
            $global:message = ' Fn_Get-NodeJSCheck Failed'
        }
        ElseIf ($warnmessage -eq 'fngetfoldersfailed') {
            $global:message = ' Fn_Get-FolderNames Failed'
        }
        ElseIf ($warnmessage -eq 'fnssevenzipfailed') {
            $global:message = ' Fn_Get-SevenZipCheck Failed'
        }
        ElseIf ($warnmessage -eq 'fngetsteamfailed') {
            $global:message = ' Fn_Get-Steam Failed'
        }
        ElseIf ($warnmessage -eq 'Fn_InstallServerFiles') {
            $global:message = ' Failed: Install-ServerFiles: Try Install command'
        }
        ElseIf ($warnmessage -eq 'Fn_Set-ConnectMCRcon') {
            $global:message = " Set-ConnectMCRcon Failed: $serverdir"
        }
        ElseIf ($warnmessage -eq 'Fn_Get-StopServer') {
            $global:message = " Failed: Get-StopServer null $process"
        }
        ElseIf ($warnmessage -eq 'Fn_Get-StopServerintall') {
            $global:message = " Failed: Get-StopServerIntall null $process"
        }
        ElseIf ($warnmessage -eq 'Downloadfailed') {
            $global:message = " Downloading  $package Failed"
        }
        ElseIf ($warnmessage -eq 'ExtractFailed') {
            $global:message = " Extracting $package Failed"
        }
        ElseIf ($warnmessage -eq 'nolaunchscript') {
            $global:message = ' No Launch Script Found for this server'
        }
        ElseIf ($warnmessage -eq 'discordnotenabled') {
            $global:message = ' Discord alerts not enabled'
        }
        Start-Sleep 0.3
        Write-Warning "$global:message"
        Add-Content $ssmlog "[$loggingdate] Warning: $warnmessage"
        Set-Location $currentdir
        Exit
    }
}

Function Get-adminMessage {
    Write-warning " Running with an Adminstrator account"
}
Function Get-CheckForError {
    If (!$?) {
        Write-Warning " $command Failed"
        Exit
    }
}

Function Get-Finished {
    $global:infomessage = "Finished"
    Get-Infomessage
}

