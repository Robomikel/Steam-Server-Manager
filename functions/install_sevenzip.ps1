Function Add-Sevenzip {
    $start_time = Get-Date
    Write-Host '****   Downloading 7ZIP   ****' -F M -B Black 
    #(New-Object Net.WebClient).DownloadFile("$global:sevenzip", "$global:currentdir\7za920.zip")
    #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $global:sevenzip -OutFile $global:currentdir\7za920.zip
    If (!$?) {
        Write-Host "****   7Zip Download Failed   *****" -F Y -B Black
        New-TryagainNew 
    }
    If ($?) {
        Write-Host "****   7Zip  Download succeeded   ****" -F Y -B Black
    }
    Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '****   Extracting 7ZIP   *****' -F M -B Black 
    Expand-Archive "$global:currentdir\7za920.zip" "$global:currentdir\7za920\" -Force
    If (!$?) {
        Write-Host "****   7Zip files did not Extract   ****" -F Y -B Black
        New-TryagainNew 
    }
    If ($?) {
        Write-Host "****   7Zip Extract succeeded   ****" -F Y -B Black
    }
}