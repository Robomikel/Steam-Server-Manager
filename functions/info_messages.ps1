#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Infomessage {
    Param($infomessage, $package,$colors)
    If ($infomessage) {
        If ($infomessage -eq "discord") {
            $message = ' Sending Discord Alert' | Receive-Message
        }
        ElseIf ($infomessage -eq "stop") {
            $message = ' Stopping Server Process' | Receive-Message
        }
        ElseIf ($infomessage -eq "stopped") {
            $message = ' Server Process Stopped' | Receive-Message
        }       
        ElseIf ($infomessage -eq "notrunning") {
            $message = ' Server Not Running' | Receive-Message
        }
        ElseIf ($infomessage -eq "running") {
            $message = ' Server Running' | Receive-Message
        }
        ElseIf ($infomessage -eq "Starting") {
            $message = ' Starting Server' | Receive-Message
        }
        ElseIf ($infomessage -eq "stopping") {
            $message = ' Stopping Server' | Receive-Message
        }
        ElseIf ($infomessage -eq "done") {
            $message = 'Server Install is done' | Receive-Message
        }
        ElseIf ($infomessage -eq "backupstart") {
            $message = ' Server Backup Started ' | Receive-Message
        }
        ElseIf ($infomessage -eq "backupdone") {
            $message = ' Server Backup is Done ' | Receive-Message
        }
        ElseIf ($infomessage -eq "savecheck") {
            $message = ' Checking Save location(appData)' | Receive-Message
        }
        ElseIf ($infomessage -eq "appdatabackupstart") {
            $message = ' Server AppData Backup Started' | Receive-Message
        }
        ElseIf ($infomessage -eq "appdatabackupdone") {
            $message = ' Server AppData Backup is Done' | Receive-Message
        }
        ElseIf ($infomessage -eq "purgebackup") {
            $message = ' Purging Backups' | Receive-Message
        }
        ElseIf ($infomessage -eq "purgeappdatabackup") {
            $message = ' Purging AppData Backups' | Receive-Message
        }
        ElseIf ($infomessage -eq "finished") {
            $message = " Server $command is done ./ssm start $serverfiles " | Receive-Message
        }
        ElseIf ($infomessage -eq "Downloading") {
            $message = " Downloading $package" | Receive-Message
        }
        ElseIf ($infomessage -eq "Downloaded") {
            $message = " Downloaded $package" | Receive-Message
        }
        ElseIf ($infomessage -eq "Extracting") {
            $message = " Extracting $package" | Receive-Message
        }
        ElseIf ($infomessage -eq "Extracted") {
            $message = " Extracted $package" | Receive-Message
        }
        ElseIf ($infomessage -eq "copying-installing") {
            $message = " copying-installing $package" | Receive-Message
        }
        ElseIf ($infomessage -eq "copied-installed") {
            $message = " copied-installed $package" | Receive-Message
        }
        ElseIf ($infomessage -eq "getting") {
            $message = ' Getting Server Variables' | Receive-Message
        }
        ElseIf ($infomessage -eq "clearing") {
            $message = " Clearing Variables" | Receive-Message
        }
        ElseIf ($infomessage -eq "creating") {
            $message = " Creating Variables and adding launch params" | Receive-Message
        }
        ElseIf ($infomessage -eq "downloadtime") {
            $message = " Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s) " | Receive-Message
        }
        ElseIf ($infomessage -eq "validating") {
            $message = " Validating Server $serverfiles" | Receive-Message
        }
        ElseIf ($infomessage -eq "updating") {
            $message = " Updating Server $serverfiles" | Receive-Message
        }
        ElseIf ($infomessage -eq "installing") {
            $message = " Installing Server $serverfiles" | Receive-Message
        }
        ElseIf ($infomessage -eq "availableupdates") {
            $message = " Avaiable Updates on $serverfiles" | Receive-Message
        }
        ElseIf ($infomessage -eq "noupdates") {
            $message = " No Updates found for $serverfiles" | Receive-Message
        }
        ElseIf ($infomessage -eq "ssmupdates") {
            $infomessage = @(" SSM Updates found for"," $getlocalssmname")
            $message = " SSM Updates found for $getlocalssmname" | Receive-Message
        }
        ElseIf ($infomessage -eq "nossmupdates") {
            $infomessage = @(" No SSM Updates found for"," $getlocalssmname")
            $message = " No SSM Updates found for $getlocalssmname" | Receive-Message
        }
        Else {
            $message = "$infomessage" | Receive-Message
        }
        $leftbracket = "...   [ " | Receive-bracket
        If ($package -eq $false) {
            $info = "FAILED" | Receive-Information
        }
        ElseIf ($package -eq 'warning') {
            $info = "WARN" | Receive-Information
        }
        Elseif ($package -eq 'update') {
            $info = "UPDATE" | Receive-Information
        }
        Elseif ($package -eq 'info') {
            $info = "INFO" | Receive-Information
        }
        Elseif ($package -eq 'start') {
            $info = "START" | Receive-Information
        }
        Elseif ($package -eq 'done') {
            $info = "DONE" | Receive-Information
        }
        Else {
            $info = "ok" | Receive-Information
        }
        $rightbracket = " ]" | Receive-bracket
        Start-Sleep 0.3
        # Write-Information "[info]" -InformationAction Continue
        Write-Information "$message" -InformationAction Continue
        Add-Content $ssmlog "[$loggingdate] Message: $infomessage"
    }
}
Function Get-WarnMessage {
    param ($warnmessage, $package)   
    Write-log "Function:  Get-WarnMessage"
    If ($warnmessage) {
        
        If ($warnmessage -eq 'missingwebhook') {
            $message = ' Missing Discord Webhook'
        }
        ElseIf ($warnmessage -eq 'AlertFailed') {
            $message = ' Discord Alert Failed'
        }
        ElseIf ($warnmessage -eq 'createfolderfailed') {
            $message = ' Creating backup folder Failed'
        }
        ElseIf ($warnmessage -eq 'backupfnfailed') {
            $message = ' Fn_New-BackupFolder Failed'
        }
        ElseIf ($warnmessage -eq 'backupfailed') {
            $message = " Server Backup Failed: :  $LASTEXITCODE"
        }
        ElseIf ($warnmessage -eq 'limitbackupfailed') {
            $message = " Limit-Backups Failed:  $backupdir $maxbackups"
        }
        ElseIf ($warnmessage -eq 'missingvars') {
            $message = ' Missing Variables'
        }
        ElseIf ($warnmessage -eq 'missingVariables') {
            $message = " Missing $serverdir\Variables-$serverfiles.ps1"
        }
        ElseIf ($warnmessage -eq 'chkvarsfailed') {
            $message = ' Fn_Get-CheckForVars Failed'
        }
        ElseIf ($warnmessage -eq 'fnmcrconfailed') {
            $message = ' Fn_Get-MCRconCheck Failed'
        }
        ElseIf ($warnmessage -eq 'stoppedfailed') {
            $message = ' Process stopping Failed'
        }
        ElseIf ($warnmessage -eq 'invalidnumbers') {
            $message = ' Input Valid AppID  Numbers only'
        }
        ElseIf ($warnmessage -eq 'invalidCharacters') {
            $message = ' Input Alpha Characters only'
        }
        ElseIf ($warnmessage -eq 'readappidfailed') {
            $message = ' Read-AppID Failed'
        }
        ElseIf ($warnmessage -eq 'fnnodejsfailed') {
            $message = ' Fn_Get-NodeJSCheck Failed'
        }
        ElseIf ($warnmessage -eq 'fngetfoldersfailed') {
            $message = ' Fn_Get-FolderNames Failed'
        }
        ElseIf ($warnmessage -eq 'fnssevenzipfailed') {
            $message = ' Fn_Get-SevenZipCheck Failed'
        }
        ElseIf ($warnmessage -eq 'fngetsteamfailed') {
            $message = ' Fn_Get-Steam Failed'
        }
        ElseIf ($warnmessage -eq 'Fn_InstallServerFiles') {
            $message = ' Failed: Install-ServerFiles: Try Install command'
        }
        ElseIf ($warnmessage -eq 'Fn_Set-ConnectMCRcon') {
            $message = " Set-ConnectMCRcon Failed: $serverdir"
        }
        ElseIf ($warnmessage -eq 'Fn_Get-StopServer') {
            $message = " Failed: Get-StopServer null $process"
        }
        ElseIf ($warnmessage -eq 'Fn_Get-StopServerintall') {
            $message = " Failed: Get-StopServerIntall null $process"
        }
        ElseIf ($warnmessage -eq 'Downloadfailed') {
            $message = " Downloading  $package Failed"
        }
        ElseIf ($warnmessage -eq 'ExtractFailed') {
            $message = " Extracting $package Failed"
        }
        ElseIf ($warnmessage -eq 'nolaunchscript') {
            $message = ' No Launch Script Found for this server'
        }
        ElseIf ($warnmessage -eq 'discordnotenabled') {
            $message = ' Discord alerts not enabled'
        }
        Start-Sleep 0.3
        Write-Warning "$message"
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
    
    Get-Infomessage "Finished"
}
Function Write-log {
    param ($logmessage)
    If ($ssmlog) {
        If ($loggingdate) {
            If ($logmessage) {
                Add-Content $ssmlog "[$loggingdate] $logmessage " 2>$null
            }
        }
    }
}