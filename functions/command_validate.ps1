Function Get-ValidateServer {
    Set-Location $global:currentdir\SteamCMD\ >$null 2>&1
    #Get-Steamtxt
    Write-Host '****   Validate May Overwrite some config files   ****' -F R -B Black
    Write-Host '****   Run Install command again to update variables-$global:server.ps1  ****' -F Y -B Black
    Write-Host -NoNewLine 'Press any key to continue...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

    Write-Host '****   Validating Server   ****' -F M -B Black
    #.\steamcmd +runscript Validate-$global:server.txt
    If ($global:ANON -eq "yes") {
        .\steamCMD +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir $global:currentdir\$global:server +app_update $global:APPID $global:Branch validate +Exit
    }
    Else {
        .\steamCMD +@ShutdownOnFailedCommand 1 +login $global:username +force_install_dir $global:currentdir\$global:server +app_update $global:APPID $global:Branch validate +Exit
    }
    If ( !$? ) {
        Write-Host "****   Validating Server Failed   ****" -F R
        New-TryagainNew   
    }
    ElseIf ($?) {
        Write-Host "****   Validating Server succeeded   ****" -F Y
    }
    Set-Location $global:currentdir
}