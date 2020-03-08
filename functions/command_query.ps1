#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-GamedigServerv2 {
    If ($ssmlog -and $loggingdate) {
        If ($nodejsdirectory) {
            Add-Content $ssmlog "[$loggingdate] Starting gamedig on Server  "
            If ($Useprivate -eq "off") {
                set-location $nodejsdirectory
                If (!${queryport}) {
                    Add-Content $ssmlog "[$loggingdate]  Using port $querytype ${extip}:${port} "
                    .\gamedig --type $querytype ${extip}:${port} --pretty
                }
                Else {
                    Add-Content $ssmlog "[$loggingdate]  Using queryport $querytype ${extip}:${queryport}"
                    .\gamedig --type $querytype ${extip}:${queryport} --pretty
                }
                set-location $currentdir
            }
            Else {
                set-location $nodejsdirectory
                If (!${queryport}) {
                    Add-Content $ssmlog "[$loggingdate]  Using port $querytype ${ip}:${port} "
                    .\gamedig --type $querytype ${ip}:${port} --pretty
                }
                Else {
                    Add-Content $ssmlog "[$loggingdate] Using queryport $querytype ${ip}:${queryport}"
                    .\gamedig --type $querytype ${ip}:${queryport} --pretty
                }
                set-location $currentdir
            }
        }
    }
}