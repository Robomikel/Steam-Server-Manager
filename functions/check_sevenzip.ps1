#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-SevenZipCheck {
    Add-Content $ssmlog "[$loggingdate] Checking for 7ZIP "
    If ($sevenzipexecutable) {   
        If (Test-Path $sevenzipexecutable ) { 
            Add-Content $ssmlog "[$loggingdate] 7Zip already downloaded! "
        }
        ElseIf (!(Test-Path $sevenzipexecutable)) {
            Add-Content $ssmlog "[$loggingdate]  7Zip not found! $sevenzipexecutable "
            Add-Sevenzip
        }
    }
    ElseIf (!$sevenzipexecutable) {
        $global:warnmessage = "fnssevenzipfailed"
        Get-warnmessage
    }
}