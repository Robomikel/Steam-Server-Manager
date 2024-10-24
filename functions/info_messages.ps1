#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Infomessage {
    Param($infomessage, $package, $colors)
    Write-log "Function: $($MyInvocation.Mycommand)"
    switch ($infomessage) { 
        'discord' { $message = ' Sending Discord Alert' }
        'stop' { $message = ' Stopping Server Process' }
        'stopped' { $message = ' Server Process Stopped' }
        'notrunning' { $message = ' Server Not Running' }
        'running' { $message = ' Server Running' }
        'Starting' { $message = ' Starting Server' }
        'stopping' { $message = ' Stopping Server' }
        'done' { $message = 'Server Install is done' }
        'backupstart' { $message = ' Server Backup Started ' }
        'backupdone' { $message = ' Server Backup is Done ' }
        'savecheck' { $message = ' Checking Save location(appData)' }
        'appdatabackupstart' { $message = ' Server AppData Backup Started' }
        'appdatabackupdone' { $message = ' Server AppData Backup is Done' }
        'purgebackup' { $message = ' Purging Backups' }
        'purgeappdatabackup' { $message = ' Purging AppData Backups' }
        'finished' { $infomessage = @( " Server $command is done", " ./ssm start $serverfiles " ); $message = " Server $command is done ./ssm start $serverfiles " }
        'Downloading' { $infomessage = @( " Downloading", " $package" ); $message = " Downloading $package" }
        'Downloaded' { $infomessage = @( " Downloaded", " $package" ); $message = " Downloaded $package" }
        'Extracting' { $infomessage = @( " Extracting", " $package" ); $message = " Extracting $package" }
        'Extracted' { $infomessage = @( " Extracted", " $package" ); $message = " Extracted $package" }
        'copying-installing' { $infomessage = @( " copying-installing", " $package" ); $message = " Copying-Installing $package" }
        'copied-installed' { $infomessage = @( " copied-installed", " $package" ); $message = " Copied-Installed $package" }
        'getting' { $message = ' Getting Server Variables' }
        'clearing' { $message = " Clearing Variables" }
        'creating' { $message = " Creating Variables and Adding Launch Params" }
        'downloadtime' { $infomessage = @( " Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s) "); $message = " Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s) " }
        'validating' { $infomessage = @(" Validating Server ", "$serverfiles"); $message = " Validating Server $serverfiles" }
        'updating' { $infomessage = @(" Updating Server ", "$serverfiles"); $message = " Updating Server $serverfiles" }
        'installing' { $infomessage = @(" Installing Server", " $serverfiles"); $message = " Installing Server $serverfiles" }
        'availableupdates' { $infomessage = @(" Avaiable Updates on ", "$serverfiles"); $message = " Avaiable Updates on $serverfiles" }
        'noupdates' { $infomessage = @(" No Updates found for", " $serverfiles"); $message = " No Updates Found for $serverfiles" }
        'ssmupdates' { $infomessage = @(" SSM Updates found for", " $getlocalssmname"); $message = " SSM Updates Found for $getlocalssmname" }
        'nossmupdates' { $infomessage = @(" No SSM Updates found for", " $getlocalssmname"); $message = " No SSM Updates Found for $getlocalssmname" }
        Default { $message = "$infomessage" }
    }
    switch ($package) {
        $false { $info = "FAILED" }
        'warning' { $info = "WARN" }
        'update' { $info = "UPDATE" }
        'info' { $info = "INFO" }
        'start' { $info = "START" }
        'done' { $info = "DONE" }
        default { $info = "OK" }
    }
    # $leftbracket = "...   [ " 
    # $rightbracket = " ]" 
    Send-Mess $message $info
    Start-Sleep -Seconds 1 
    # Write-Information "[info]" -InformationAction Continue
    # Write-Information "$message" -InformationAction Continue
    #Add-Content $ssmlog "[$loggingdate] Message: $infomessage"
    Write-log "Message: $infomessage $info"
}
Function clear-hostline {
    Param (
        [Parameter(Position = 1)]
        [int32]$Count = 1)
    $CurrentLine = $Host.UI.RawUI.CursorPosition.Y
    $ConsoleWidth = $Host.UI.RawUI.BufferSize.Width
    $i = 1
    for ($i; $i -le $Count; $i++) {
        [Console]::SetCursorPosition(0, ($CurrentLine - $i))
        [Console]::Write("{0,-$ConsoleWidth}" -f " ")
    }
    [Console]::SetCursorPosition(0, ($CurrentLine - $Count))
}
Function Send-Mess {
    param($message,$info)
    $string = $message + '...   [ ' + $info + ' ]'
    # write-host "`r  $string" | trace-word -words 'update' 
    $string | Select-ColorString " UPDATE | OK | FAILED | WARN | START | DONE | INFO " -MultiColorsForSimplePattern -CaseSensitive
}

function Select-ColorString {
    <#
   .SYNOPSIS

   Find the matches in a given content by the pattern and write the matches in color like grep.

   .NOTES

   inspired by: https://ridicurious.com/2018/03/14/highlight-words-in-powershell-console/

   .EXAMPLE

   > 'aa bb cc', 'A line' | Select-ColorString a

   Both line 'aa bb cc' and line 'A line' are displayed as both contain "a" case insensitive.

   .EXAMPLE

   > 'aa bb cc', 'A line' | Select-ColorString a -NotMatch

   Nothing will be displayed as both lines have "a".

   .EXAMPLE

   > 'aa bb cc', 'A line' | Select-ColorString a -CaseSensitive

   Only line 'aa bb cc' is displayed with color on all occurrences of "a" case sensitive.

   .EXAMPLE

   > 'aa bb cc', 'A line' | Select-ColorString '(a)|(\sb)' -CaseSensitive -BackgroundColor White

   Only line 'aa bb cc' is displayed with background color White on all occurrences of regex '(a)|(\sb)' case sensitive.

   .EXAMPLE

   > 'aa bb cc', 'A line' | Select-ColorString b -KeepNotMatch

   Both line 'aa bb cc' and 'A line' are displayed with color on all occurrences of "b" case insensitive,
   and for lines without the keyword "b", they will be only displayed but without color.

   .EXAMPLE

   > Get-Content app.log -Wait -Tail 100 | Select-ColorString "error|warning|critical" -MultiColorsForSimplePattern -KeepNotMatch

   Search the 3 key words "error", "warning", and "critical" in the last 100 lines of the active file app.log and display the 3 key words in 3 colors.
   For lines without the keys words, hey will be only displayed but without color.

   .EXAMPLE

   > Get-Content "C:\Windows\Logs\DISM\dism.log" -Tail 100 -Wait | Select-ColorString win

   Find and color the keyword "win" in the last ongoing 100 lines of dism.log.

   .EXAMPLE

   > Get-WinEvent -FilterHashtable @{logname='System'; StartTime = (Get-Date).AddDays(-1)} | Select-Object time*,level*,message | Select-ColorString win

   Find and color the keyword "win" in the System event log from the last 24 hours.
   #>

    [Cmdletbinding(DefaultParametersetName = 'Match')]
    param(
        [Parameter(
            Position = 0)]
        [ValidateNotNullOrEmpty()]
        [String]$Pattern = $(throw "$($MyInvocation.MyCommand.Name) : " `
                + "Cannot bind null or empty value to the parameter `"Pattern`""),

        [Parameter(
            ValueFromPipeline = $true,
            HelpMessage = "String or list of string to be checked against the pattern")]
        [String[]]$Content,

        [Parameter()]
        [ValidateSet(
            'Black',
            'DarkBlue',
            'DarkGreen',
            'DarkCyan',
            'DarkRed',
            'DarkMagenta',
            'DarkYellow',
            'Gray',
            'DarkGray',
            'Blue',
            'Green',
            'Cyan',
            'Red',
            'Magenta',
            'Yellow',
            'White')]
        [String]$ForegroundColor = 'Black',

        [Parameter()]
        [ValidateSet(
            'Black',
            'DarkBlue',
            'DarkGreen',
            'DarkCyan',
            'DarkRed',
            'DarkMagenta',
            'DarkYellow',
            'Gray',
            'DarkGray',
            'Blue',
            'Green',
            'Cyan',
            'Red',
            'Magenta',
            'Yellow',
            'White')]
        [ValidateScript( {
                if ($Host.ui.RawUI.BackgroundColor -eq $_) {
                    throw "Current host background color is also set to `"$_`", " `
                        + "please choose another color for a better readability"
                }
                else {
                    return $true
                }
            })]
        [String]$BackgroundColor = 'White',

        [Parameter()]
        [Switch]$CaseSensitive,

        [Parameter(
            HelpMessage = "Available only if the pattern is simple non-regex string " `
                + "separated by '|', use this switch with fast CPU.")]
        [Switch]$MultiColorsForSimplePattern,

        [Parameter(
            ParameterSetName = 'NotMatch',
            HelpMessage = "If true, write only not matching lines; " `
                + "if false, write only matching lines")]
        [Switch]$NotMatch,

        [Parameter(
            ParameterSetName = 'Match',
            HelpMessage = "If true, write all the lines; " `
                + "if false, write only matching lines")]
        [Switch]$KeepNotMatch
    )

    begin {
        $paramSelectString = @{
            Pattern       = $Pattern
            AllMatches    = $true
            CaseSensitive = $CaseSensitive
        }
        $writeNotMatch = $KeepNotMatch -or $NotMatch

        [System.Collections.ArrayList]$colorList = [System.Enum]::GetValues([System.ConsoleColor])
        $currentBackgroundColor = $Host.ui.RawUI.BackgroundColor
        $colorList.Remove($currentBackgroundColor.ToString())
        $colorList.Remove($ForegroundColor)
        $colorList.Reverse()
        $colorCount = $colorList.Count

        if ($MultiColorsForSimplePattern) {
            # Get all the console foreground and background colors mapping display effet:
            # https://gist.github.com/timabell/cc9ca76964b59b2a54e91bda3665499e
            $patternToColorMapping = [Ordered]@{}
            # Available only if the pattern is a simple non-regex string separated by '|', use this with fast CPU.
            # We dont support regex as -Pattern for this switch as it will need much more CPU.
            # This switch is useful when you need to search some words,
            # for example searching "error|warn|crtical" these 3 words in a log file.
            $expectedMatches = $Pattern.split("|")
            $expectedMatchesCount = $expectedMatches.Count
            if ($expectedMatchesCount -ge $colorCount) {
                Write-Host "The switch -MultiColorsForSimplePattern is True, " `
                    + "but there're more patterns than the available colors number " `
                    + "which is $colorCount, so rotation color list will be used." `
                    -ForegroundColor Yellow
            }
            0..($expectedMatchesCount - 1) | ForEach-Object {
                $patternToColorMapping.($expectedMatches[$_]) = $colorList[$_ % $colorCount]
            }

        }
    }

    process {
        foreach ($line in $Content) {
            $matchList = $line | Select-String @paramSelectString

            if (0 -lt $matchList.Count) {
                if (-not $NotMatch) {
                    $index = 0
                    foreach ($myMatch in $matchList.Matches) {
                        $length = $myMatch.Index - $index
                        Write-Host $line.Substring($index, $length) -NoNewline

                        $expectedBackgroupColor = $BackgroundColor
                        if ($MultiColorsForSimplePattern) {
                            $expectedBackgroupColor = $patternToColorMapping[$myMatch.Value]
                        }

                        $paramWriteHost = @{
                            Object          = $line.Substring($myMatch.Index, $myMatch.Length)
                            NoNewline       = $true
                            ForegroundColor = $ForegroundColor
                            BackgroundColor = $expectedBackgroupColor
                        }
                        Write-Host @paramWriteHost

                        $index = $myMatch.Index + $myMatch.Length
                    }
                    Write-Host $line.Substring($index)
                }
            }
            else {
                if ($writeNotMatch) {
                    Write-Host "$line"
                }
            }
        }
    }

    end {
    }
}

function Receive-Information {
    process { 
        If ($package -eq $true ) {
            Write-Host $_ -ForegroundColor Green -NoNewline 
        } 
        ElseIf ($package -eq $false ) {
            Write-Host $_ -ForegroundColor Red -NoNewline 
        } 
        ElseIf ($package -eq 'update' ) {
            Write-Host $_ -ForegroundColor Cyan -NoNewline 
        }
        ElseIf ($package -eq 'warning' ) {
            Write-Host $_ -ForegroundColor Magenta -NoNewline 
        }
        ElseIf ($package -eq 'info' ) {
            Write-Host $_ -ForegroundColor Yellow -NoNewline 
        } 
        ElseIf ($package -eq 'start' ) {
            Write-Host $_ -ForegroundColor Yellow -NoNewline 
        }
        ElseIf ($package -eq 'done' ) {
            Write-Host $_ -ForegroundColor Green -NoNewline 
        }
        Else {
            Write-Host $_ -ForegroundColor Green -NoNewline 
        }   
    }
}
function Receive-bracket {
    process { Write-Host $_ -ForegroundColor White -NoNewline }
}
function Receive-Message {
    process { Write-Host $_ -ForegroundColor $textcolor -NoNewline }
}
Function Get-WarnMessage {
    param ($warnmessage, $package)   
    Write-log "Function: $($MyInvocation.Mycommand)"
    switch ($warnmessage) {
        'missingwebhook' { $message = ' Missing Discord Webhook' }
        'AlertFailed' { $message = ' Discord Alert Failed' }
        'createfolderfailed' { $message = ' Creating backup folder Failed' }
        'backupfnfailed' { $message = ' Fn_New-BackupFolder Failed' }
        'backupfailed' { $message = " Server Backup Failed: :  $LASTEXITCODE" }
        'limitbackupfailed' { $message = " Limit-Backups Failed:  $backupdir $maxbackups" }
        'missingvars' { $message = ' Missing Variables' }
        'missingVariables' { $message = " Missing $serverdir\Variables-$serverfiles.ps1" }
        'chkvarsfailed' { $message = ' Fn_Get-CheckForVars Failed' }
        'fnmcrconfailed' { $message = ' Fn_Get-MCRconCheck Failed' }
        'stoppedfailed' { $message = ' Process stopping Failed' }
        'invalidnumbers' { $message = ' Input Valid AppID  Numbers only' }
        'invalidCharacters' { $message = ' Input Alpha Characters only' }
        'readappidfailed' { $message = ' Read-AppID Failed' }
        'fnnodejsfailed' { $message = ' Fn_Get-NodeJSCheck Failed' }
        'fngetfoldersfailed' { $message = ' Fn_Get-FolderNames Failed' }
        'fnssevenzipfailed' { $message = ' Fn_Get-SevenZipCheck Failed' }
        'fngetsteamfailed' { $message = ' Fn_Get-Steam Failed' }
        'Fn_InstallServerFiles' { $message = ' Failed: Install-ServerFiles: Try Install command' }
        'Fn_Set-ConnectMCRcon' { $message = " Set-ConnectMCRcon Failed: $serverdir" }
        'Fn_Get-StopServer' { $message = " Failed: Get-StopServer null $process" }
        'Fn_Get-StopServerintall' { $message = " Failed: Get-StopServerIntall null $process" }
        'Downloadfailed' { $message = " Downloading  $package Failed" }
        'ExtractFailed' { $message = " Extracting $package Failed" }
        'nolaunchscript' { $message = ' No Launch Script Found for this server' }
        'discordnotenabled' { $message = ' Discord alerts not enabled' }
        Default { $message = "$warnmessage" }
    }
    Start-Sleep 0.3
    Write-Warning "$message"
    #Add-Content $ssmlog "[$loggingdate] Warning: $message"
    Write-Log "Warning: $message"
    Pop-Location
    if ($warnmessage -ne 'missingwebhook' -and $warnmessage -ne 'discordnotenabled') {
        Get-ClearVariables
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
                Add-Content $ssmlog "[$loggingdate] [$serverfiles] $logmessage " 2>$null
                write-verbose "$logmessage"
            }
        }
    }
}
