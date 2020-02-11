
Function Install-ServerFiles {

    Set-Location $global:currentdir\steamcmd\
    If ($global:ANON -eq "yes") {
        .\steamCMD +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir $global:currentdir\$global:server +app_update $global:APPID $global:Branch +Exit
    }
    Else {
        Write-Host "Enter Username for Steam install" -F Cyan -B Black
        $global:username = Read-host
        .\steamCMD +@ShutdownOnFailedCommand 1 +login $global:username +force_install_dir $global:currentdir\$global:server +app_update $global:APPID $global:Branch +Exit
    }
    If (($?) -or ($LASTEXITCODE -eq 7)) {
        Write-Host "****   Downloading  Install server succeeded   ****" -F Y
        If ($global:command -ne "install") { 
            If ($global:DisableDiscordUpdate -eq "1") {
                New-DiscordAlert 
            }
        }
    }
    ElseIf (!$?) {
        Write-Host "****   Downloading  Install server Failed   ****" -F R
        New-TryagainNew 
    }

    Set-Location $global:currentdir
}
