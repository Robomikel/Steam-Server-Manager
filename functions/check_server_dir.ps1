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
                if (Test-Path "$executabledir\$executable.*") {
                    Write-log "info: Found Executable path"
                    if ($servercfg) {
                        if ($servercfgdir) {
                            if (Test-Path "$servercfgdir\$servercfg") {
                                Write-log "info: Found server config path"
                            }
                            Else {
                                Write-log "Warning: Check Variables-$serverfiles.ps1"
                                Write-log "Failed: Path $servercfgdir\$servercfg "
                                Get-Infomessage "Check Variables-$serverfiles.ps1" "warning"
                            }
                        }
                        Else {
                            Write-log "Warning: Check Variables-$serverfiles.ps1"
                            Write-log "Failed: Dir $servercfgdir"
                            Get-Infomessage "Check Variables-$serverfiles.ps1" "warning"
                        }
                    }
                }
                Else {
                    Write-log "Warning: Check Variables-$serverfiles.ps1"
                    Write-log "Failed: Path $executabledir\$executable "
                    Get-warnmessage "Check Variables-$serverfiles.ps1"
                }
            }
        }
        Else {
            Write-log "Warning: Check Variables-$serverfiles.ps1"
            Write-log "Failed: Dir $executabledir"
            Get-warnmessage "Check Variables-$serverfiles.ps1"
        }
    }
    Get-CheckSteamAPI
}
Function Get-CheckSteamAPI {
    If ($serverdir) {
        if (Test-Path $serverdir\steamclient.dll){
            if (Test-Path $serverdir\steamclient64.dll){
                if (Test-Path $serverdir\tier0_s.dll) {
                    if (Test-Path $serverdir\tier0_s64.dll) {
                        if (Test-Path $serverdir\vstdlib_s.dll ) {
                            if (Test-Path $serverdir\vstdlib_s64.dll) {
                                Write-log "info: Found Steam APIs DLLs"
                            }Else{
                                Write-log "Warning: Missing vstdlib_s64.dll in $serverdir"
                                clear-hostline 1
                                Get-Infomessage "Steam services maybe unavailable" "warning"
                            }
                        }Else{
                            Write-log "Warning: Missing vstdlib_s.dll is $serverdir"
                            clear-hostline 1
                            Get-Infomessage "Steam services maybe unavailable" "warning"
                        }
                    }Else{
                        Write-log "Warning: Missing tier0_s64.dll in $serverdir"
                        clear-hostline 1
                        Get-Infomessage "Steam services maybe unavailable" "warning"
                    }
                }Else{
                    Write-log "Warning: Missing tier0_s.dll in $serverdir"
                    clear-hostline 1
                    Get-Infomessage "Steam services maybe unavailable" "warning"
                }
            }Else{
                Write-log "Warning: Missing steamclient64.dll in $serverdir"
                clear-hostline 1
                Get-Infomessage "Steam services maybe unavailable" "warning"
            }
        }Else{
            Write-log "Warning: Missing steamclient.dll in $serverdir"
            clear-hostline 1
            Get-Infomessage "Steam services maybe unavailable" "warning"
        }
    }
}

