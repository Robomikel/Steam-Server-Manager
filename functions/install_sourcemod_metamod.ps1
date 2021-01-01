#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-MetaMod {
    Write-log "Function: Get-MetaMod"
    Get-MetaModWebrequest
    If ($metamodlatestlisturl -and $metamodmversionzip) {
        If ($command -eq 'update-mods') {
            Compare-Modlist 'MetaMod' $metamodmversionzip
        }
        If ($nomodupdate -eq $true) {
            Get-Infomessage "No MetaMod updates" 'info'
            return
        }
        Else {
            $start_time = Get-Date
            Get-Infomessage "Downloading" 'MetaMod'
            #(New-Object Net.WebClient).DownloadFile("$metamodurl", "$currentdir\metamod.zip")
            #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
            write-log "Invoke-WebRequest -Uri $metamodlatestlisturl -OutFile $metamodmversionzip"
            # Invoke-WebRequest $metamodlatestlisturl -O $metamodmversionzip
            Start-Process -Wait -FilePath powershell -ArgumentList "Invoke-WebRequest $metamodlatestlisturl -O $metamodmversionzip" -nnw
            If (!$?) { 
                Get-WarnMessage 'Downloadfailed' 'MetaMod'
            }
            ElseIf ($?) {
                Get-Infomessage "Downloaded" 'MetaMod'
            } 
            Get-Infomessage "downloadtime"
            Get-Infomessage "Extracting" 'MetaMod'
            If ($metamodmversionzip -and $metamodmversionfolder) {
                Expand-Archive $metamodmversionzip $metamodmversionfolder -Force >$null 2>&1
            }
            If (!$?) { 
                Get-WarnMessage 'ExtractFailed' 'MetaMod'
                New-TryagainNew
            }
            Write-log "Copying/installing Meta Mod"
            If ($metamodmversionfolder -and $systemdir) { 
                Copy-Item  "$metamodmversionfolder\addons" -Destination $systemdir -Force -Recurse >$null 2>&1
            }
            If (!$?) { 
                Write-log "Copying Meta Mod Failed"
                New-TryagainNew 
            }
            Edit-Modlist 'MetaMod' $metamodmversionzip
        }
    }
}

Function Get-SourceMod {
    Write-log "Function: Get-SourceMod"
    Get-Sourcemodwebrequest
    If ($command -eq 'update-mods') {
        Compare-Modlist 'Sourcemod' $sourcemodmversionzip
    }
    If ($nomodupdate -eq $true) {
        Get-Infomessage "No Sourcemod updates" 'info'
        return
    }
    Else {
        $start_time = Get-Date
        Get-Infomessage "Downloading" 'SourceMod'
        #(New-Object Net.WebClient).DownloadFile("$sourcemodurl", "$currentdir\sourcemod.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        If ($sourcemodlatestlisturl -and $sourcemodmversionzip) {
            # Invoke-WebRequest -Uri $sourcemodlatestlisturl -OutFile $sourcemodmversionzip
            Start-Process -Wait -FilePath powershell -ArgumentList "Invoke-WebRequest -Uri $sourcemodlatestlisturl -OutFile $sourcemodmversionzip" -nnw
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
        Expand-Archive $sourcemodmversionzip $sourcemodmversionfolder -Force >$null 2>&1
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' 'SourceMod'
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "Extracted" 'SourceMod'
        }
        Get-Infomessage "copying-installing" 'SourceMod'
        If ($sourcemodmversionfolder -and $systemdir) { 
            Copy-Item  "$sourcemodmversionfolder\addons" -Destination $systemdir -Force -Recurse >$null 2>&1
            Copy-Item  "$sourcemodmversionfolder\cfg" -Destination $systemdir -Force -Recurse >$null 2>&1
        }
        If (!$?) { 
            Write-log "Copying SourceMod Faileds "
            New-TryagainNew 
        }
        Edit-Modlist 'Sourcemod' $sourcemodmversionzip
    }
}

Function Get-CSGOGet5 {
    Write-log "Function: Get-CSGOGet5"
    If ( $csgoget5url -and $systemdir) {
        # This might work...
        $get5latesturl = iwr $csgoget5url
        $get5latestzip = $(($get5latesturl.Links.href | ? { $_ -match "get5-" } | select-string -NotMatch /).Line)
        $get5latestdl = "https://ci.splewis.net/job/get5/lastSuccessfulBuild/artifact/builds/get5/$get5latestzip"
        If ($command -eq 'update-mods') {
            Compare-Modlist 'CSGO-Get5' $get5latestzip
        }
        If ($nomodupdate -eq $true) {
            Write-log "($nomodupdate -eq $true)"
            Get-Infomessage "No CSGO-Get5 updates" 'info'
            return
        }
        Else {
            #   iwr $csgoget5url -O $csgoget5zip
            iwr $get5latestdl -O $get5latestzip
        }
    }
    If (!$?) { 
        Get-WarnMessage 'Downloadfailed' 'CSGO-Get5'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Downloaded" 'CSGO-Get5'
    }
    $csgoget5folder = "$($get5latestzip.Replace('.zip',''))"
    $csgoget5folder = "$currentdir\$csgoget5folder"
    # Expand-Archive $csgoget5zip $csgoget5folder
    Expand-Archive $get5latestzip $csgoget5folder -Force
    If (!$?) {
        Get-WarnMessage 'ExtractFailed' 'CSGO-Get5'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Extracted" 'CSGO-Get5'
    }
    Get-Infomessage "copying-installing" 'CSGO-Get5'
    Copy-Item  "$csgoget5folder\addons" -Destination $systemdir -Force -Recurse >$null 2>&1
    Copy-Item  "$csgoget5folder\cfg" -Destination $systemdir -Force -Recurse >$null 2>&1
    If (!$?) { 
        Write-log "Copying CSGO-Get5 Failed "
        New-TryagainNew 
    }
    Edit-Modlist 'CSGO-Get5' $get5latestzip

}

Function Get-CSGOcsgopugsetup {
    Write-log "Function: Get-CSGOcsgopugsetup"
    If ( $systemdir) {
        # iwr $csgopugsetupurl -O $githubrepozipname
        if ($Pugsetupowner -and $Pugsetuprepo ) {
            Get-GithubRestAPI $Pugsetupowner $Pugsetuprepo 
        }
    }
    If ($command -eq 'update-mods') {
        Compare-Modlist 'CSGO-pugsetup' $githubrepozipname
    }
    If ($nomodupdate -eq $true) {
        Get-Infomessage "No CSGO-pugsetup updates" 'info'
        return
    }
    Else {
        If (!$?) { 
            Get-WarnMessage 'Downloadfailed' 'CSGO-pugsetup'
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "Downloaded" 'CSGO-pugsetup'
        }
        $csgopugsetupfolder = $githubrepozipname.Replace('.zip', '')
        
        $csgopugsetupfolder = "$currentdir\$csgopugsetupfolder"
        Expand-Archive $githubrepozipname $csgopugsetupfolder -Force
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' 'CSGO-pugsetup'
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "Extracted" 'CSGO-pugsetup'
        }
        Get-Infomessage "copying-installing" 'CSGO-pugsetup'
        Copy-Item  "$csgopugsetupfolder\addons" -Destination $systemdir -Force -Recurse >$null 2>&1
        Copy-Item  "$csgopugsetupfolder\cfg" -Destination $systemdir -Force -Recurse >$null 2>&1
        If (!$?) { 
            Write-log "Copying CSGOcsgopugsetup Failed "
            New-TryagainNew 
        }
        Edit-Modlist 'CSGO-pugsetup' $githubrepozipname
    }
}
Function Get-CSGOsteamworks {
    Write-log "Function: Get-CSGOsteamworks"
    If ($steamworksurl -and $systemdir) {
        $steamworkslatest = iwr $steamworksurl
        $steamworkslatestzip = $( ($steamworkslatest.Links.href | select-string -SimpleMatch windows.zip | select -First 1 ).Line) 
        If ($command -eq 'update-mods') {
            Compare-Modlist 'SteamWorks' $steamworkslatestzip
        }
        If ($nomodupdate -eq $true) {
            Get-Infomessage "No SteamWorks updates" 'info'
            return
        }
        Else {
            iwr $steamworksurl$steamworkslatestzip -O $steamworkslatestzip
        }
    }
    If (!$?) { 
        Get-WarnMessage 'Downloadfailed' 'SteamWorks'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Downloaded" 'SteamWorks'
    }
    # $steamworksfolder = $steamworkslatestzip.Replace('.zip','')
    $steamworksfolder = $steamworkslatestzip -Replace '.zip', ''
    $steamworksfolder = "$currentdir\$steamworksfolder"
    Expand-Archive $steamworkslatestzip $steamworksfolder -Force
    If (!$?) {
        Get-WarnMessage 'ExtractFailed' 'SteamWorks'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Extracted" 'SteamWorks'
    }
    Get-Infomessage "copying-installing" 'SteamWorks'
    Copy-Item  "$steamworksfolder\addons" -Destination $systemdir -Force -Recurse >$null 2>&1
    #Copy-Item  "$steamworksfolder\cfg" -Destination $systemdir -Force -Recurse >$null 2>&1
    If (!$?) { 
        Write-log "Copying SteamWorks Failed "
        New-TryagainNew 
    }
    Edit-Modlist 'SteamWorks' $steamworkslatestzip
}