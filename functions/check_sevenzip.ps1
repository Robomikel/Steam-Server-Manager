#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-SevenZipCheck {
    Write-log "Function: Get-SevenZipCheck"
    If ($ssmlog -and $loggingdate) {
        Write-log "Checking for 7ZIP " 'info'
        If (!(Test-Path $sevenzipprogramexecutable)) {
            If ($sevenzipexecutable) {   
                If (Test-Path $sevenzipexecutable ) { 
                    Write-log "7Zip already downloaded! "
                }
                ElseIf (!(Test-Path $sevenzipexecutable)) {
                    Write-log " 7Zip not found! $sevenzipexecutable "
                    Add-Sevenzip
                }
            }
            ElseIf (!$sevenzipexecutable) {
                Get-warnmessage "fnssevenzipfailed"
            }
        }
        Else {
            Write-log "7Zip already installed! "
        }
    }
}