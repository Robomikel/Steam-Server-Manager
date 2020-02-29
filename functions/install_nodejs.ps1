#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Add-NodeJS {
    If ($nodeversion) {
        $start_time = Get-Date
        $global:package = 'Nodejs'
        $global:infomessage = "Downloading"
        Get-Infomessage
        # Write-Host '****   Downloading  Nodejs   ****' -F M -B Black  
        #(New-Object Net.WebClient).DownloadFile("$nodejsurl", "$currentdir\node-v$nodeversion-win-x64.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        Invoke-WebRequest -Uri $nodejsurl -OutFile $currentdir\node-v$nodeversion-win-x64.zip
        If (!$?) {
            # sWrite-Host "****   Downloading  Nodejs Failed    ****" -F R -B Black
            $global:warnmessage = 'Downloadfailed'
            Get-WarnMessage 
            New-TryagainNew
        }
        ElseIf ($?) {
            $global:infomessage = "Downloaded"
            Get-Infomessage 
            # Write-Host "****   Downloading  Nodejs succeeded   ****" -F Y -B Black 
        }
        Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
        $global:infomessage = "Extracting"
        Get-Infomessage 
        Expand-Archive "$currentdir\node-v$nodeversion-win-x64.zip" "$currentdir\node-v$nodeversion-win-x64\" -Force
        If (!$?) {
            $global:warnmessage = 'ExtractFailed'
            Get-WarnMessage
            # Write-Host "****   Extracting Nodejs Failed   ****" -F Y -B Black 
            New-TryagainNew
        }
        ElseIf ($?) { 
            # Write-Host "****   Extracting Nodejs succeeded   ****" -F Y -B Black
            $global:infomessage = "Extracted"
            Get-Infomessage 
        }
        Set-Location $nodejsdirectory
        $global:infomessage = "copying-installing"
        Get-Infomessage   
        .\npm install gamedig
        .\npm install gamedig -g
        Set-Location $currentdir
    }
}