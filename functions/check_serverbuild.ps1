Function Get-ServerBuildCheck {
    Get-Steam
    #Get-Steamtxt
    Set-Location $global:currentdir\SteamCMD\ >$null 2>&1
    $search = "buildid"
    # public 
    #$remotebuild = Get-ServerBuild | select-string $search | Select-Object  -Index 0
    $remotebuild = .\steamCMD +app_info_update 1 +app_info_print $global:APPID +quit | select-string $search | Select-Object  -Index 0

    #    # dev
    #    $remotebuild= .\steamcmd +runscript Buildcheck-$global:server.txt  | select-string $search | Select-Object  -Index 1
    #    # experimental
    #    $remotebuild= .\steamcmd +runscript Buildcheck-$global:server.txt  | select-string $search | Select-Object  -Index 2
    #    # hosting
    #    $remotebuild= .\steamcmd +runscript Buildcheck-$global:server.txt  | select-string $search | Select-Object  -Index 3
    $remotebuild = $remotebuild -replace '\s', ''
    #    #$remotebuild
    #  $search="buildid"
    $localbuild = get-content $global:currentdir\$global:server\steamapps\appmanIfest_$global:APPID.acf | select-string $search
    $localbuild = $localbuild -replace '\s', ''
    #$localbuild
    If (Compare-Object $remotebuild.ToString() $localbuild.ToString()) {
        Write-Host "****   Avaiable Updates Server   ****" -F Y -B Black
        If ($global:AutoUpdate -eq "1") { Exit }
        Write-Host "****   Removing appmanifest_$global:APPID.acf   ****" -F M -B Black
        Remove-Item $global:currentdir\$global:server\steamapps\appmanifest_$global:APPID.acf -Force  >$null 2>&1
        Write-Host "****   Removing Multiple appmanifest_$global:APPID.acf    ****" -F M -B Black
        Remove-Item $global:currentdir\$global:server\steamapps\appmanifest_*.acf -Force  >$null 2>&1
        #Get-StopServer
        Get-UpdateServer  
    }
    Else {
        Write-Host "****   No $global:server Updates found   ****" -F Y -B Black
    }
    Set-Location $global:currentdir
}
