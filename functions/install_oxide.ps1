#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Oxide {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($oxiderustowner -and $oxiderustrepo) {
        Get-GithubRestAPI $oxiderustowner $oxiderustrepo
        $oxideversion = ($githubrepoziplink).split('/')[7]
        $oxideoutput = "oxide" + '-' + "$oxideversion" + '.zip'
        $oxidedirectory = "$currentdir\oxide"
        $start_time = Get-Date
        If ($command -eq 'update-mods') {
            Compare-Modlist 'Oxide' "$oxideoutput"
        }
        If ($nomodupdate -eq $true) {
            clear-hostline 1
            Get-Infomessage "No Oxide updates" 'info'
            return
        }
        clear-hostline 1
        Get-Infomessage "Downloading" 'Oxide'
        #(New-Object Net.WebClient).DownloadFile("$oxiderustlatestlink", "$currentdir\oxide.zip")
        try {
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
            #Invoke-WebRequest -Uri $oxiderustlatestlink -OutFile $oxideoutput
            write-log "info: Invoke-WebRequest $githubrepoziplink -OutFile $currentdir\$githubrepozipname"
            Invoke-WebRequest -Uri $githubrepoziplink -OutFile $currentdir\$githubrepozipname
            If ($?) {
                clear-hostline 1
                Get-Infomessage "Downloaded" 'Oxide'
            }
        }
        catch {
            Write-log "Warning: $($_.Exception.Message)"
            Get-WarnMessage 'Downloadfailed' 'Oxide'
            New-TryagainNew
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        clear-hostline 1
        Get-Infomessage "Extracting" 'Oxide'
        Write-Log "info: Rename-Item $currentdir\$githubrepozipname $currentdir\$oxideoutput -Force"
        Rename-Item $currentdir\$githubrepozipname $currentdir\$oxideoutput -Force
        Write-log "info: Expand-Archive $currentdir\$oxideoutput $oxidedirectory -Force"
        Expand-Archive $currentdir\$oxideoutput $oxidedirectory -Force
        If (!$?) { 
            Get-WarnMessage 'ExtractFailed' 'Oxide'
            New-TryagainNew
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage "Extracted" 'Oxide'
        }
        clear-hostline 1
        Get-Infomessage "copying-installing" 'Oxide'
        Copy-Item  $currentdir\oxide\RustDedicated_Data\* -Destination $systemdir -Force -Recurse
        If (!$?) { 
            Write-log "Failed: Copying Oxide "
            New-TryagainNew
        }
        Edit-Modlist 'Oxide' $oxideoutput
    }
}

Function Get-undeadlegacy {
    Write-log "Function: $($MyInvocation.Mycommand)"
    # if ( "$env:Path" -notmatch "7za920") { $env:Path += ";$currentdir\\7za920" }
    If ( $systemdir) {
        $undeadurllatestzip = 'UndeadLegacy-master.zip'
        $undeadurllatestdl = "https://ul.subquake.com/dl?v=2.6.17"
        $start_time = Get-Date
        clear-hostline 1
        Get-Infomessage "Downloading" 'undead-legacy'
        $undeadurlzip = @{
            Uri     = "$undeadurllatestdl"
            OutFile = "$currentdir\$undeadurllatestzip"
        }
        Invoke-WebRequest @undeadurlzip
    }
    If (!$?) { 
        Get-WarnMessage 'Downloadfailed' 'undead-legacy'
        New-TryagainNew 
    }
    ElseIf ($?) {
        clear-hostline 1
        Get-Infomessage "Downloaded" 'undead-legacy'
    }
    clear-hostline 1
    Get-Infomessage "downloadtime"
    $undeadurlfolder = $currentdir, $($undeadurllatestzip.Replace('.zip', '')) -join '\'
    $undeadurlzip = @{
        Path            = "$currentdir\$undeadurllatestzip"
        DestinationPath = "$undeadurlfolder"
        Force           = $true
    }
    Expand-Archive @undeadurlzip
    # saps 7za -args("x -o$undeadurlfolder $currentdir\$undeadurllatestzip -r") -Wait
    If (!$?) {
        Get-WarnMessage 'ExtractFailed' 'undead-legacy'
        New-TryagainNew 
    }
    ElseIf ($?) {
        clear-hostline 1
        Get-Infomessage "Extracted" 'undead-legacy'
    }
    clear-hostline 1
    Get-Infomessage "copying-installing" 'undead-legacy'
    $undeadurlfolderaddons = @{
        Path        = "$undeadurlfolder\UndeadLegacyStable-main\*"
        Destination = "$serverdir"
        Force       = $true
        Recurse     = $true
    }
    Copy-Item  @undeadurlfolderaddons >$null 2>&1
    If (!$?) { 
        Write-log "Failed: Copying undead-legacy "
        New-TryagainNew 
    }
    Edit-Modlist 'undead-legacy' $undeadurllatestzip
}

Function Add-plugintolist {
    param($pluginname, $pluginfile)
    Write-log "Function: $($MyInvocation.Mycommand)"
    if (!$installedplugins) {
        Write-log "info: Create plugins object"
        #$installedplugins = @()
        $script:installedplugins = New-Object -TypeName psobject
    }
    # $installedplugins += New-Object pscustomobject -Property @{"$pluginname" = "$pluginfile" }
    Write-log "info: Add Object $pluginname = $pluginfile"
    $installedplugins | Add-Member -MemberType NoteProperty -Name $pluginname -Value $pluginfile
    
}
Function Get-installedplugins {    
    Write-log "Function: $($MyInvocation.Mycommand)"
    $installedpluginscount = Get-Content -Path $serverdir\plugins.json | select-string -SimpleMatch ".cs"
    if ($($pluginss.count) -ne $($installedpluginscount.count) ) {
        write-log "info: Plugin removed"
        Remove-item "$serverdir\plugins.json" -Force
    }
    If (Test-Path "$serverdir\plugins.json") {
        $script:installedplugins = Get-Content -Path $serverdir\plugins.json | ConvertFrom-Json
    }
    Else {
        Write-log "Warning: No $serverfiles\plugins.json found"
    }
}
Function New-pluginlist {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($plugins.plugins) {
        $plugins | ConvertTo-Json | Set-Content -Path $serverdir\plugins.json -Force
        Write-log "info: Edit plugins.plugins $($plugins.plugins) plugins.json"
    }
    ElseIf ($installedplugins.plugins) {
        $installedplugins | ConvertTo-Json | Set-Content -Path $serverdir\plugins.json -Force
        Write-log "info: Edit plugins.plugins $($installedplugins.plugins) plugins.json"
    }
    Else {
        $script:plugins = @{ plugins = $installedplugins };
        $plugins | ConvertTo-Json | Set-Content -Path $serverdir\plugins.json -Force
        Write-log "info: New $plugins plugins.json"
    }
}
Function Edit-pluginlist {
    Param($pluginname, $pluginfile)
    Write-log "Function: $($MyInvocation.Mycommand)"
    If (Test-Path $serverdir\plugins.json) {
        If ($installedplugins) {
            If ($installedplugins.plugins -like "*$pluginname*") {
                $installedplugins.plugins.$pluginname = "$pluginfile"
                write-log "info: Edit-Member $($installedplugins.plugins).$pluginname"
            }
            Else {
                if ($plugins.plugins) {
                    $plugins.plugins | Add-Member -MemberType NoteProperty -Name $pluginname -Value $pluginfile
                    write-log "info: Add-Member $($script:plugins.plugins)"
                }
                Else {
                    if ($installedplugins.plugins) {
                        $installedplugins.plugins | Add-Member -MemberType NoteProperty -Name $pluginname -Value $pluginfile
                        write-log "info: Add-Member $($script:installedplugins.plugins)"
                    }
                }
            }
        }
    }
    Else {
        Add-plugintolist $pluginname $pluginfile
    }
    New-pluginlist
}

Function Compare-pluginlist {
    Param($pluginname, $pluginfile)
    Write-log "Function: $($MyInvocation.Mycommand)"
    If (Test-Path $serverdir\plugins.json) {
        Get-installedplugins
        $installedplugins | ForEach-Object {
            ping-pluginversion $installedplugins.plugins 
        
        }
    }
}

Function Initialize-plugins {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $script:pluginss = Get-ChildItem $serverdir\oxide\plugins | Where-Object Name -like *.cs
    $pluginss |  ForEach-Object { 
        $script:plugin = ((Get-Content $_.FullName | select-string -SimpleMatch '[info(').Line -replace '\[info\(', '' -replace '\)\]', '') -split ',' -replace '\s', '' -replace '"', ''
        $script:pluginname = $_.Name
        $script:pluginversion = $plugin[2]
        Write-log "info: Current Version: $pluginname $pluginversion"
        Get-installedplugins
        Edit-pluginlist $pluginname $pluginversion
        ping-pluginversion $pluginname $pluginversion
    }
}

Function ping-pluginversion {
    param($pluginname, $pluginfile)
    Write-log "Function: $($MyInvocation.Mycommand)"
    [int]$version = $pluginfile.Split(".", 3)[2]
    $script:updatecheck = $version + 1
    $script:updatecheck = $pluginfile.Split(".", 3)[0] + '.' + $pluginfile.Split(".", 3)[1] + '.' + $updatecheck
    $Uri = "https://umod.org/plugins/" + "$pluginname" + "?version=$updatecheck"
    try {
        write-log "info: $pluginname $updatecheck"
        $update = Invoke-WebRequest $Uri
    }
    catch {
        $wr = $_
    }
    if ($update.StatusCode -eq 200) {
        Write-log "info: Plugin Update: $pluginname, $pluginfile"
        clear-hostline 1
        Get-Infomessage "Plugin Update: $pluginname" 'update'
        Receive-plugin $pluginname $pluginfile $updatecheck
    }
    ElseIf ($wr) {
        Write-log "info: Plugin: No update"
        clear-hostline 1
        Get-Infomessage "No Plugin Update: $pluginname"
    }
    $update = $null
    $wr = $null
}

Function Receive-plugin {
    param($pluginname, $pluginfile, $updatecheck)
    Write-log "Function: $($MyInvocation.Mycommand)"
    $Uri = "https://umod.org/plugins/" + "$pluginname" + "?version=$updatecheck"
    Invoke-WebRequest -Uri $Uri -OutFile $serverdir\oxide\plugins\$pluginname
    If (Test-Path $serverdir\oxide\plugins\$pluginname) {
        Write-log "info: $pluginname installed"
    }
    Else {
        Write-log "Failed: $pluginname "
    }
    Get-installedplugins
    Edit-pluginlist $pluginname $updatecheck
}

Function Get-BlackMesaSrcCoop {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($bmdmsrccoopowner -and $bmdmsrccooprepo ) {
        #(New-Object Net.WebClient).DownloadFile("$metamodurl", "$currentdir\metamod.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        #Invoke-WebRequest -Uri $bmdmsrccoopurl -OutFile $bmdmsrccoopoutput
        Get-GithubRestAPI $bmdmsrccoopowner $bmdmsrccooprepo
        Write-log "info: Downloading bmdmsrccoop from github" 
        $start_time = Get-Date
        clear-hostline 1
        Get-Infomessage "downloading" 'bmdmsrccoop'
        try { 
            Invoke-WebRequest -Uri $githubrepoziplink -OutFile $currentdir\$githubrepozipname 
            If ($?) {
                clear-hostline 1
                Get-Infomessage "downloaded" 'bmdmsrccoop'
                Write-log "info: bmdmsrccoop succeeded " 
            }
        }
        catch { 
            Write-log "Warning: $($_.Exception.Message)" 
            Write-Warning 'Downloading  bmdmsrccoop Failed'
            Write-log "Failed: Downloading  bmdmsrccoop"
            New-TryagainNew 
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        clear-hostline 1
        Get-Infomessage "Extracting" 'bmdmsrccoop'
        Expand-Archive $currentdir\$githubrepozipname $currentdir\$githubrepofolder -Force 
        Copy-Item  "$currentdir\$githubrepofolder\*" -Destination $systemdir -Recurse -Force 
        Remove-Item "$currentdir\$githubrepofolder" -Recurse -Force 
        If (!$?) {
            Write-Warning 'Extracting bmdmsrccoop Failed'
            Write-log "Failed: Extracting bmdmsrccoop " 
            New-TryagainNew 
        }
        ElseIf ($?) { 
            clear-hostline 1
            Get-Infomessage "Extracted" 'bmdmsrccoop'
            Write-log "info: Extracting bmdmsrccoop succeeded  "  
        }
    }
    Else {
        Write-log "Failed: install-bmdmsrccoop $bmdmsrccoopurl $githubrepozipname"
        Write-Warning 'fn_install-bmdmsrccoop Failed'
        Exit
    }
}
Function Get-GCServerConfTemplate  {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($gcserverconfowner -and $gcserverconfrepo ) {
        #(New-Object Net.WebClient).DownloadFile("$metamodurl", "$currentdir\metamod.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        #Invoke-WebRequest -Uri $bmdmsrccoopurl -OutFile $bmdmsrccoopoutput
        Get-GithubRestAPI $gcserverconfowner $gcserverconfrepo
        Write-log "info: Downloading GC-Server-Conf-Template from github" 
        $start_time = Get-Date
        clear-hostline 1
        Get-Infomessage "downloading" 'GC-Server-Conf-Template'
        try { 
            Invoke-WebRequest -Uri $githubrepoziplink -OutFile $currentdir\$githubrepozipname 
            If ($?) {
                clear-hostline 1
                Get-Infomessage "downloaded" 'GC-Server-Conf-Template'
                Write-log "info: GC-Server-Conf-Template succeeded " 
            }
        }
        catch { 
            Write-log "Warning: $($_.Exception.Message)" 
            Write-Warning 'Downloading  GC-Server-Conf-Template Failed'
            Write-log "Failed: Downloading  GC-Server-Conf-Template "
            New-TryagainNew 
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        clear-hostline 1
        Get-Infomessage "Extracting" 'GC-Server-Conf-Template'
        Expand-Archive $currentdir\$githubrepozipname $currentdir\$githubrepofolder -Force 
        Copy-Item  "$currentdir\$githubrepofolder\*" -Destination $servercfgdir -Recurse -Force 
        Remove-Item "$currentdir\$githubrepofolder" -Recurse -Force 
        If (!$?) {
            Write-Warning 'Extracting GC-Server-Conf-Template Failed'
            Write-log "Failed: Extracting GC-Server-Conf-Template " 
            New-TryagainNew 
        }
        ElseIf ($?) { 
            clear-hostline 1
            Get-Infomessage "Extracted" 'GC-Server-Conf-Template'
            Write-log "info: Extracting GC-Server-Conf-Template succeeded  "  
        }
    }
    Else {
        Write-log "install-GC-Server-Conf-Template Failed: $bmdmsrccoopurl $githubrepozipname"
        Write-Warning 'Failed: fn_install-GC-Server-Conf-Template '
        Exit
    }
}