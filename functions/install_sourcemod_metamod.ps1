#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-MetaMod {
    Write-log "Function: $($MyInvocation.Mycommand)"
    Get-MetaModWebrequest
    If ($metamodlatestlisturl -and $metamodmversionzip) {
        If ($command -eq 'update-mods') {
            Compare-Modlist 'MetaMod' $metamodmversionzip
        }
        If ($nomodupdate -eq $true) {
            clear-hostline 1
            Get-Infomessage "No MetaMod updates" 'info'
            return
        }
        Else {
            $start_time = Get-Date
            clear-hostline 1
            Get-Infomessage "Downloading" 'MetaMod'
            # (New-Object Net.WebClient).DownloadFile("$metamodurl", "$currentdir\metamod.zip")
            # [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
            $metamod = @{
                Wait     = $true
                FilePath = 'PowerShell.exe' 
                Arg      = "Invoke-WebRequest $metamodlatestlisturl -O $currentdir\$metamodmversionzip"
                nnw      = $true
            }
            Start-Process @metamod
            If (!$?) { 
                Get-WarnMessage 'Downloadfailed' 'MetaMod'
            }
            ElseIf ($?) {
                clear-hostline 1
                Get-Infomessage "Downloaded" 'MetaMod' 
            } 
            clear-hostline 1
            Get-Infomessage "downloadtime"
            clear-hostline 1
            Get-Infomessage "Extracting" 'MetaMod'
            If ($metamodmversionzip -and $metamodmversionfolder) {
                $metamodzip = @{
                    Path            = "$currentdir\$metamodmversionzip"
                    DestinationPath = "$currentdir\$metamodmversionfolder"
                    Force           = $true
                }
                Expand-Archive @metamodzip >$null 2>&1
            }
            If (!$?) { 
                Get-WarnMessage 'ExtractFailed' 'MetaMod'
                New-TryagainNew
            }
            Write-log "info: Copying/installing Meta Mod"
            If ($metamodmversionfolder -and $systemdir) { 
                $metamodfolder = @{
                    Path        = "$currentdir\$metamodmversionfolder\addons"
                    Destination = $systemdir
                    Force       = $true
                    Recurse     = $true
                }
                Write-log "info: Copy-Item $currentdir\$metamodmversionfolder\addons $systemdir" 
                Copy-Item @metamodfolder >$null 2>&1
            }
            If (!$?) { 
                Write-log "Failed: Copying Meta Mod "
                New-TryagainNew 
            }
            Edit-Modlist 'MetaMod' $metamodmversionzip
        }
    }
}
Function Get-SourceMod {
    Write-log "Function: $($MyInvocation.Mycommand)"
    Get-Sourcemodwebrequest
    If ($command -eq 'update-mods') {
        Compare-Modlist 'Sourcemod' $sourcemodmversionzip
    }
    If ($nomodupdate -eq $true) {
        clear-hostline 1
        Get-Infomessage "No Sourcemod updates" 'info'
        return
    }
    Else {
        $start_time = Get-Date
        clear-hostline 1
        Get-Infomessage "Downloading" 'SourceMod'
        #(New-Object Net.WebClient).DownloadFile("$sourcemodurl", "$currentdir\sourcemod.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        If ($sourcemodlatestlisturl -and $sourcemodmversionzip) {
            $sourcemodzip = @{
                Wait     = $true
                FilePath = 'powershell.exe'
                Arg      = "Invoke-WebRequest -Uri $sourcemodlatestlisturl -OutFile $currentdir\$sourcemodmversionzip"
                nnw      = $true
            }
            Start-Process @sourcemodzip
        }
        If (!$?) { 
            Get-WarnMessage 'Downloadfailed' 'SourceMod'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage "Downloaded" 'SourceMod'
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        clear-hostline 1
        Get-Infomessage "Extracting" 'SourceMod'
        $sourcemodzip = @{
            Path            = "$currentdir\$sourcemodmversionzip"
            DestinationPath = "$currentdir\$sourcemodmversionfolder"
            Force           = $true
        }
        Expand-Archive @sourcemodzip >$null 2>&1
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' 'SourceMod'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage "Extracted" 'SourceMod'
        }
        clear-hostline 1
        Get-Infomessage "copying-installing" 'SourceMod'
        If ($sourcemodmversionfolder -and $systemdir) { 
            $sourcemodaddons = @{
                Path        = "$currentdir\$sourcemodmversionfolder\addons"
                Destination = "$systemdir"
                Force       = $true
                Recurse     = $true
            }
            $sourcemodcfg = @{
                Path        = "$currentdir\$sourcemodmversionfolder\cfg"
                Destination = "$systemdir"
                Force       = $true
                Recurse     = $true
            }
            write-log "info: Copy $currentdir\$sourcemodmversionfolder\addons $systemdir"
            Copy-Item @sourcemodaddons >$null 2>&1
            write-log "info: Copy $currentdir\$sourcemodmversionfolder\cfg $systemdir"
            Copy-Item  @sourcemodcfg >$null 2>&1
        }
        If (!$?) { 
            Write-log "Failed: Copying SourceMod "
            New-TryagainNew 
        }
        Edit-Modlist 'Sourcemod' $sourcemodmversionzip
    }
}
Function Get-CSGOGet5 {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ( $csgoget5url -and $systemdir) {
        # This might work...
        $get5latestzip = $(($(iwr $csgoget5url).Links.href | ? { $_ -match "get5-" } | select-string -NotMatch /).Line)
        $get5latestdl = "https://ci.splewis.net/job/get5/lastSuccessfulBuild/artifact/builds/get5/$get5latestzip"
        If ($command -eq 'update-mods') {
            Compare-Modlist 'CSGO-Get5' $get5latestzip
        }
        If ($nomodupdate -eq $true) {
            # Write-log "($nomodupdate -eq $true)"
            clear-hostline 1
            Get-Infomessage "No CSGO-Get5 updates" 'info'
            return
        }
        Else {
            $start_time = Get-Date
            clear-hostline 1
            Get-Infomessage "Downloading" 'CSGO-Get5'  
            $get5zip = @{
                Uri     = "$get5latestdl"
                OutFile = "$currentdir\$get5latestzip"
            }
            Invoke-WebRequest @get5zip
        }
    }
    If (!$?) { 
        Get-WarnMessage 'Downloadfailed' 'CSGO-Get5'
        New-TryagainNew 
    }
    ElseIf ($?) {
        clear-hostline 1
        Get-Infomessage "Downloaded" 'CSGO-Get5' 
    }
    clear-hostline 1
    Get-Infomessage "downloadtime"
    $csgoget5folder = $currentdir, $($get5latestzip.Replace('.zip', '')) -join '\'
    $get5zip = @{
        Path            = "$currentdir\$get5latestzip"
        DestinationPath = "$csgoget5folder"
        Force           = $true
    }
    Expand-Archive @get5zip
    If (!$?) {
        Get-WarnMessage 'ExtractFailed' 'CSGO-Get5'
        New-TryagainNew 
    }
    ElseIf ($?) {
        clear-hostline 1
        Get-Infomessage "Extracted" 'CSGO-Get5'
    }
    clear-hostline 1
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
    Write-Log "info: Copy-Item $csgoget5folder\addons $systemdir"
    Copy-Item  @get5folderaddons >$null 2>&1
    Write-Log "info: Copy-item $csgoget5folder\cfg $systemdir"
    Copy-Item  @get5foldercfg >$null 2>&1
    If (!$?) { 
        Write-log "Failed: Copying CSGO-Get5 "
        New-TryagainNew 
    }
    Edit-Modlist 'CSGO-Get5' $get5latestzip
}
Function Get-CSGOcsgopugsetup {
    Write-log "Function: $($MyInvocation.Mycommand)"
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
        clear-hostline 1
        Get-Infomessage "No CSGO-pugsetup updates" 'info'
        return
    }
    Else {
        $start_time = Get-Date
        clear-hostline 1
        Get-Infomessage "Downloading" 'CSGO-pugsetup'
        iwr $githubrepoziplink -O $currentdir\$githubrepozipname
        If (!$?) { 
            Get-WarnMessage 'Downloadfailed' 'CSGO-pugsetup'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage "Downloaded" 'CSGO-pugsetup'    
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        $csgopugsetupfolder = $currentdir, $githubrepozipname.Replace('.zip', '') -join '\'
        $pugsetupzip = @{
            Path            = "$currentdir\$githubrepozipname"
            DestinationPath = "$csgopugsetupfolder"
            Force           = $true
        }
        Expand-Archive @pugsetupzip
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' 'CSGO-pugsetup'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage "Extracted" 'CSGO-pugsetup'
        }
        clear-hostline 1
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
        Write-Log "info: Copy $csgopugsetupfolder\addons $systemdir"
        Copy-Item  @pugsetupaddons >$null 2>&1
        Write-Log "info: Copy $csgopugsetupfolder\cfg $systemdir"
        Copy-Item  @pugsetupcfg >$null 2>&1
        If (!$?) { 
            Write-log "Failed: Copying CSGOcsgopugsetup "
            New-TryagainNew 
        }
        Edit-Modlist 'CSGO-pugsetup' $githubrepozipname
    }
}
Function Get-CSGOsteamworks {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($steamworksurl -and $systemdir) {
        $steamworkslatestzip = $( ($(iwr $steamworksurl).Links.href | select-string -SimpleMatch windows.zip | select -First 1 ).Line) 
        If ($command -eq 'update-mods') {
            Compare-Modlist 'SteamWorks' $steamworkslatestzip
        }
        If ($nomodupdate -eq $true) {
            clear-hostline 1
            Get-Infomessage "No SteamWorks updates" 'info'
            return
        }
        Else {
            $start_time = Get-Date
            clear-hostline 1
            Get-Infomessage "Downloading" 'SteamWorks'
            $steamworkszip = @{
                Uri     = "$steamworksurl$steamworkslatestzip"
                Outfile = "$currentdir\$steamworkslatestzip"
            }
            Invoke-WebRequest @steamworkszip
        }
    }
    If (!$?) { 
        Get-WarnMessage 'Downloadfailed' 'SteamWorks'
        New-TryagainNew 
    }
    ElseIf ($?) {
        clear-hostline 1
        Get-Infomessage "Downloaded" 'SteamWorks'  
    }
    clear-hostline 1
    Get-Infomessage "downloadtime"
    $steamworksfolder = $currentdir, $steamworkslatestzip -Replace '.zip', '' -join '\'
    $steamworkszip = @{
        Path            = "$currentdir\$steamworkslatestzip"
        DestinationPath = "$steamworksfolder"
        Force           = $true
    }
    Expand-Archive @steamworkszip
    If (!$?) {
        Get-WarnMessage 'ExtractFailed' 'SteamWorks'
        New-TryagainNew 
    }
    ElseIf ($?) {
        clear-hostline 1
        Get-Infomessage "Extracted" 'SteamWorks'
    }
    clear-hostline 1
    Get-Infomessage "copying-installing" 'SteamWorks'
    $steamworksaddon = @{
        Path        = "$steamworksfolder\addons"
        Destination = "$systemdir"
        Force       = $true
        Recurse     = $true
    }
    Write-Log "info: Copy-Item $steamworksfolder\addons $systemdir"
    Copy-Item @steamworksaddon >$null 2>&1
    If (!$?) { 
        Write-log "Failed: Copying SteamWorks "
        New-TryagainNew 
    }
    Edit-Modlist 'SteamWorks' $steamworkslatestzip
}
Function Get-AssettoServer {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ( $systemdir) {
        # iwr $csgopugsetupurl -O $githubrepozipname
        if ($AssettoServerowner -and $AssettoServersetuprepo) {
            Get-GithubRestAPI $AssettoServerowner $AssettoServersetuprepo
        }
    }
    If ($command -eq 'update-mods') {
        Compare-Modlist 'AssettoServer' $githubrepozipname
    }
    If ($nomodupdate -eq $true) {
        clear-hostline 1
        Get-Infomessage "No AssettoServer updates" 'info'
        return
    }
    Else {
        $start_time = Get-Date
        clear-hostline 1
        Get-Infomessage "Downloading" 'AssettoServer'
        iwr $githubrepoziplink -O $currentdir\$githubrepozipname
        If (!$?) { 
            Get-WarnMessage 'Downloadfailed' 'AssettoServer'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage "Downloaded" 'AssettoServer'    
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        $AssettoServerfolder = $currentdir, $githubrepozipname.Replace('.zip', '') -join '\'
        $AssettoServerZip = @{
            Path            = "$currentdir\$githubrepozipname"
            DestinationPath = "$AssettoServerfolder"
            Force           = $true
        }
        Expand-Archive @AssettoServerzip
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' 'AssettoServer'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage "Extracted" 'AssettoServer'
        }
        clear-hostline 1
        Get-Infomessage "copying-installing" 'AssettoServer'
        $AssettoServerfolder = @{
            Path        = "$AssettoServerfolder\*"
            Destination = "$systemdir"
            Force       = $true
            Recurse     = $true
        }
        Write-Log "info: Copy $AssettoServerfolder $systemdir"
        Copy-Item  @AssettoServerfolder >$null 2>&1
        If (!$?) { 
            Write-log "Failed: Copying AssettoServer "
            New-TryagainNew 
        }
        Edit-Modlist 'AssettoServer' $githubrepozipname
    }
}