#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function install-mcrcon {
    $start_time = Get-Date
    Write-Host '****   Downloading MCRCon from github   ****' -F M -B Black 
    #(New-Object Net.WebClient).DownloadFile("$global:metamodurl", "$global:currentdir\metamod.zip")
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $global:mcrconurl -OutFile $global:currentdir\mcrcon.zip
    If (!$?) {
        Write-Host "****   Downloading  MCRCon Failed   ****" -F R -B Black 
        New-TryagainNew 
    }
    If ($?) { 
        Write-Host "****   Downloading  MCRCon succeeded   ****" -F Y -B Black 
    }
    Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '****   Extracting MCRCon from github   ****' -F M -B Black
    Expand-Archive "$global:currentdir\mcrcon.zip" "$global:currentdir\mcrcon\" -Force
    If (!$?) {
        Write-Host "****   Extracting MCRCon Failed   ****" -F Y -B Black 
        New-TryagainNew 
    }
    If ($?) { 
        Write-Host "****   Extracting MCRCon succeeded   ****" -F Y -B Black 
    }
}