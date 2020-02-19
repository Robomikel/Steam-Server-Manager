#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Add-Sevenzip {
    $start_time = Get-Date
    Write-Host '****   Downloading 7ZIP   ****' -F M -B Black 
    #(New-Object Net.WebClient).DownloadFile("$sevenzip", "$currentdir\7za920.zip")
    #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $sevenzip -OutFile $currentdir\7za920.zip
    If (!$?) {
        Write-Host "****   7Zip Download Failed   *****" -F Y -B Black
        New-TryagainNew 
    }
    If ($?) {
        Write-Host "****   7Zip  Download succeeded   ****" -F Y -B Black
    }
    Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '****   Extracting 7ZIP   *****' -F M -B Black 
    Expand-Archive "$currentdir\7za920.zip" "$currentdir\7za920\" -Force
    If (!$?) {
        Write-Host "****   7Zip files did not Extract   ****" -F Y -B Black
        New-TryagainNew 
    }
    If ($?) {
        Write-Host "****   7Zip Extract succeeded   ****" -F Y -B Black
    }
}