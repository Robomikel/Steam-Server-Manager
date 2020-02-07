Function install-mcrcon {
    $start_time = Get-Date
    Write-Host '****   Downloading MCRCon from github   ****' -F M -B Black 
    #(New-Object Net.WebClient).DownloadFile("$global:metamodurl", "$global:currentdir\metamod.zip")
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $global:mcrconurl -OutFile $global:currentdir\mcrcon.zip
    If (!$?) {
        Write-Host "****   Downloading  MCRCon Failed   ****" -F R -B Black 
        New-TryagainNew 
    }
    If ($?) { 
        Write-Host "****   Downloading  MCRCon succeeded   ****" -F Y -B Black 
    }
    Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '****   Extracting MCRCon from github   ****' -F M -B Black
    Expand-Archive "$global:currentdir\mcrcon.zip" "$global:currentdir\mcrcon\" -Force
    If (!$?) {
        Write-Host "****   Extracting MCRCon Failed   ****" -F Y -B Black 
        New-TryagainNew 
    }
    If ($?) { 
        Write-Host "****   Extracting MCRCon succeeded   ****" -F Y -B Black 
    }
}