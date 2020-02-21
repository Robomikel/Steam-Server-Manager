#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-ServerBuildCheck {
    If (($appid -eq 11421000 ) -or ($appid -eq 11500000 )) { }Else {
        Get-Steam
        #Get-Steamtxt
        Set-Location $steamdirectory >$null 2>&1
        $search = "buildid"
        # public 
        #$remotebuild = Get-ServerBuild | select-string $search | Select-Object  -Index 0
        $remotebuild = .\steamCMD +app_info_update 1 +app_info_print $appid +quit | select-string $search | Select-Object  -Index 0

        #    # dev
        #    $remotebuild= .\steamcmd +runscript Buildcheck-$serverfiles.txt  | select-string $search | Select-Object  -Index 1
        #    # experimental
        #    $remotebuild= .\steamcmd +runscript Buildcheck-$serverfiles.txt  | select-string $search | Select-Object  -Index 2
        #    # hosting
        #    $remotebuild= .\steamcmd +runscript Buildcheck-$serverfiles.txt  | select-string $search | Select-Object  -Index 3
        $remotebuild = $remotebuild -replace '\s', ''
        #    #$remotebuild
        #  $search="buildid"
        $localbuild = get-content $serverdir\steamapps\appmanIfest_$appid.acf | select-string $search
        $localbuild = $localbuild -replace '\s', ''
        #$localbuild
        If (Compare-Object $remotebuild.ToString() $localbuild.ToString()) {
            Write-Host "****   Avaiable Updates Server   ****" -F Y -B Black
            If ($updateonstart -eq "off") { 
                Exit
                Set-Location $currentdir 
            }
            Get-SteamFix
            #Get-StopServer
            Get-UpdateServer  
        }
        Else {
            Write-Host "****   No $serverfiles Updates found   ****" -F Y -B Black
        }
        Set-Location $currentdir
    }
}

Function Get-SteamFix {
    Write-Host "****   Removing appmanifest_$appid.acf   ****" -F M -B Black
    Remove-Item $serverdir\steamapps\appmanifest_$appid.acf -Force  >$null 2>&1
    Write-Host "****   Removing Multiple appmanifest_$appid.acf    ****" -F M -B Black
    Remove-Item $serverdir\steamapps\appmanifest_*.acf -Force  >$null 2>&1
}