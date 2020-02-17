#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-MCbrversion{
    $localbuild = Get-Content $global:server\version.txt
    Get-MCBRWebrequest
    $remotebuild = $global:mcbrWebResponse.href
    If (Compare-Object $remotebuild.ToString() $localbuild.ToString()) {
        Write-Host "****   Avaiable Updates Server   ****" -F Green -B Black
        Write-Host "****   Try Install command to update files  ****" -F Y -B Black
    }Else{
        Write-Host "****   No $global:server Updates found   ****" -F Y -B Black
    }
}

Function Get-MCversion{
    $localbuild = Get-Content $global:server\version.txt
    Get-MCWebrequest
    $remotebuild = $global:mcvWebResponse
    If (Compare-Object $remotebuild.ToString() $localbuild.ToString()) {
        Write-Host "****   Avaiable Updates Server   ****" -F Green -B Black
        Write-Host "****   Try Install command to update files  ****" -F Y -B Black
    }Else{
        Write-Host "****   No $global:server Updates found   ****" -F Y -B Black
    }
}
