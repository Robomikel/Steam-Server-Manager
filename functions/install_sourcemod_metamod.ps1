#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-SourceMetaMod {
    Get-SourceMetaModWebrequest
    $start_time = Get-Date
    Write-Host '****   Downloading Meta Mod   ****' -F M -B Black 
    #(New-Object Net.WebClient).DownloadFile("$metamodurl", "$currentdir\metamod.zip")
    #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $metamodurl -OutFile $currentdir\metamod.zip
    If (!$?) { 
        Write-Host "****   Downloading Meta Mod Failed !!   ****" -F R -B Black ; ; Exit 
    } 
    Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '****   Extracting Meta Mod   ****' -F M -B Black
    Expand-Archive "$currentdir\metamod.zip" "$currentdir\metamod\" -Force
    If (!$?) { 
        Write-Host "****   Extracting Meta Mod Failed !!   ****" -F R -B Black ; ; Exit 
    }
    Write-Host '****   Copying/installing Meta Mod   ****' -F M -B Black 
    Copy-Item  $currentdir\metamod\* -Destination $currentdir\$serverfiles\$systemdir -Force -Recurse
    If (!$?) { 
        Write-Host "****   Copying Meta Mod Failed !!   ****" -F R -B Black ; ; Exit 
    }
    $start_time = Get-Date
    Write-Host '****   Downloading SourceMod   ****' -F M -B Black
    #(New-Object Net.WebClient).DownloadFile("$sourcemodurl", "$currentdir\sourcemod.zip")
    #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $sourcemodurl -OutFile $currentdir\sourcemod.zip
    If (!$?) { 
        Write-Host "****   Downloading SourceMod Failed !!   ****" -F R -B Black ; ; Exit 
    } 
    Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '****   Extracting SourceMod   ****' -F M -B Black 
    Expand-Archive "$currentdir\sourcemod.zip" "$currentdir\sourcemod\" -Force
    If (!$?) { 
        Write-Host "****   Extracting SourceMod Failed !!   ****" -F R -B Black ; ; Exit 
    }
    Write-Host '****   Copying/installing SourceMod   ****' -F M -B Black
    Copy-Item  $currentdir\sourcemod\* -Destination $currentdir\$serverfiles\$systemdir -Force -Recurse
    If (!$?) { 
        Write-Host "****   Copying SourceMod Failed !!   ****" -F R -B Black ; ; Exit 
    }
}