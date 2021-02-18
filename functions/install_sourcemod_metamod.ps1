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
            # (New-Object Net.WebClient).DownloadFile("$metamodurl", "$ssmwd\metamod.zip")
            # [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
            $metamod = @{
                Wait     = $true
                FilePath = 'PowerShell.exe' 
                Arg      = "Invoke-WebRequest $metamodlatestlisturl -O $metamodmversionzip"
                nnw      = $true
            }
            Start-Process @metamod
            If (!$?) { 
                Get-WarnMessage 'Downloadfailed' 'MetaMod'
            }
            ElseIf ($?) {
                Get-Infomessage "Downloaded" 'MetaMod'
            } 
            Get-Infomessage "downloadtime"
            Get-Infomessage "Extracting" 'MetaMod'
            If ($metamodmversionzip -and $metamodmversionfolder) {
                $metamodzip = @{
                    Path            = "$metamodmversionzip"
                    DestinationPath = "$metamodmversionfolder"
                    Force           = $true
                }
                Expand-Archive @metamodzip >$null 2>&1
            }
            If (!$?) { 
                Get-WarnMessage 'ExtractFailed' 'MetaMod'
                New-TryagainNew
            }
            Write-log "Copying/installing Meta Mod"
            If ($metamodmversionfolder -and $systemdir) { 
                $metamodfolder = @{
                    Path        = "$metamodmversionfolder\addons"
                    Destination = $systemdir
                    Force       = $true
                    Recurse     = $true
                }
                Copy-Item @metamodfolder >$null 2>&1
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
        #(New-Object Net.WebClient).DownloadFile("$sourcemodurl", "$ssmwd\sourcemod.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        If ($sourcemodlatestlisturl -and $sourcemodmversionzip) {
            $sourcemodzip = @{
                Wait     = $true
                FilePath = 'powershell.exe'
                Arg      = "Invoke-WebRequest -Uri $sourcemodlatestlisturl -OutFile $sourcemodmversionzip"
                nnw      = $true
            }
            Start-Process @sourcemodzip
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
        $sourcemodzip = @{
            Path            = "$sourcemodmversionzip"
            DestinationPath = "$sourcemodmversionfolder"
            Force           = $true
        }
        Expand-Archive @sourcemodzip >$null 2>&1
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' 'SourceMod'
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "Extracted" 'SourceMod'
        }
        Get-Infomessage "copying-installing" 'SourceMod'
        If ($sourcemodmversionfolder -and $systemdir) { 
            $sourcemodaddons = @{
                Path        = "$sourcemodmversionfolder\addons"
                Destination = "$systemdir"
                Force       = $true
                Recurse     = $true
            }
            $sourcemodcfg = @{
                Path        = "$sourcemodmversionfolder\cfg"
                Destination = "$systemdir"
                Force       = $true
                Recurse     = $true
            }
            Copy-Item @sourcemodaddons >$null 2>&1
            Copy-Item  @sourcemodcfg >$null 2>&1
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
        $get5latestzip = $(($(iwr $csgoget5url).Links.href | ? { $_ -match "get5-" } | select-string -NotMatch /).Line)
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
            $start_time = Get-Date
            Get-Infomessage "Downloading" 'CSGO-Get5'
            $get5zip = @{
                Uri     = "$get5latestdl"
                OutFile = "$get5latestzip"
            }
            Invoke-WebRequest @get5zip
        }
    }
    If (!$?) { 
        Get-WarnMessage 'Downloadfailed' 'CSGO-Get5'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Downloaded" 'CSGO-Get5'
    }
    Get-Infomessage "downloadtime"
    $csgoget5folder = $ssmwd, $($get5latestzip.Replace('.zip', '')) -join '\'
    $get5zip = @{
        Path            = "$get5latestzip"
        DestinationPath = "$csgoget5folder"
        Force           = $true
    }
    Expand-Archive @get5zip
    If (!$?) {
        Get-WarnMessage 'ExtractFailed' 'CSGO-Get5'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Extracted" 'CSGO-Get5'
    }
    Get-Infomessage "copying-installing" 'CSGO-Get5'
    $get5folderaddons = @{
        Path        = "$csgoget5folder\addons"
        Destination = "$systemdir"
        Force       = $true
        Recurse     = $true
    }
    $get5foldercfg = @{
        Path        = "$csgoget5folder\cfg"
        Destination = "$systemdir"
        Force       = $true
        Recurse     = $true
    }
    Copy-Item  @get5folderaddons >$null 2>&1
    Copy-Item  @get5foldercfg >$null 2>&1
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
        $start_time = Get-Date
        Get-Infomessage "Downloading" 'CSGO-pugsetup'
        iwr $githubrepoziplink -O $githubrepozipname
        If (!$?) { 
            Get-WarnMessage 'Downloadfailed' 'CSGO-pugsetup'
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "Downloaded" 'CSGO-pugsetup'
        }
        Get-Infomessage "downloadtime"
        $csgopugsetupfolder = $ssmwd, $githubrepozipname.Replace('.zip', '') -join '\'
        $pugsetupzip = @{
            Path            = "$githubrepozipname"
            DestinationPath = "$csgopugsetupfolder"
            Force           = $true
        }
        Expand-Archive @pugsetupzip
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' 'CSGO-pugsetup'
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "Extracted" 'CSGO-pugsetup'
        }
        Get-Infomessage "copying-installing" 'CSGO-pugsetup'
        $pugsetupaddons = @{
            Path        = "$csgopugsetupfolder\addons"
            Destination = "$systemdir"
            Force       = $true
            Recurse     = $true
        }
        $pugsetupcfg = @{
            Path        = "$csgopugsetupfolder\cfg"
            Destination = "$systemdir"
            Force       = $true
            Recurse     = $true
        }
        Copy-Item  @pugsetupaddons >$null 2>&1
        Copy-Item  @pugsetupcfg >$null 2>&1
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
        $steamworkslatestzip = $( ($(iwr $steamworksurl).Links.href | select-string -SimpleMatch windows.zip | select -First 1 ).Line) 
        If ($command -eq 'update-mods') {
            Compare-Modlist 'SteamWorks' $steamworkslatestzip
        }
        If ($nomodupdate -eq $true) {
            Get-Infomessage "No SteamWorks updates" 'info'
            return
        }
        Else {
            $start_time = Get-Date
            Get-Infomessage "Downloading" 'SteamWorks'
            $steamworkszip = @{
                Uri     = "$steamworksurl$steamworkslatestzip"
                Outfile = "$steamworkslatestzip"
            }
            Invoke-WebRequest @steamworkszip
        }
    }
    If (!$?) { 
        Get-WarnMessage 'Downloadfailed' 'SteamWorks'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Downloaded" 'SteamWorks'
    }
    Get-Infomessage "downloadtime"
    $steamworksfolder = $ssmwd, $steamworkslatestzip -Replace '.zip', '' -join '\'
    $steamworkszip = @{
        Path            = "$steamworkslatestzip"
        DestinationPath = "$steamworksfolder"
        Force           = $true
    }
    Expand-Archive @steamworkszip
    If (!$?) {
        Get-WarnMessage 'ExtractFailed' 'SteamWorks'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Extracted" 'SteamWorks'
    }
    Get-Infomessage "copying-installing" 'SteamWorks'
    $steamworksaddon = @{
        Path        = "$steamworksfolder\addons"
        Destination = "$systemdir"
        Force       = $true
        Recurse     = $true
    }
    Copy-Item @steamworksaddon >$null 2>&1
    If (!$?) { 
        Write-log "Copying SteamWorks Failed "
        New-TryagainNew 
    }
    Edit-Modlist 'SteamWorks' $steamworkslatestzip
}