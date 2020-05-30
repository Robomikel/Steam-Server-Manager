#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-GamedigServerv2 {
    Write-log "Function: Get-GamedigServerv2"
    If ($ssmlog -and $loggingdate) {
        If ($nodejsdirectory) {
            Write-log "Starting gamedig on Server  "
            If ($Useprivate -eq "off") {
                set-location $nodejsdirectory
                If (!${queryport}) {
                    Write-log " Using port $querytype ${extip}:${port} "
                    .\gamedig --type $querytype ${extip}:${port} --pretty
                }
                Else {
                    Write-log " Using queryport $querytype ${extip}:${queryport}"
                    .\gamedig --type $querytype ${extip}:${queryport} --pretty
                }
                set-location $currentdir
            }
            Else {
                set-location $nodejsdirectory
                If (!${queryport}) {
                    Write-log " Using port $querytype ${ip}:${port} "
                    .\gamedig --type $querytype ${ip}:${port} --pretty
                }
                Else {
                    Write-log "Using queryport $querytype ${ip}:${queryport}"
                    .\gamedig --type $querytype ${ip}:${queryport} --pretty
                }
                set-location $currentdir
            }
        }
    }
}