#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-FolderNames {
    If ($ssmlog -and $loggingdate) {
        Add-Content $ssmlog "[$loggingdate] Checking Folder Names "
        If ($serverdir) {
            If (Test-Path "$serverdir") {
                Add-Content $ssmlog "[$loggingdate] Folder Name Exists   $serverdir "
            }
            ElseIf (!(Test-Path "$serverdir")) {
                New-ServerFolderq
            }
        }
        ElseIf (!$serverdir) {
            $global:warnmessage = "fngetfoldersfailed"
            Get-warnmessage
        
        }
    }
}
