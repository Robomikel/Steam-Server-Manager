#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-MCRconCheck {
    If ((Test-Path "$mcrcondirectory") -and (Test-Path "$mcrcondirectory\mcrcon.exe")) { 
        # Write-Host '****   mcrcon already downloaded!   ****' -F Y -B Black
        Add-Content $ssmlogdir\ssm-$datelog-.log "[$logdate]****   mcrcon already downloaded!   **** "
    } 
    ElseIf (!(Test-Path "$mcrcondirectory") -or (Test-Path "$mcrcondirectory\mcrcon.exe")) {  
        install-mcrcon
    }
    Else { 
        Add-Content $ssmlogdir\ssm-$datelog-.log "[$logdate] fn_Get-MCRconCheck failed"
    }
}