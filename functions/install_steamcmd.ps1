#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Install-Steam {
    
    $start_time = Get-Date
    #(New-Object Net.WebClient).DownloadFile("$global:steamurl", "steamcmd.zip")
    Write-Host '****   Downloading SteamCMD   ****' -F M -B Black
    #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;  
    Invoke-WebRequest -Uri $global:steamurl -OutFile $global:steamoutput
    If (!$?) {
        Write-Host " ****   Downloading  SteamCMD Failed   ****" -F R -B Black 
        New-TryagainNew 
    }
    If ($?) { Write-Host " ****   Downloading  SteamCMD succeeded    ****" -F Y -B Black }
    Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '***   Extracting SteamCMD *****' -F M -B Black 
    Expand-Archive "$global:currentdir\steamcmd.zip" "$global:currentdir\steamcmd\" -Force 
    If (!$?) {
        Write-Host " ****   Extracting SteamCMD Failed    ****" -F Y -B Black 
        New-TryagainNew 
    }
    If ($?) { Write-Host " ****   Extracting SteamCMD succeeded    ****" -F Y -B Black }
    
}