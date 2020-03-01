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
        #(New-Object Net.WebClient).DownloadFile("$nodejsurl", "$currentdir\node-v$nodeversion-win-x64.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        Invoke-WebRequest -Uri $nodejsurl -OutFile $nodejsoutput
        If (!$?) {
            $global:warnmessage = 'Downloadfailed'
            Get-WarnMessage 
            New-TryagainNew
        }
        ElseIf ($?) {
            $global:infomessage = "Downloaded"
            Get-Infomessage 
        }
        $global:infomessage = "downloadtime"
        Get-Infomessage
        $global:infomessage = "Extracting"
        Get-Infomessage 
        Expand-Archive "$currentdir\node-v$nodeversion-win-x64.zip" "$currentdir\node-v$nodeversion-win-x64\" -Force
        Copy-Item  "$currentdir\node-v$nodeversion-win-x64\node-v$nodeversion-win-x64\*" -Destination $nodejsdirectory -Recurse -Force 3>&1 2>&1 >>  $ssmlog
        Remove-Item "$currentdir\node-v$nodeversion-win-x64\node-v$nodeversion-win-x64" -Recurse -Force 3>&1 2>&1 >>  $ssmlog
        If (!$?) {
            $global:warnmessage = 'ExtractFailed'
            Get-WarnMessage
            New-TryagainNew
        }
        ElseIf ($?) { 
            $global:infomessage = "Extracted"
            Get-Infomessage 
        }
        Set-Location $nodejsdirectory  
        .\npm install gamedig
        .\npm install gamedig -g
        Set-Location $currentdir
    }
}