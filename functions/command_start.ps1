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
        Write-log "Location: $executabledir"
        # If ($appid -eq 343050) { Set-Location $serverdir\$executabledir }
        #Start-Process -FilePath CMD -ArgumentList ("/c $launchParams") -NoNewWindow
        If ($appid -eq 258550 -or $appid -eq 294420 -or $appid -eq 302550 -or $appid -eq 361580 ) {
            Start-Process CMD "/c start $launchParams"
            Write-Log "Start-Process CMD /c start $launchParams  "
        }
        ElseIf ($appid -eq 1180760){
            Start-Process CMD "/c $launchParams"
            Write-Log "Start-Process CMD /c $launchParams"
        } 
        Else {
            Start-Process CMD "/c start $launchParams"  -NoNewWindow
            Write-Log "Start-Process CMD /c start $launchParams  -NoNewWindow"
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
        Get-Infomessage "starting" 
    }
}
Function Get-CheckServer {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($ssmlog -and $loggingdate) {
        Write-log "Check Server process "
        If ($process) {
            If ($appid -eq "996560") { 
                Get-checkMultiple 
            }
            Else {
                If (!(Get-Process "$process" -ea SilentlyContinue)) {
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
