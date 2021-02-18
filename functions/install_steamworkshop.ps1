Function Install-SteamWS {
    Write-log "Function: Install-SteamWS"
    ######    Created by Archimedez   ######
    # https://steamcommunity.com/sharedfiles/filedetails/?id=939668540
    ######    Modified by Robomikel for SSM use   ######
    # Stop On Failed Download
    $StopOnFail = $false
    # path to your SteamCMD SE Workshop content folder
    $contentFolder = "$ssmwd\steamcmd\steamapps\workshop\content\$reg_appID\"
    # download workshop content - requires user/pwd of steam account which owns SE game to get mods. 
    # Using WAIT because if we run async, steamCMD sometimes complains that it hasn't shut down properly, 
    # since it's running multiple sessions.
    $modCount = $wsmods.Count
    $ii = 0
    $modDownloadsGood = $true
    $updateMods = $null
    Write-Host  "####-   Steamcmd intial Test Login   -#####" -F C 
    Write-Host "Enter Steam Username for Workshop install" -F Cyan -B Black
    $username = Read-host
    Write-Host "Enter steam password" -F Cyan -B Black
    $securedpassword = Read-Host -AsSecureString
    $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securedpassword)
    $password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)
    If ($steamdirectory -and $username -and $password) {
        Set-Location $steamdirectory
        .\steamCMD +login $username $password +quit
        New-TryagainSteamLogin
    }
    Else {
        Exit
    }
    If ($moddir -and $reg_appID -and $wsmods) {
        foreach ($mod in $wsmods) {
            $ii += 1
            Write-Host "Validating / Downloading mod $mod ($ii of $modCount)..." -ForegroundColor Yellow
            Set-Location $steamdirectory
            .\steamCMD +login $username $password +workshop_download_item $reg_appID $mod validate +quit | Out-File $ssmlogdir\wsmod.log
            $updateMods = Get-Content $ssmlogdir\wsmod.log
            if ($updateMods -like "Success. Downloaded item $mod to *") {
                Write-Host "Validation / Downloading mod $mod ($ii of $modCount) Complete." -ForegroundColor Y
                $updateMods = $null
            }
            else {
                Write-Host "Validation / Downloading mod $mod ($ii of $modCount) Failed! Please try running again." -ForegroundColor Red
                Write-Host " - - $DIAMOND The Workshop Item may be too large for steamcmd - -  $DIAMOND" -ForegroundColor Red
                Write-log "Validation / Downloading mod $mod ($ii of $modCount) Failed! Please try running again."
                Write-log "download through steam Client and Copy Manually"
                $updateMods = $null
                If ($StopOnFail -eq $true) {
                    $modDownloadsGood = $false
                    break
                }
            }
            Start-Sleep -Seconds 1
        }
    }Else{Exit}
    #if Mod downloads are good, then copy over. If any were bad, we stop.
    if ($modDownloadsGood -eq $true) {
        #rename mods from .bin to .sbm so that SE will recognize and load them
        $modFolders = Get-ChildItem $contentFolder -ErrorAction SilentlyContinue
        $ii = 0
        foreach ($modFolder in $modFolders) {
            $ii += 1
            $modFolderContents = Get-ChildItem $modFolder.FullName
            foreach ($modfile in $modFolderContents) {
                if ($modfile -like "*_legacy.bin") {
                    [string]$modfileName = $modFolder.FullName + "\" + $modFolder.Name + ".sbm"
                    #if renamed file exists, and bin file exists, mod was updated, so Remove-Itemete old renamed file
                    Remove-Item $modfileName -ea SilentlyContinue 
                    Start-Sleep -Seconds 1
                    Rename-Item -LiteralPath $modfile.FullName -NewName "$modFolder.sbm" 
                }
            }
        }
        #pause for 5 sec to ensure file operations are done before continuing
        Start-Sleep -Seconds 5 
        #copy over mods to the SE dedicated server mods folder from SE workshop content download storage folder
        Write-Host "Copying all mods to $moddir" -F Y
        If ($AppID -eq 443030) {
         gci $contentFolder | foreach ($_.Name) {$wsname = $_.Name ;  robocopy $contentFolder\$wsname $moddir /E /r:0 /log:$ssmlogdir\WScopy-$serverfiles-$date.log  }
        } 
        Else {
            robocopy $contentFolder $moddir /E /r:0 /log:$ssmlogdir\WScopy-$serverfiles-$date.log
        }
        Write-Host "Copying completed." -F Y
        # If ($AppID -eq 233780) {
        #     Write-Host "Copy text to Mod Var" -F Y
        #     get-childitem $moddir | ForEach-Object { "Mods`\" + $_.name + ";" }
        #    }
        If ($AppID -eq 443030) {
            $modfiletext = "$moddir\modlist.txt"
            Write-Host "Copy text to $modfiletext" -F Y
            gci $moddir\*.pak | ForEach-Object { Add-content $modfiletext ("*" + $_.Name) -Force }
        }
    }
    Pop-Location -StackName cwd
}