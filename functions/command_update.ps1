Function Get-UpdateServer {
    if ($global:DisableDiscordBackup -eq "1") {
        Set-Location $global:currentdir\SteamCMD\ >$null 2>&1
        Get-Steamtxt
        Write-Host '****   Updating Server   ****' -F M -B Black
        .\steamcmd +runscript Updates-$global:server.txt
    }
    If (($?) -or ($LASTEXITCODE -eq 7)) {
        Write-Host "****   Downloading  Install/update server succeeded   ****" -F Y
        If ($global:command -ne "install") { 
            If ($global:DisableDiscordUpdate -eq "1") {
                New-DiscordAlert 
            }
        }
    }
    ElseIf (!$?) {
        Write-Host "****   Downloading  Install/update server Failed   ****" -F R
        New-TryagainNew 
    }
    Set-Location $global:currentdir
}