#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-MonitorServer {
    Write-log "Function: Get-MonitorServer"
    If ($process) {
        If ($appid -eq "996560") { 
            Get-MonitorMultiple 
        }
        Else {
            Write-log "Monitor  Server process" 
            If (!(Get-Process $process -ea SilentlyContinue)) {
                Select-StartServer
                New-DiscordAlert "restart"
            }
            Else {
                #
                If ($pingstatus) {
                    # 
                    get-process $process
                    if ($?) {
                        Get-Infomessage "running" 
                    }
                }
                Else {
                    Write-log "Monitor: Cannot Query Server"
                    Get-Infomessage "running" $false
                    Get-RestartsServer
                    New-DiscordAlert "query-restart"
                }
                Get-ClearVariables
                Exit 
            }
            Get-CheckForError
        }
    }
}
Function Get-MonitorMultiple {
    Write-log "Function: Get-MonitorMultiple"
    $process = get-process | Where-Object { $_.ProcessName -match $process } | get-process 
    If (!$process) {
        Select-StartServer
        New-DiscordAlert  "restart"
    }
    Else {
        get-process $process 
        If ($?){
            Get-Infomessage "running" 
        } 
        Else {
            Get-Infomessage "running" $false
        }
        Get-ClearVariables 
        Exit
    }
}