Function Get-UpdateSteamer {
    $start_time = Get-Date
    Write-Host '****   Downloading Steam-Server-Manager github files   ****' -F M -B Black 
    #(New-Object Net.WebClient).DownloadFile("$global:steamerurl", "$global:currentdir\steamer.zip")
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $global:steamerurl -OutFile $global:currentdir\Steam-Server-Manager.zip
    Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black 
    Remove-Item  "$global:currentdir\Steam-Server-Manager\*" -Recurse -Force -ea SilentlyContinue
    Remove-Item  "$global:currentdir\config-default\*" -Recurse -Force -ea SilentlyContinue
    Remove-Item  "$global:currentdir\data\*" -Recurse -Force -ea SilentlyContinue
    Remove-Item  "$global:currentdir\functions\*" -Recurse -Force -ea SilentlyContinue
    Remove-Item  "$global:currentdir\README.md*" -Recurse -Force -ea SilentlyContinue
    Remove-Item  "$global:currentdir\LICENSE*" -Recurse -Force -ea SilentlyContinue
    Expand-Archive "$global:currentdir\Steam-Server-Manager.zip" "$global:currentdir\Steam-Server-Manager" -Force
    Copy-Item  "$global:currentdir\Steam-Server-Manager\Steam-Server-Manager-master\*" -Destination "$global:currentdir\" -Recurse -Force
    Write-Host '****   Steamer github files Updated   ****' -F Y -B Black
    Write-Host '****   Press Enter to Close this session   ****' -F Y -B Black
    Pause  
    Stop-Process -Id $PID
}