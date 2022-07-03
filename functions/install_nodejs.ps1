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
    $nodejscurrentlink = Invoke-WebRequest -Uri "https://nodejs.org/download/release/$nodejslatest/" -UseBasicParsing
    $nodeversion = $nodejscurrentlink.Links.href | Select-String -Pattern win-x64.zip
    $nodejsurl = "https://nodejs.org/download/release/$nodejslatest/$nodeversion"
    $nodejsoutput = "$nodeversion"
    If ($nodeversion) {
        $start_time = Get-Date
        Get-Infomessage "Downloading" 'Nodejs'
        #(New-Object Net.WebClient).DownloadFile("$nodejsurl", "$currentdir\$nodeversion")
        try {
            #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
            Invoke-WebRequest -Uri $nodejsurl -OutFile $currentdir\$nodejsoutput
            If ($?) {
                Get-Infomessage "Downloaded" 'Nodejs'
            }     
        }
        catch {
            Write-log "$($_.Exception.Message)"
            Get-WarnMessage  'Downloadfailed' 'Nodejs'
            New-TryagainNew
        }
        Get-Infomessage "downloadtime"
        Get-Infomessage "Extracting" 'Nodejs'
        Expand-Archive "$currentdir\$nodejsoutput" "$currentdir\$nodejslatest\" -Force
        write-log "Expand-Archive $currentdir\$nodejsoutput $currentdir\$nodejslatest\ -Force"
        $nodeversionfolder = $nodeversion -replace '.zip', ''
        Copy-Item  "$currentdir\$nodejslatest\$nodeversionfolder\*" -Destination $nodejsdirectory -Recurse -Force 
        Remove-Item "$currentdir\$nodejslatest\$nodeversionfolder" -Recurse -Force 
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' 'Nodejs'
            New-TryagainNew
        }
        ElseIf ($?) { 
            Get-Infomessage "Extracted" 'Nodejs'
        }
        Push-location
        Set-Location $nodejsdirectory  
        .\npm install gamedig
        .\npm install gamedig -g
        Pop-Location
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

Function Add-discordjs {
    Write-log "Function: Add-discordjs"
    $n = npm ls discord.js
    if (($n[1] -match "empty") -or ($n -match "ERR!")) {
        # & "npm install gamedig"
        # & "npm install gamedig -g"
        saps powershell -args ("npm install discord.js") -wait -nnw
        #  saps powershell -args ("npm install gamedig -g") -wait -nnw
    }
}

