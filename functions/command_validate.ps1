Function Get-ValidateServer {
    Set-Location $global:currentdir\SteamCMD\ >$null 2>&1
    Get-Steamtxt
    Write-Host '****   Validating Server   ****' -F M -B Black
    #.\steamcmd +runscript Validate-$global:server.txt
    Install-validateServerFiles
    If ( !$? ) {
        Write-Host "****   Validating Server Failed   ****" -F R
        New-TryagainNew   
    }
    ElseIf ($?) {
        Write-Host "****   Validating Server succeeded   ****" -F Y
    }
    Set-Location $global:currentdir
}