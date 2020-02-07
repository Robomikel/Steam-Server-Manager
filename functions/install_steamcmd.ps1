Function Get-Steam {
    $start_time = Get-Date
    $path = "$global:currentdir\steamcmd\"
    $patha = "$global:currentdir\steamcmd\steamcmd.exe" 
    If ((Test-Path $path) -and (Test-Path $patha)) { 
        Write-Host '****   steamCMD already downloaded!   ****' -F Y -B Black
    } 
    Else {  
        #(New-Object Net.WebClient).DownloadFile("$global:steamurl", "steamcmd.zip")
        Write-Host '****   Downloading SteamCMD   ****' -F M -B Black
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;  
        Invoke-WebRequest -Uri $global:steamurl -OutFile $global:steamoutput
        If (!$?) {
            Write-Host " ****   Downloading  SteamCMD Failed   ****" -F R -B Black 
            New-TryagainNew 
        }
        If ($?) { Write-Host " ****   Downloading  SteamCMD succeeded    ****" -F Y -B Black }
        Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
        Write-Host '***   Extracting SteamCMD *****' -F M -B Black 
        Expand-Archive "$global:currentdir\steamcmd.zip" "$global:currentdir\steamcmd\" -Force 
        If (!$?) {
            Write-Host " ****   Extracting SteamCMD Failed    ****" -F Y -B Black 
            New-TryagainNew 
        }
        If ($?) { Write-Host " ****   Extracting SteamCMD succeeded    ****" -F Y -B Black }
    }