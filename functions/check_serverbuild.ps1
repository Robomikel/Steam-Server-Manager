#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-ServerBuildCheck {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($ssmlog -and $loggingdate) {
        If ($appid) {
            If ($appid -eq 11500000 ) { 
                Get-MCversion
                Write-log "info: Non-steam Game"
            }
            ElseIf ($appid -eq 11421000 ) { 
                Write-log "info: Non-steam Game"
                Get-MCbrversion
            }
            Else {
                If (($command -eq 'update') -or ($checkupdateonstart -eq "on")) {
                    Get-Steam
                    If ($steamdirectory) {
                        Push-Location
                        Set-Location $steamdirectory
                        $search = "buildid"
                        # public
                        If ($sevenzipexecutable) {
                            $remotebuild = .\steamcmd +app_info_update 1 +app_info_print $appid +quit | select-string $search | Select-Object  -Index 0
                            #    # dev
                            #    $remotebuild= .\steamcmd +runscript Buildcheck-$serverfiles.txt  | select-string $search | Select-Object  -Index 1
                            #    # experimental
                            #    $remotebuild= .\steamcmd +runscript Buildcheck-$serverfiles.txt  | select-string $search | Select-Object  -Index 2
                            #    # hosting
                            #    $remotebuild= .\steamcmd +runscript Buildcheck-$serverfiles.txt  | select-string $search | Select-Object  -Index 3
                            $remotebuild = $remotebuild -replace '\s', ''
                            If (Test-Path "$serverdir\steamapps\appmanifest_$appid.acf") {
                                $localbuild = get-content "$serverdir\steamapps\appmanifest_$appid.acf" | select-string $search
                                $localbuild = $localbuild -replace '\s', ''
                                $localbuild = $localbuild[0]
                            }
                            Else {
                                $localbuild = $false
                            }
                        }
                        Pop-Location
                    }
                    #$localbuild
                    if (!$remotebuild ) {
                        Write-Warning 'Failed to retrieve remote build'
                        Write-log "Failed: to retrieve remote build"
                    }
                    if (!$localbuild ) {
                        Write-Warning 'Failed to retrieve Local build'
                        Write-log "Failed: to retrieve Local build"
                    }
                    clear-hostline 1
                    Write-Information "SteamDB: $remotebuild" -InformationAction Continue
                    Write-Information "LocalBuild: $localbuild" -InformationAction Continue
                    Write-Log "info: SteamDB: $remotebuild" -InformationAction Continue
                    Write-Log "info: LocalBuild: $localbuild" -InformationAction Continue
                    Start-Sleep -Seconds 2 
                    If (($command -eq 'update') -or ($updateonstart -eq "on") ) {
                        If (Compare-Object $remotebuild.ToString() $localbuild.ToString()) {
                            clear-hostline 2
                            Get-Infomessage "availableupdates" 'update'
                            Get-SteamFix
                            If ($stoponupdateonstart -eq "on") {
                            Get-StopServer
                            } 
                            Get-UpdateServer 
                        }
                        Else {
                            Write-log "info: No $serverfiles Updates found"
                            clear-hostline 2
                            Get-Infomessage "noupdates" 'info'
                        }
                    }
                }
                Else {
                    Write-log "info: Updates on start off"
                }
            }
        }
        Else {
            Write-log "Failed: Get-ServerBuildCheck"
        }
    }
}
Function Get-SteamFix {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($ssmlog -and $loggingdate -and $appid -and "$serverdir") {
        If ((Test-Path "$serverdir\steamapps\appmanifest_$appid.acf.bak") -and (!(Test-Path "$serverdir\steamapps\appmanifest_$appid.acf")) ) {
            Rename-Item "$serverdir\steamapps\appmanifest_$appid.acf.bak" "appmanifest_$appid.acf"  -Force -ErrorAction SilentlyContinue
            Write-log "info: Restore appmanifest_$appid.acf "
        }
        ElseIf (Test-Path "$serverdir\steamapps\appmanifest_$appid.acf") {
            Rename-Item "$serverdir\steamapps\appmanifest_$appid.acf" "appmanifest_$appid.acf.bak"  -Force -ErrorAction SilentlyContinue
            Write-log "info: Rename appmanifest_$appid.acf "
            If (Test-Path "$serverdir\steamapps\appmanifest_228980.acf") {
                Rename-Item "$serverdir\steamapps\appmanifest_228980.acf" "appmanifest_228980.acf.bak" -Force -ErrorAction SilentlyContinue
                Write-log "info: Rename Steamworks Common Redistributables appmanifest_228980.acf"
            }
        }
        ElseIf (!(Test-Path "$serverdir\steamapps\appmanifest_$appid.acf")) {
            Write-warning "No app Manifests found. Recommend Validate"
            Write-log "Warning: No app Manifests found. Recommend Validate"
        }
    }
}
