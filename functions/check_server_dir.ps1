#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-FolderNames {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($ssmlog -and $loggingdate) {
        Write-log "info: Checking Folder Names "
        If ("$serverdir") {
            If (Test-Path "$serverdir") {
                Write-log "info: Folder Name Exists   $serverdir "
            }
            ElseIf (!(Test-Path "$serverdir")) {
                New-ServerFolderq
            }
        }
        ElseIf (!"$serverdir") {
            Get-warnmessage "fngetfoldersfailed"
        }
    }
}

Function New-LocalFolder {
    Write-log "Function: $($MyInvocation.Mycommand)" 
    $global:configlocal = "config-local"
    If (Test-Path $currentdir\$configlocal ) {
        Write-log "info: config-local Folder Already Created!   "
    }
    Else {
        Write-log "info: Creating: config-local Folder  "
        New-Item $currentdir -Name "$configlocal" -ItemType "directory" | Out-File -Append -Encoding Default  $ssmlog
        If (!$?) {
            Write-log "Failed: Creating config-local Folder  "
        }
    }
    New-defaultFolder
}

Function New-defaultFolder {
    Write-log "Function: $($MyInvocation.Mycommand)"  
    $global:configdefault = "config-default"
    If (Test-Path $currentdir\$configdefault) {
        Write-log "info: config-default Folder Already Created!   "
    }
    Else {
        Write-log "info: Creating: config-default Folder  "
        New-Item $currentdir -Name "$configdefault" -ItemType "directory" | Out-File -Append -Encoding Default  $ssmlog
        If (!$?) {
            Write-log "Failed: Creating config-default Folder  "
        }
    }
}
Function Test-Serverdir {
    Write-log "Function: $($MyInvocation.Mycommand)"
    if ($executabledir) {
        if (Test-path "$executabledir") {
            Write-log "info: Found Executable directory"
            if ($executable) {
                if ((Test-Path "$executabledir\$executable.*") -or (Test-Path "$executabledir\$executable.")) {
                    Write-log "info: Found Executable path"
                    if ($servercfg) {
                        if ($servercfgdir) {
                            if (Test-Path "$servercfgdir\$servercfg") {
                                Write-log "info: Found server config path"
                            }
                            Else {
                                Write-log "Warning: Check Variables-$serverfiles.ps1"
                                Write-log "Failed: server cfg Path $servercfgdir\$servercfg "
                                Get-Infomessage "Check Variables-$serverfiles.ps1" "warning"
                            }
                        }
                        Else {
                            Write-log "Warning: Check Variables-$serverfiles.ps1"
                            Write-log "Failed: Server cfg Dir $servercfgdir"
                            Get-Infomessage "Check Variables-$serverfiles.ps1" "warning"
                        }
                    }
                }
                Else {
                    Write-log "Warning: Check Variables-$serverfiles.ps1"
                    Write-log "Failed: Executable Path $executabledir\$executable "
                    Get-warnmessage "Check Variables-$serverfiles.ps1"
                }
            }
        }
        Else {
            Write-log "Warning: Check Variables-$serverfiles.ps1"
            Write-log "Failed: Executable Dir $executabledir"
            Get-warnmessage "Check Variables-$serverfiles.ps1"
        }
    }
    Get-CheckSteamAPI
}
Function Get-CheckSteamAPI {
    If ($APPID -ne 11421000 -and $APPID -ne 11500000 ) {
        If ($serverdir) {
            if ($executabledir) {
                if ((Test-Path $serverdir\steamclient.dll) -or (Test-Path $executabledir\steamclient.dll)) {
                    write-log "info: Found steamclient.dll"
                }
                Elseif ((Test-Path $serverdir\steamclient64.dll) -or (Test-Path $executabledir\steamclient64.dll)) {
                    write-log "info: Found steamclient64.dll"
                }
                Else {
                    Write-log "Warning: Missing steamclient.dll/steamclient64.dll"
                   # clear-hostline 1
                   # Get-Infomessage "Steam services maybe unavailable" "warning"
                }
                if ((Test-Path $executabledir\steamclient64.dll) -and (Test-Path $executabledir\$executable.exe)) {
                    write-log "info: Found steamclient64.dll in same dir as executable"
                }
                Elseif ((Test-Path $executabledir\steamclient.dll) -and (Test-Path $executabledir\$executable.exe)) {
                    write-log "info: Found steamclient.dll in same dir as executable"
                }
                Else {
                    write-log "Warning: steamclient.dll/steamclient64.dll not in same dir as executable"
                   # clear-hostline 1
                   # Get-Infomessage "Steam services maybe unavailable" "warning"
                }
                if ((Test-Path $serverdir\tier0_s.dll) -or (Test-Path $executabledir\tier0_s.dll)) {
                    write-log "info: Found tier0_s.dll"
                }
                Elseif ((Test-Path $serverdir\tier0_s64.dll) -or (Test-Path $executabledir\tier0_s64.dll)) {
                    write-log "info: Found tier0_s64.dll"
                }
                Else {
                    Write-log "Warning: Missing tier0_s.dll/tier0_s64.dll"
                   # clear-hostline 1
                   # Get-Infomessage "Steam services maybe unavailable" "warning"
                }
                if ((Test-Path $executabledir\tier0_s64.dll) -and (Test-Path $executabledir\$executable.exe)) {
                    write-log "info: Found tier0_s64.dll in same dir as executable"
                }
                Elseif ((Test-Path $executabledir\tier0_s.dll) -and (Test-Path $executabledir\$executable.exe)) {
                    write-log "info: Found tier0_s.dll in same dir as executable"
                }
                Else {
                    write-log "Warning: tier0_s.dll/tier0_s64.dll not in same dir as executable"
                   # clear-hostline 1
                   # Get-Infomessage "Steam services maybe unavailable" "warning"
                }
                if ((Test-Path $serverdir\vstdlib_s.dll) -or (Test-Path $executabledir\vstdlib_s.dll)) {
                    write-log "info: Found vstdlib_s.dll"
                }
                Elseif ((Test-Path $serverdir\vstdlib_s64.dll) -or (Test-Path $executabledir\vstdlib_s64.dll)) {
                    write-log "info: Found vstdlib_s64.dll"
                }
                Else {
                    Write-log "Warning: Missing vstdlib_s.dll/vstdlib_s64.dll"
                   # clear-hostline 1
                   # Get-Infomessage "Steam services maybe unavailable" "warning"
                }
                if ((Test-Path $executabledir\vstdlib_s64.dll) -and (Test-Path $executabledir\$executable.exe)) {
                    write-log "info: Found vstdlib_s64.dll in same dir as executable"
                }
                Elseif ((Test-Path $executabledir\vstdlib_s.dll) -and (Test-Path $executabledir\$executable.exe)) {
                    write-log "info: Found vstdlib_s.dll in same dir as executable"
                }
                Else {
                    write-log "Warning: vstdlib_s.dll/vstdlib_s64.dll not in same dir as executable"
                   # clear-hostline 1
                   # Get-Infomessage "Steam services maybe unavailable" "warning"
                }
            }
        }
    }
}