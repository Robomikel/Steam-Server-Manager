#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-NodeJSCheck {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($nodejsexecutable -and $ssmlog -and $loggingdate) {
        If (!(test-path $nodejsprogramexecutable)) {
            Write-log "info: Checking NodeJS "     
            If (Test-Path $nodejsexecutable) { 
                Write-log "info: NodeJS already downloaded "
            }
            ElseIf (!(Test-Path $nodejsexecutable)) {
                Write-log "Warning: NodeJS not found "
                Add-NodeJS
            }
        }
        Else {
            Write-log "info: NodeJS Installed "
            Add-gamedig
        }
    }
    ElseIf (!$nodejsexecutable) {
        Get-warnmessage "fnnodejsfailed"
    }
}