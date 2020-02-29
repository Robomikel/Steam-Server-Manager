#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-ServerFolder {   
    ##-- Create Folder for Server -- In current folder
    If ((!$serverfiles) -or ($serverfiles -eq " ")) {
        # Write-Host "****   You Enter a null or Empty   ****" -F R -B Black
        Write-Warning ' You Enter a null or Empty '
        Select-Steamer
    }
    ElseIf (($null -eq $appid ) -or ($appid -eq " ")) {
        # Write-Host "****   You Enter a space or Empty   ****" -F R -B Black
        Write-Warning ' You Enter a space or Empty  '
        Select-Steamer
    }
    ElseIf (Test-Path "$serverdir" ) {
        # Write-Host '****   Server Folder Already Created!   ****' -F Y -B Black
        Add-Content $ssmlog "[$loggingdate] Server Folder Already Created!   "
    }
    Else {
       #  Write-Host '****   Creating Server Folder   ****' -F M -B Black 
        Add-Content $ssmlog "[$loggingdate] Creating Server Folder  "
        New-Item  . -Name "$serverfiles" -ItemType "directory" 3>&1 2>&1 > $ssmlog
    }
}
