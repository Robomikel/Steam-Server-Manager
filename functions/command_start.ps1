#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-StartServer {
    param(
        # [string]
        [Parameter(Mandatory = $true, Position = 0)]
        # [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)] 
        $global:launchParams
    )
    If ($global:log -eq "1") {New-ServerLog}
    Set-Location $global:currentdir\$global:server\
    If ($global:APPID -eq 343050) {Set-Location $global:currentdir\$global:server\$global:EXEDIR}
    #Start-Process -FilePath CMD -ArgumentList ("/c $global:launchParams") -NoNewWindow
    If (( $global:APPID -eq 258550 ) -or ($global:APPID -eq 294420 ) -or ($global:APPID -eq 302550)) {
        Start-Process CMD "/c start $global:launchParams"
    }
    Else {
        Start-Process CMD "/c start $global:launchParams"  -NoNewWindow
    }
    Set-Location $global:currentdir
}
Function Select-StartServer {
    Write-Host '****   Starting Server   *****' -F Y -B Black  
    Get-StartServer $global:launchParams
}
