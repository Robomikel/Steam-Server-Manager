#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Add-NodeJS {
    Write-log "Function: Add-NodeJS"
    # NodeJs Version "12.13.1"
    # $nodeversion = "12.15.0"
    $nodejscurrentlink = Invoke-WebRequest -Uri "https://nodejs.org/download/release/latest-v12.x/" -UseBasicParsing
    $nodeversion = $nodejscurrentlink.Links.href | Select-String -Pattern win-x64.zip
    $nodejsurl = "https://nodejs.org/download/release/latest-v12.x/$nodeversion"
    $nodejsoutput = "$nodeversion"
    $nodejsdirectory = "$currentdir\latest-v12.x"
    $nodejsexecutable = "$nodejsdirectory\node.exe"
    If ($nodeversion) {
        $start_time = Get-Date
        Get-Infomessage "Downloading" 'Nodejs'
        #(New-Object Net.WebClient).DownloadFile("$nodejsurl", "$currentdir\$nodeversion")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        Invoke-WebRequest -Uri $nodejsurl -OutFile $nodejsoutput
        If (!$?) {
            Get-WarnMessage  'Downloadfailed' 'Nodejs'
            New-TryagainNew
        }
        ElseIf ($?) {
            Get-Infomessage "Downloaded" 'Nodejs'
        } 
        Get-Infomessage "downloadtime"
        Get-Infomessage "Extracting" 'Nodejs'
        Expand-Archive "$currentdir\$nodejsoutput" "$currentdir\latest-v12.x\" -Force
        $nodeversionfolder = $nodeversion -replace '.zip', ''
        Copy-Item  "$currentdir\latest-v12.x\$nodeversionfolder\*" -Destination $nodejsdirectory -Recurse -Force 
        Remove-Item "$currentdir\latest-v12.x\$nodeversionfolder" -Recurse -Force 
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' 'Nodejs'
            New-TryagainNew
        }
        ElseIf ($?) { 
            Get-Infomessage "Extracted" 'Nodejs'
        }
        Set-Location $nodejsdirectory  
        .\npm install gamedig
        .\npm install gamedig -g
        Set-Location $currentdir
    }
}

Function Add-gamedig {
    Write-log "Function: Add-gamedig"
    if (!($(test-path $env:APPDATA\npm\gamedig))) {
        # & "npm install gamedig"
        # & "npm install gamedig -g"
         saps powershell -args ("npm install gamedig") -wait -nnw
         saps powershell -args ("npm install gamedig -g") -wait -nnw
    }
}