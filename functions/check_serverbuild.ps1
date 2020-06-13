#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-ServerBuildCheck {
    Write-log "Function: Get-ServerBuildCheck"
    If ($ssmlog -and $loggingdate) {
        If ($appid) {
            If ($appid -eq 11500000 ) { 
                Get-MCversion
                Write-log "Non-steam Game"
            }
            ElseIf ($appid -eq 11421000 ) { 
                Write-log "Non-steam Game"
                Get-MCbrversion
            }
            Else {
                If (($command -eq 'update') -or ($checkupdateonstart -eq "on")) {
                    Get-Steam
                    If ($steamdirectory) {
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
                            }
                            Else {
                                $localbuild = $false
                            }
                        }
                    }
                    #$localbuild
                    if (!$remotebuild ) {
                        Write-Warning 'Failed to retrieve remote build'
                        Write-log "Failed to retrieve remote build"
                    }
                    if (!$localbuild ) {
                        Write-Warning 'Failed to retrieve Local build'
                        Write-log "Failed to retrieve Local build"
                    }
                    Write-Information "RemoteBuild: $remotebuild" -InformationAction Continue
                    Write-Information "LocalBuild: $localbuild" -InformationAction Continue
                    If (($command -eq 'update') -or ($updateonstart -eq "on") ) {
                        If (Compare-Object $remotebuild.ToString() $localbuild.ToString()) {
                            
                            Get-Infomessage "availableupdates" 'update'
                            Get-SteamFix
                            #Get-StopServer
                            Get-UpdateServer  
                        }
                        Else {
                            Write-log "No $serverfiles Updates found"
                            
                            Get-Infomessage "noupdates" 'info'
                        }
                    }
                    Set-Location $currentdir
                }
                Else {
                    Write-log " Updates on start off"
                    Set-Location $currentdir
                }
            }
        }
        Else {
            Write-log "Failed: Get-ServerBuildCheck"
        }
    }
}


Function Get-SteamFix {
    Write-log "Function: Get-SteamFix"
    If ($ssmlog -and $loggingdate -and $appid -and $serverdir) {
        If (Test-Path "$serverdir\steamapps\appmanifest_$appid.acf") {
            Write-log "Removing appmanifest_$appid.acf "
            Remove-Item "$serverdir\steamapps\appmanifest_$appid.acf" -Force
            Write-log "Removing Multiple appmanifest_$appid.acf "
            Remove-Item "$serverdir\steamapps\appmanifest_$appid.acf" -Force
        }
    }
}