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
                FilePath = $posh 
                Arg      = "Invoke-WebRequest $metamodlatestlisturl -O $currentdir\$metamodmversionzip"
                nnw      = $true
            }
            Start-Process @metamod
            If (!$?) { 
                clear-hostline 1
                Get-WarnMessage 'Downloadfailed' 'MetaMod'
            }
            ElseIf ($?) {
                clear-hostline 1
                Get-Infomessage 'Downloaded MetaMod' 'done'
            } 
            clear-hostline 1
            Get-Infomessage "downloadtime"

            If ($metamodmversionzip -and $metamodmversionfolder) {
                $metamodzip = @{
                    Path            = "$currentdir\$metamodmversionzip"
                    DestinationPath = "$currentdir\$metamodmversionfolder"
                    Force           = $true
                }
                clear-hostline 1
                Get-Infomessage "Extracting" 'MetaMod'
                Expand-Archive @metamodzip >$null 2>&1
            }
            If (!$?) { 
                clear-hostline 1
                Get-WarnMessage 'ExtractFailed' 'MetaMod'
                New-TryagainNew
            }
            ElseIf ($?) {
                clear-hostline 1
                Get-Infomessage 'Extracted MetaMod' 'done'
            } 
            Write-log "info: Moving/installing Meta Mod"
            If ($metamodmversionfolder -and $systemdir) { 
                $metamodfolder = @{
                    Path        = "$currentdir\$metamodmversionfolder\addons"
                    Destination = $systemdir
                    Force       = $true
                    # Recurse     = $true
                }
                Write-log "info: Move-Item $currentdir\$metamodmversionfolder\addons $systemdir" 
                Move-Item @metamodfolder >$null 2>&1
            }
            If (!$?) { 
                Write-log "Failed: Moving Meta Mod "
                New-TryagainNew 
            }
            ElseIf ($?) {
                clear-hostline 1
                Get-Infomessage 'copied-installed MetaMod' 'done'
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
                FilePath = $posh
                Arg      = "Invoke-WebRequest -Uri $sourcemodlatestlisturl -OutFile $currentdir\$sourcemodmversionzip"
                nnw      = $true
            }
            Start-Process @sourcemodzip
        }
        If (!$?) { 
            clear-hostline 1
            Get-WarnMessage 'Downloadfailed' 'SourceMod'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage 'Downloaded SourceMod' 'done'
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        $sourcemodzip = @{
            Path            = "$currentdir\$sourcemodmversionzip"
            DestinationPath = "$currentdir\$sourcemodmversionfolder"
            Force           = $true
        }
        clear-hostline 1
        Get-Infomessage "Extracting" 'SourceMod'
        Expand-Archive @sourcemodzip >$null 2>&1
        If (!$?) {
            clear-hostline 1
            Get-WarnMessage 'ExtractFailed' 'SourceMod'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage 'Extracted SourceMod' 'done'
        }
        clear-hostline 1
        Get-Infomessage "copying-installing" 'SourceMod'
        If ($sourcemodmversionfolder -and $systemdir) { 
            $sourcemodaddons = @{
                Path        = "$currentdir\$sourcemodmversionfolder\addons"
                Destination = "$systemdir"
                Force       = $true
                # Recurse     = $true
            }
            $sourcemodcfg = @{
                Path        = "$currentdir\$sourcemodmversionfolder\cfg"
                Destination = "$systemdir"
                Force       = $true
                # Recurse     = $true
            }
            write-log "info: Move $currentdir\$sourcemodmversionfolder\addons $systemdir"
            Move-Item @sourcemodaddons >$null 2>&1
            write-log "info: Move $currentdir\$sourcemodmversionfolder\cfg $systemdir"
            Move-Item  @sourcemodcfg >$null 2>&1
        }
        If (!$?) { 
            Write-log "Failed: Moving SourceMod "
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage 'copied-installed SourceMod' 'done'
        }
        Edit-Modlist 'Sourcemod' $sourcemodmversionzip
    }
}
Function Get-CSGOGet5 {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ( $csgoget5url -and $systemdir) {
        # This might work...
        $get5latestzip = $(($(Invoke-WebRequest $csgoget5url).Links.href | Where-Object { $_ -match "get5-" } | select-string -NotMatch /).Line)
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
        clear-hostline 1
        Get-WarnMessage 'Downloadfailed' 'CSGO-Get5'
        New-TryagainNew 
    }
    ElseIf ($?) {
        clear-hostline 1
        Get-Infomessage 'Downloaded CSGO-Get5' 'done'
    }
    clear-hostline 1
    Get-Infomessage "downloadtime"
    $csgoget5folder = $currentdir, $($get5latestzip.Replace('.zip', '')) -join '\'
    $get5zip = @{
        Path            = "$currentdir\$get5latestzip"
        DestinationPath = "$csgoget5folder"
        Force           = $true
    }
    clear-hostline 1
    Get-Infomessage "Extracting" 'CSGO-Get5'
    Expand-Archive @get5zip
    If (!$?) {
        clear-hostline 1
        Get-WarnMessage 'ExtractFailed' 'CSGO-Get5'
        New-TryagainNew 
    }
    ElseIf ($?) {
        clear-hostline 1
        Get-Infomessage 'Extracted CSGO-Get5' 'done'
    }
    clear-hostline 1
    Get-Infomessage 'copying-installing CSGO-Get5'
    $get5folderaddons = @{
        Path        = "$csgoget5folder\addons"
        Destination = "$systemdir"
        Force       = $true
        # Recurse     = $true
    }
    $get5foldercfg = @{
        Path        = "$csgoget5folder\cfg"
        Destination = "$systemdir"
        Force       = $true
        # Recurse     = $true
    }
    Write-Log "info: Move-Item $csgoget5folder\addons $systemdir"
    Move-Item  @get5folderaddons >$null 2>&1
    Write-Log "info: Move-Item $csgoget5folder\cfg $systemdir"
    Move-Item  @get5foldercfg >$null 2>&1
    If (!$?) { 
        Write-log "Failed: Moving CSGO-Get5 "
        New-TryagainNew 
    }
    ElseIf ($?) {
        clear-hostline 1
        Get-Infomessage 'copied-installed CSGO-Get5' 'done'
    }
    Edit-Modlist 'CSGO-Get5' $get5latestzip
}
Function Get-CSGOcsgopugsetup {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ( $systemdir) {
        # Invoke-WebRequest $csgopugsetupurl -O $githubrepozipname
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
        Invoke-WebRequest -Uri $githubrepoziplink -OutFile $currentdir\$githubrepozipname
        If (!$?) { 
            clear-hostline 1
            Get-WarnMessage 'Downloadfailed' 'CSGO-pugsetup'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage 'Downloaded CSGO-pugsetup' 'done'   
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        $csgopugsetupfolder = $currentdir, $githubrepozipname.Replace('.zip', '') -join '\'
        $pugsetupzip = @{
            Path            = "$currentdir\$githubrepozipname"
            DestinationPath = "$csgopugsetupfolder"
            Force           = $true
        }
        clear-hostline 1
        Get-Infomessage "Extracting" 'CSGO-pugsetup'
        Expand-Archive @pugsetupzip
        If (!$?) {
            clear-hostline 1
            Get-WarnMessage 'ExtractFailed' 'CSGO-pugsetup'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage 'Extracted CSGO-pugsetup' 'done'
        }
        clear-hostline 1
        Get-Infomessage "copying-installing" 'CSGO-pugsetup'
        $pugsetupaddons = @{
            Path        = "$csgopugsetupfolder\addons"
            Destination = "$systemdir"
            Force       = $true
            # Recurse     = $true
        }
        $pugsetupcfg = @{
            Path        = "$csgopugsetupfolder\cfg"
            Destination = "$systemdir"
            Force       = $true
            # Recurse     = $true
        }
        Write-Log "info: Move $csgopugsetupfolder\addons $systemdir"
        Move-Item  @pugsetupaddons >$null 2>&1
        Write-Log "info: Move $csgopugsetupfolder\cfg $systemdir"
        Move-Item  @pugsetupcfg >$null 2>&1
        If (!$?) { 
            Write-log "Failed: Moving CSGOcsgopugsetup "
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage 'copied-installed CSGO-pugsetup' 'done'
        }
        Edit-Modlist 'CSGO-pugsetup' $githubrepozipname
    }
}
Function Get-CSGOsteamworks {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($steamworksurl -and $systemdir) {
        $steamworkslatestzip = $( ($(Invoke-WebRequest $steamworksurl).Links.href | select-string -SimpleMatch windows.zip | Select-Object -First 1 ).Line) 
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
        clear-hostline 1
        Get-WarnMessage 'Downloadfailed' 'SteamWorks'
        New-TryagainNew 
    }
    ElseIf ($?) {
        clear-hostline 1
        Get-Infomessage 'Downloaded SteamWorks' 'done'  
    }
    clear-hostline 1
    Get-Infomessage "downloadtime"
    $steamworksfolder = $currentdir, $steamworkslatestzip -Replace '.zip', '' -join '\'
    $steamworkszip = @{
        Path            = "$currentdir\$steamworkslatestzip"
        DestinationPath = "$steamworksfolder"
        Force           = $true
    }
    clear-hostline 1
    Get-Infomessage "Extracting" 'SteamWorks'
    Expand-Archive @steamworkszip
    If (!$?) {
        clear-hostline 1
        Get-WarnMessage 'ExtractFailed' 'SteamWorks'
        New-TryagainNew 
    }
    ElseIf ($?) {
        clear-hostline 1
        Get-Infomessage 'Extracted SteamWorks' 'done'
    }
    clear-hostline 1
    Get-Infomessage "copying-installing" 'SteamWorks'
    $steamworksaddon = @{
        Path        = "$steamworksfolder\addons"
        Destination = "$systemdir"
        Force       = $true
        # Recurse     = $true
    }
    Write-Log "info: Move-Item $steamworksfolder\addons $systemdir"
    Move-Item @steamworksaddon >$null 2>&1
    If (!$?) { 
        Write-log "Failed: Moving SteamWorks "
        New-TryagainNew 
    }
    ElseIf ($?) {
        clear-hostline 1
        Get-Infomessage 'copied-installed SteamWorks' 'done'
    }
    Edit-Modlist 'SteamWorks' $steamworkslatestzip
}
Function Get-AssettoServer {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ( $systemdir) {
        # Invoke-WebRequest $csgopugsetupurl -O $githubrepozipname
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
        Invoke-WebRequest -Uri $githubrepoziplink -OutFile $currentdir\$githubrepozipname
        If (!$?) { 
            clear-hostline 1
            Get-WarnMessage 'Downloadfailed' 'AssettoServer'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage 'Downloaded AssettoServer' 'done'    
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        $AssettoServerfolder = $currentdir, $githubrepozipname.Replace('.zip', '') -join '\'
        $AssettoServerZip = @{
            Path            = "$currentdir\$githubrepozipname"
            DestinationPath = "$AssettoServerfolder"
            Force           = $true
        }
        clear-hostline 1
        Get-Infomessage "Extracting" 'AssettoServer'
        Expand-Archive @AssettoServerzip
        If (!$?) {
            clear-hostline 1
            Get-WarnMessage 'ExtractFailed' 'AssettoServer'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage 'Extracted AssettoServer' 'done'
        }
        clear-hostline 1
        Get-Infomessage "copying-installing" 'AssettoServer'
        $AssettoServerfolder = @{
            Path        = "$AssettoServerfolder\*"
            Destination = "$systemdir"
            Force       = $true
            # Recurse     = $true
        }
        Write-Log "info: Move $AssettoServerfolder $systemdir"
        Move-Item  @AssettoServerfolder >$null 2>&1
        If (!$?) { 
            Write-log "Failed: Moving AssettoServer "
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage 'copied-installed AssettoServer' 'done'
        }
        Edit-Modlist 'AssettoServer' $githubrepozipname
    }
}
Function Get-TShock {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ( $systemdir) {
        # Invoke-WebRequest $csgopugsetupurl -O $githubrepozipname
        if ($TShockowner -and $TShocksetuprepo) {
            Get-GithubRestAPI $TShockowner $TShocksetuprepo
        }
    }
    If ($command -eq 'update-mods') {
        Compare-Modlist 'TShock' $githubrepozipname
    }
    If ($nomodupdate -eq $true) {
        clear-hostline 1
        Get-Infomessage "No TShock updates" 'info'
        return
    }
    Else {
        $start_time = Get-Date
        clear-hostline 1
        Get-Infomessage "Downloading" 'TShock'
        Invoke-WebRequest -Uri $githubrepoziplink -OutFile $currentdir\$githubrepozipname
        If (!$?) { 
            clear-hostline 1
            Get-WarnMessage 'Downloadfailed' 'TShock'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage 'Downloaded TShock' 'done'   
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        $TShockfolder = $currentdir, $githubrepozipname.Replace('.zip', '') -join '\'
        $TShockZip = @{
            Path            = "$currentdir\$githubrepozipname"
            DestinationPath = "$TShockfolder"
            Force           = $true
        }
        clear-hostline 1
        Get-Infomessage "Extracting" 'TShock'
        Expand-Archive @TShockzip
        If (!$?) {
            clear-hostline 1
            Get-WarnMessage 'ExtractFailed' 'TShock'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage 'Extracted TShock' 'done'
        }
        clear-hostline 1
        Get-Infomessage "copying-installing" 'TShock'
        $TShockfolder = @{
            Path        = "$TShockfolder\*"
            Destination = "$systemdir"
            Force       = $true
            # Recurse     = $true
        }
        Write-Log "info: Move $TShockfolder $systemdir"
        Move-Item  @TShockfolder >$null 2>&1
        If (!$?) { 
            Write-log "Failed: Moving TShock "
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage 'copied-installed TShock' 'done'
        }
        Edit-Modlist 'TShock' $githubrepozipname
    }
}