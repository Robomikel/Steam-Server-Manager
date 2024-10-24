#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-MonitorServer {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($process) {
        If ($appid -eq "996560") { 
            Get-MonitorMultiple 
        }
        Else {
            Write-log "info: Monitor  Server process" 
            If (!(Get-Process $process -ea SilentlyContinue)) {
                Select-StartServer
                New-DiscordAlert "restart"
            }
            Else {
                #
                If ($monquery -eq 'on') {
                    If ($null -ne $pingstatus) {
                        # get-process $process
                        if ($?) {
                            clear-hostline 1
                            Get-Infomessage "running" 
                        }
                    }
                    Else{
                        Write-log "info: Monitor Cannot Query Server"
                        clear-hostline 1
                        Get-Infomessage "running" $false
                        Get-RestartsServer
                        New-DiscordAlert "query-restart"
                    }
                }
                Else {
                    get-process $process  >$null 2>&1
                    if ($?) {
                        clear-hostline 1
                        Get-Infomessage "running" 
                    }

                }
                Get-ClearVariables
                Exit 
            }
            Get-CheckForError
        }
    }
}
Function Get-MonitorMultiple {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $process = get-process | Where-Object { $_.ProcessName -match $process } | get-process 
    If (!$process) {
        Select-StartServer
        New-DiscordAlert  "restart"
    }
    Else {
        get-process $process 
        If ($?) {
            clear-hostline 1
            Get-Infomessage "running" 
        } 
        Else {
            clear-hostline 1
            Get-Infomessage "running" $false
        }
        Get-ClearVariables 
        Exit
    }
}