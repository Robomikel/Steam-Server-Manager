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
    If ($metamodurl -and $metamodoutput -and $sourcemodoutput -and $sourcemoddirectory) {
        $start_time = Get-Date
        Get-Infomessage "Downloading" 'MetaMod'
        #(New-Object Net.WebClient).DownloadFile("$metamodurl", "$currentdir\metamod.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        Invoke-WebRequest -Uri $metamodurl -OutFile $metamodoutput
        If (!$?) { 
            Get-WarnMessage 'Downloadfailed' 'MetaMod'
        }
        ElseIf ($?) {
            Get-Infomessage "Downloaded" 'MetaMod'
        } 
        Get-Infomessage "downloadtime"
        Get-Infomessage "Extracting" 'MetaMod'
        If ($metamodoutput -and $metamoddirectory){
        Expand-Archive $metamodoutput $metamoddirectory -Force >$null 2>&1
        }
        If (!$?) { 
            Get-WarnMessage 'ExtractFailed' 'MetaMod'
            New-TryagainNew
        }
        Add-Content $ssmlog "[$loggingdate] Copying/installing Meta Mod"
        If ($metamoddirectory -and $systemdir){ 
        Copy-Item  "$metamoddirectory\addons" -Destination $systemdir -Force -Recurse >$null 2>&1
        }
        If (!$?) { 
            Add-Content $ssmlog "[$loggingdate] Copying Meta Mod Failed"
            New-TryagainNew 
        }
        $start_time = Get-Date
        Get-Infomessage "Downloading" 'SourceMod'
        #(New-Object Net.WebClient).DownloadFile("$sourcemodurl", "$currentdir\sourcemod.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        If ($sourcemodurl -and $sourcemodoutput){
        Invoke-WebRequest -Uri $sourcemodurl -OutFile $sourcemodoutput
        }
        If (!$?) { 
            Get-WarnMessage 'Downloadfailed' 'SourceMod'
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "Downloaded" 'SourceMod'
        }
        Get-Infomessage "downloadtime"
        Get-Infomessage "Extracting" 'SourceMod'
        Expand-Archive $sourcemodoutput $sourcemoddirectory -Force >$null 2>&1
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' 'SourceMod'
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "Extracted" 'SourceMod'
        }
        Get-Infomessage "copying-installing" 'SourceMod'
        If ($sourcemoddirectory -and $systemdir){ 
        Copy-Item  "$sourcemoddirectory\addons" -Destination $systemdir -Force -Recurse >$null 2>&1
        Copy-Item  "$sourcemoddirectory\cfg" -Destination $systemdir -Force -Recurse >$null 2>&1
        }
        If (!$?) { 
            Add-Content $ssmlog "[$loggingdate] Copying SourceMod Faileds "
            New-TryagainNew 
        }
    }
}