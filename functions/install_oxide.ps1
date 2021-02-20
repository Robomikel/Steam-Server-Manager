#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Oxide {
    Write-log "Function: Get-Oxide"
    If ($oxiderustlatestlink -and $oxideoutput) {
        $start_time = Get-Date
        If ($command -eq 'update-mods') {
            Compare-Modlist 'Oxide' "$oxideoutput"
        }
        If ($nomodupdate -eq $true) {
            Get-Infomessage "No Oxide updates" 'info'
            return
        }
        Get-Infomessage "Downloading" 'Oxide'
        #(New-Object Net.WebClient).DownloadFile("$oxiderustlatestlink", "$currentdir\oxide.zip")
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        Invoke-WebRequest -Uri $oxiderustlatestlink -OutFile $oxideoutput
        If (!$?) {
            Get-WarnMessage 'Downloadfailed' 'Oxide'
            New-TryagainNew
        }
        ElseIf ($?) {
            Get-Infomessage "Downloaded" 'Oxide'
        }
        Get-Infomessage "downloadtime"
        Get-Infomessage "Extracting" 'Oxide'
        Expand-Archive $oxideoutput $oxidedirectory -Force
        If (!$?) { 
            Get-WarnMessage 'ExtractFailed' 'Oxide'
            New-TryagainNew
        }
        ElseIf ($?) {
            Get-Infomessage "Extracted" 'Oxide'
        }
        Get-Infomessage "copying-installing" 'Oxide'
        Copy-Item  $currentdir\oxide\RustDedicated_Data\* -Destination $systemdir -Force -Recurse
        If (!$?) { 
            Write-log "Copying Oxide Failed"
            New-TryagainNew
        }
        Edit-Modlist 'Oxide' $oxideoutput
    }
}

Function Get-undeadlegacy {
    Write-log "Function: Get-undead-legacy"
    if ( "$env:Path" -notmatch "7za920") { $env:Path += ";$currentdir\\7za920" }
    If ( $systemdir) {
        $undeadurllatestzip = 'UndeadLegacy-master.zip'
        $undeadurllatestdl = "https://gitlab.com/Subquake/UndeadLegacy/-/archive/master/UndeadLegacy-master.zip"
        $start_time = Get-Date
        Get-Infomessage "Downloading" 'undead-legacy'
        $undeadurlzip = @{
            Uri     = "$undeadurllatestdl"
            OutFile = "$undeadurllatestzip"
        }
        Invoke-WebRequest @undeadurlzip
    }
    If (!$?) { 
        Get-WarnMessage 'Downloadfailed' 'undead-legacy'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Downloaded" 'undead-legacy'
    }
    Get-Infomessage "downloadtime"
    $undeadurlfolder = $currentdir, $($undeadurllatestzip.Replace('.zip', '')) -join '\'
    $undeadurlzip = @{
        Path            = "$undeadurllatestzip"
        DestinationPath = "$undeadurlfolder"
        Force           = $true
    }
    #Expand-Archive @undeadurlzip
    saps 7za -args("x -o$undeadurlfolder $undeadurllatestzip -r")
    If (!$?) {
        Get-WarnMessage 'ExtractFailed' 'undead-legacy'
        New-TryagainNew 
    }
    ElseIf ($?) {
        Get-Infomessage "Extracted" 'undead-legacy'
    }
    Get-Infomessage "copying-installing" 'undead-legacy'
    $undeadurlfolderaddons = @{
        Path        = "$undeadurlfolder\UndeadLegacy-master\*"
        Destination = "$serverdir"
        Force       = $true
        Recurse     = $true
    }
    Copy-Item  @undeadurlfolderaddons >$null 2>&1
    If (!$?) { 
        Write-log "Copying undead-legacy Failed "
        New-TryagainNew 
    }
    Edit-Modlist 'undead-legacy' $undeadurllatestzip
}

Function Add-plugintolist {
    param($pluginname, $pluginfile)
    Write-log "Function: Add-plugintolist"
    if (!$installedplugins) {
        Write-log "Create plugins object"
        #$installedplugins = @()
        $script:installedplugins = New-Object -TypeName psobject
    }
    # $installedplugins += New-Object pscustomobject -Property @{"$pluginname" = "$pluginfile" }
    Write-log "Add Object $pluginname = $pluginfile"
    $installedplugins | Add-Member -MemberType NoteProperty -Name $pluginname -Value $pluginfile
    
}
Function Get-installedplugins {    
    Write-log "Function: Get-installedplugins"
    $installedpluginscount = Get-Content -Path $serverdir\plugins.json | select-string -SimpleMatch ".cs"
    if ($($pluginss.count) -ne $($installedpluginscount.count) ) {
        write-log "Plugin removed"
        Remove-item "$serverdir\plugins.json" -Force
    }
    If (Test-Path "$serverdir\plugins.json") {
        $script:installedplugins = Get-Content -Path $serverdir\plugins.json | ConvertFrom-Json
    }
    Else {
        Write-log "No $serverfiles\plugins.json found"
    }
}
Function New-pluginlist {
    Write-Log "Function: New-pluginlist"
    If ($plugins.plugins) {
        $plugins | ConvertTo-Json | Set-Content -Path $serverdir\plugins.json -Force
        Write-log "Edit plugins.plugins $($plugins.plugins) plugins.json"
    }
    ElseIf ($installedplugins.plugins) {
        $installedplugins | ConvertTo-Json | Set-Content -Path $serverdir\plugins.json -Force
        Write-log "Edit plugins.plugins $($installedplugins.plugins) plugins.json"
    }
    Else {
        $script:plugins = @{ plugins = $installedplugins };
        $plugins | ConvertTo-Json | Set-Content -Path $serverdir\plugins.json -Force
        Write-log "New $plugins plugins.json"
    }
}
Function Edit-pluginlist {
    Param($pluginname, $pluginfile)
    Write-log "Function: Edit-pluginlist"
    If (Test-Path $serverdir\plugins.json) {
        If ($installedplugins) {
            If ($installedplugins.plugins -like "*$pluginname*") {
                $installedplugins.plugins.$pluginname = "$pluginfile"
                write-log "Edit-Member $($installedplugins.plugins).$pluginname"
            }
            Else {
                if ($plugins.plugins) {
                    $plugins.plugins | Add-Member -MemberType NoteProperty -Name $pluginname -Value $pluginfile
                    write-log "Add-Member $($script:plugins.plugins)"
                }
                Else {
                    if ($installedplugins.plugins) {
                        $installedplugins.plugins | Add-Member -MemberType NoteProperty -Name $pluginname -Value $pluginfile
                        write-log "Add-Member $($script:installedplugins.plugins)"
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
    Write-log "Function: Compare-pluginlist"
    If (Test-Path $serverdir\plugins.json) {
        Get-installedplugins
        $installedplugins | foreach {
            ping-pluginversion $installedplugins.plugins 
        
        }
    }
}

Function Initialize-plugins {
    Write-log "Function: Initialize-plugins"
    $script:pluginss = gci $serverdir\oxide\plugins | ? Name -like *.cs
    $pluginss |  foreach { 
        $script:plugin = ((gc $_.FullName | select-string -SimpleMatch '[info(').Line -replace '\[info\(', '' -replace '\)\]', '') -split ',' -replace '\s', '' -replace '"', ''
        $script:pluginname = $_.Name
        $script:pluginversion = $plugin[2]
        Write-log "Current Version: $pluginname $pluginversion"
        Get-installedplugins
        Edit-pluginlist $pluginname $pluginversion
        ping-pluginversion $pluginname $pluginversion
    }
}

Function ping-pluginversion {
    param($pluginname, $pluginfile)
    Write-log "Function: ping-pluginversion"
    [int]$version = $pluginfile.Split(".", 3)[2]
    $script:updatecheck = $version + 1
    $script:updatecheck = $pluginfile.Split(".", 3)[0] + '.' + $pluginfile.Split(".", 3)[1] + '.' + $updatecheck
    $Uri = "https://umod.org/plugins/" + "$pluginname" + "?version=$updatecheck"
    try {
        write-log "$pluginname $updatecheck"
        $update = iwr $Uri
    }
    catch {
        $wr = $_
    }
    if ($update.StatusCode -eq 200) {
        Write-log "Plugin Update: $pluginname, $pluginfile"
        Get-Infomessage "Plugin Update: $pluginname" 'update'
        Receive-plugin $pluginname $pluginfile $updatecheck
    }
    ElseIf ($wr) {
        Write-log "Plugin: No update"
        Get-Infomessage "No Plugin Update: $pluginname"
    }
    $update = $null
    $wr = $null
}

Function Receive-plugin {
    param($pluginname, $pluginfile, $updatecheck)
    write-log "Function: Receive-plugin "
    $Uri = "https://umod.org/plugins/" + "$pluginname" + "?version=$updatecheck"
    iwr $Uri -O $serverdir\oxide\plugins\$pluginname
    If (Test-Path $serverdir\oxide\plugins\$pluginname) {
        Write-log "$pluginname installed"
    }
    Else {
        Write-log "$pluginname failed"
    }
    Get-installedplugins
    Edit-pluginlist $pluginname $updatecheck
}