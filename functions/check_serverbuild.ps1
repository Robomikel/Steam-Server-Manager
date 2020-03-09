#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-ServerBuildCheck {
    If ($ssmlog -and $loggingdate) {
        If ($appid) {
            If ($appid -eq 11500000 ) { 
                Get-MCversion
                Add-Content $ssmlog "[$loggingdate] Non-steam Game"
            }
            ElseIf ($appid -eq 11421000 ) { 
                Add-Content $ssmlog "[$loggingdate] Non-steam Game"
                Get-MCbrversion
            }
            Else {
                Get-Steam
                If ($steamdirectory) {
                    Set-Location $steamdirectory
                    $search = "buildid"
                    # public
                    If ($sevenzipexecutable) {
                        $remotebuild = .\steamcmd +app_info_update 1 +app_info_print $appid +quit  | select-string $search | Select-Object  -Index 0
                        #    # dev
                        #    $remotebuild= .\steamcmd +runscript Buildcheck-$serverfiles.txt  | select-string $search | Select-Object  -Index 1
                        #    # experimental
                        #    $remotebuild= .\steamcmd +runscript Buildcheck-$serverfiles.txt  | select-string $search | Select-Object  -Index 2
                        #    # hosting
                        #    $remotebuild= .\steamcmd +runscript Buildcheck-$serverfiles.txt  | select-string $search | Select-Object  -Index 3
                        $remotebuild = $remotebuild -replace '\s', ''
                        If (Test-Path $appmanifest) {
                            $localbuild = get-content $appmanifest | select-string $search
                            $localbuild = $localbuild -replace '\s', ''
                        }Else{
                            $localbuild = $false
                        }
                    }
                }
                #$localbuild
                If (($command -eq 'update') -or ($checkupdateonstart -eq "on")) {
                    if (!$remotebuild ) {
                        Write-Warning 'Failed to retrieve remote build'
                        Add-Content $ssmlog "[$loggingdate] Failed to retrieve remote build"
                    }
                    if (!$localbuild ) {
                        Write-Warning 'Failed to retrieve Local build'
                        Add-Content $ssmlog "[$loggingdate] Failed to retrieve Local build"
                    }
                    Write-Information "RemoteBuild: $remotebuild" -InformationAction Continue
                    Write-Information "LocalBuild: $localbuild" -InformationAction Continue
                    If (($command -eq 'update') -or ($updateonstart -eq "on") ) {
                        If (Compare-Object $remotebuild.ToString() $localbuild.ToString()) {
                            $global:infomessage = "availableupdates"
                            Get-Infomessage
                            Get-SteamFix
                            #Get-StopServer
                            Get-UpdateServer  
                        }
                        Else {
                            Add-Content $ssmlog "[$loggingdate] No $serverfiles Updates found"
                            $global:infomessage = "noupdates"
                            Get-Infomessage
                        }
                    }
                    Set-Location $currentdir
                }
                Else {
                    Add-Content $ssmlog "[$loggingdate]  Updates on start off"
                    Set-Location $currentdir
                }
            }
        }
        Else {
            Add-Content $ssmlog "[$loggingdate] Failed: Get-ServerBuildCheck"
        }
    }
}


Function Get-SteamFix {
    If ($ssmlog -and $loggingdate -and $appid -and $serverdir) {
        If (Test-Path $appmanifest) {
            Add-Content $ssmlog "[$loggingdate] Removing appmanifest_$appid.acf "
            Remove-Item $appmanifest -Force
            Add-Content $ssmlog "[$loggingdate] Removing Multiple appmanifest_$appid.acf "
            Remove-Item $appmanifest -Force
        }
    }
}