#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-StartServer {
    param(
        # [string]
        [Parameter(Mandatory = $true, Position = 0)]
        # [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)] 
        $launchParams
    )
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($launchParams -and $appid -and $executabledir) {
        Push-location
        Set-Location $executabledir
        # Write-log "Location: $executabledir"
        # If ($appid -eq 343050) { Set-Location $serverdir\$executabledir }
        #Start-Process -FilePath CMD -ArgumentList ("/c $launchParams") -NoNewWindow
        if ($env:SSH_CLIENT) {
            Write-log "info: SSH Client Detected"
            Write-log "Psversion: $($PSVersionTable.PSVersion) "
            $s = switch -Regex ([string]$ps = $($pSVersionTable.PSVersion)) {
                ("7.4") {"C:\Program Files\PowerShell\7\pwsh"}
                ("7.5") {"C:\Program Files (x86)\PowerShell\7-preview\pwsh"}
                Default {"powershell"}
            }
            $processCreateParams = @{
                ClassName  = "Win32_Process"
                MethodName = "Create"
                Arguments  = @{
                    CommandLine = "$s $currentdir\ssm.ps1 $command $serverfiles"
                }
            }
            $procInfo = Invoke-CimMethod @processCreateParams
            if ($procInfo.ReturnValue -ne 0) {
                $msg = switch ($procInfo.ReturnValue) {
                    2 { "Access denied" }
                    3 { "Insufficient privilege" }
                    8 { "Unknown failure" }
                    9 { "Path not found" }
                    21 { "Invalid parameter" }
                    default { "Other" }
                }
                Write-Error -Message "Failed to start process: $($procInfo.ReturnValue) ($msg)"
            }
            $proc = Get-Process -Id $procInfo.ProcessId
            write-log "info: process: start $($proc.Path)"
        }
        Else {
            If ($appid -eq 258550 -or $appid -eq 294420 -or $appid -eq 302550 -or $appid -eq 361580 ) {
                Start-Process CMD "/c start $launchParams"
                Write-Log "info: Start-Process CMD /c start $launchParams  "
            }
            ElseIf ($appid -eq 1180760) {
                Start-Process CMD "/c $launchParams"
                Write-Log "info: Start-Process CMD /c $launchParams"
            }
            ElseIf ($appid -eq 685100) {
                Start-Process CMD -ArgumentList $launchParams
                Write-Log "info: Start-Process CMD $launchParams"
            }
            Else {

                Start-Process CMD "/c start $launchParams"  -NoNewWindow
                Write-Log "info: Start-Process CMD /c start $launchParams  -NoNewWindow"
            }
        }
        # Get-WmiObject Win32_process -filter 'name = `"valheim_server`"' | foreach-object { $_.SetPriority(256) }
        # Get-WmiObject Win32_process | ? { $_.Name -like "*valheim_server*"}| foreach-object { $_.SetPriority(256) }
        # Write-Log "info: Get-WmiObject Win32_process -filter 'name = `"$process`"' | foreach-object { $_.SetPriority(256) }"
        Write-log "Psversion: $($PSVersionTable.PSVersion) "
        If ($psSeven -eq $true) {
            Set-ProcessPriority -Name ($process + '.exe') -Priority High
            Write-Log "info: Set Priority $process High"
        }
        Else {
            Get-WmiObject Win32_process | ? { $_.Name -like "*$process*" } | foreach-object { $_.SetPriority(256) }
            Write-Log "info: Set Priority $process SetPriority(256)"
        }
        Pop-Location
    }
}
Function Select-StartServer {
    Write-log "Function: $($MyInvocation.Mycommand)"
    clear-hostline 1
    Get-Infomessage "starting" 'start'
    Get-StartServer $launchParams
    If ($?) {
        clear-hostline 1
        Get-Infomessage "starting" 'done'
    }
}
Function Get-CheckServer {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($ssmlog -and $loggingdate) {
        Write-log "info: Check Server process "
        If ($process) {
            If ($appid -eq "996560") { 
                Get-checkMultiple 
            }
            Else {
                If (!(Get-Process "$process" -ea SilentlyContinue)) {
                    Write-log "Warning: Process: $process not found"
                    clear-hostline 1
                    Get-Infomessage "notrunning" 'info'
                }
                Else {
                    clear-hostline 1
                    Get-Infomessage "running" 'info'
                    # $process
                    Get-ClearVariables
                    Exit 
                }
                Get-CheckForError
            }
        }
    }
}
Function Get-checkMultiple {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $process = get-process | Where-Object { $_.ProcessName -match $process } | get-process
    If (!$process) {
        Write-log "Warning: Process: $process not found"
        clear-hostline 1
         Get-Infomessage "notrunning" "info"
    }
    Else {
        clear-hostline 1
        Get-Infomessage "running" 
        # $process
        Get-ClearVariables 
        Exit
    }
}
