#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Oxide {
    $start_time = Get-Date
    Write-Host '****   Downloading Oxide   ****' -F M -B Black
    #(New-Object Net.WebClient).DownloadFile("$oxiderustlatestlink", "$currentdir\oxide.zip")
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $oxiderustlatestlink -OutFile $currentdir\oxide.zip
    If (!$?) { 
        Write-Host "****   Downloading Oxide Failed !!   ****" -F R -B Black ; ; Exit 
    } 
    Write-Host "Download Time: $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '****   Extracting Oxide    ****' -F M -B Black
    Expand-Archive "$currentdir\oxide.zip" "$currentdir\oxide\" -Force
    If (!$?) { 
        Write-Host "****   Extracting Oxide Failed !!   ****" -F R -B Black ; ; Exit 
    }

    Write-Host '****   Copying Oxide *****' -F M -B Black
    Copy-Item  $currentdir\oxide\* -Destination $systemdir -Force -Recurse
    If (!$?) { 
        Write-Host "****   Copying Oxide Failed !!   ****" -F R -B Black ; ; Exit 
    }
}