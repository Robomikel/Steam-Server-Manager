Function Get-UpdateSteamer {
    $start_time = Get-Date
    Write-Host '****   Downloading Steam-Server-Manger github files   ****' -F M -B Black 
    #(New-Object Net.WebClient).DownloadFile("$global:steamerurl", "$global:currentdir\steamer.zip")
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $global:steamerurl -OutFile $global:currentdir\Steam-Server-Manger.zip
    Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black 
    Remove-Item  "$global:currentdir\Steam-Server-Manger\*" -Recurse -Force -ea SilentlyContinue
    Expand-Archive "$global:currentdir\Steam-Server-Manger.zip" "$global:currentdir\Steam-Server-Manger" -Force
    Copy-Item  "$global:currentdir\Steam-Server-Manger\Steam-Server-Manger-master\*" -Destination "$global:currentdir\" -Recurse -Force
    Write-Host '****   Steamer github files Updated   ****' -F Y -B Black
    Write-Host '****   Press Enter to Close this session   ****' -F Y -B Black
    Pause  
    Stop-Process -Id $PID
}