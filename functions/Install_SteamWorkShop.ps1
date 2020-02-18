Function Install-SteamWS {
    ######    Created by Archimedez   ######
    # https://steamcommunity.com/sharedfiles/filedetails/?id=939668540


    $StopOnFail = $false
    #path to your SteamCMD SE Workshop content folder
    $contentFolder = "$global:currentdir\steamcmd\steamapps\workshop\content\$global:reg_appID\"
    #path to your SE dedicated server mods folder
    $dediModsFolder = "$global:currentdir\$global:server\$global:WSMODDIR\"

    # download workshop content - requires user/pwd of steam account which owns SE game to get mods. 
    # Using WAIT because if we run async, steamCMD sometimes complains that it hasn't shut down properly, 
    # since it's running multiple sessions.
    $modCount = $global:wsmods.Count
    $ii = 0
    $modDownloadsGood = $true
    $updateMods = $null
    foreach ($mod in $global:wsmods) {
        $ii += 1
        Write-Host "Validating / Downloading mod $mod ($ii of $modCount)..." -ForegroundColor Yellow
        If ($global:ANON -eq "yes") {
            Set-Location $global:currentdir\steamcmd\
            Write-Host "Last Exit Code $LASTEXITCODE"-F Y
            .\steamCMD +login Anonymous +workshop_download_item $global:reg_appID $mod validate +quit
        }
        Else {
            Set-Location $global:currentdir\steamcmd\
            .\steamCMD +login $global:username +workshop_download_item $global:reg_appID $mod validate +quit
        }
        $updateMods = Get-Content $global:currentdir\log\ssm\Steamer-*.log
        if ($updateMods -like "Success. Downloaded item $mod to *") {
            # if (($?) -or ($LASTEXITCODE -eq 7)-or ($LASTEXITCODE -ne 10)) {
            Write-Host "Last Exit Code $LASTEXITCODE" -F Y
            Write-Host "Validation / Downloading mod $mod ($ii of $modCount) Complete." -ForegroundColor Y
            $updateMods = $null
        }
        else {
            Write-Host "Last Exit Code $LASTEXITCODE" -F Y
            Write-Host "Validation / Downloading mod $mod ($ii of $modCount) Failed! Please try running again." -ForegroundColor Red
            Write-Host " $global:DIAMOND May need to Sign into steamcmd or  Mod may be to large $global:DIAMOND" -ForegroundColor Red
            Write-Host " $global:DIAMOND Try Downloading through steam Client and Copy Manually. $global:DIAMOND" -ForegroundColor Red
            $updateMods = $null
            If ($StopOnFail -eq $true){$modDownloadsGood = $false
            break}
        }
        
        Start-Sleep -Seconds 1
    }

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
        Write-Host "Copying all mods to $global:currentdir\$global:server\$global:WSMODDIR\" -F Y
        robocopy $contentFolder $dediModsFolder /E /r:0
        # Copy-Item $contentFolder $dediModsFolder -Recurse -Force
        Write-Host "Copying completed." -F Y
        If ($global:AppID -eq 233780) {
            Write-Host "Copy text to Mod Var"
            get-childitem $global:currentdir\$global:server\$global:WSMODDIR\ | ForEach-Object {"Mods`\"+$_.name+";"}}
            Set-Location $global:currentdir
    }
}
