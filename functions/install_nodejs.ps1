Function Add-NodeJS {
    $start_time = Get-Date
    Write-Host '****   Downloading  Nodejs   ****' -F M -B Black  
    #(New-Object Net.WebClient).DownloadFile("$global:nodejsurl", "$global:currentdir\node-v$global:nodeversion-win-x64.zip")
    #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $global:nodejsurl -OutFile $global:currentdir\node-v$global:nodeversion-win-x64.zip
    If (!$?) {
        Write-Host "****   Downloading  Nodejs Failed    ****" -F R -B Black 
        New-TryagainNew
    }
    If ($?) { 
        Write-Host "****   Downloading  Nodejs succeeded   ****" -F Y -B Black 
    }
    Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '****   Extracting Nodejs   *****' -F M -B Black
    Expand-Archive "$global:currentdir\node-v$global:nodeversion-win-x64.zip" "$global:currentdir\node-v$global:nodeversion-win-x64\" -Force
    If (!$?) {
        Write-Host "****   Extracting Nodejs Failed   ****" -F Y -B Black 
        New-TryagainNew
    }
    If ($?) { 
        Write-Host "****   Extracting Nodejs succeeded   ****" -F Y -B Black 
    }
    Set-Location $global:currentdir\node-v$global:nodeversion-win-x64\node-v$global:nodeversion-win-x64
    Write-Host '****   Installing gamedig in Nodejs   ****' -F M -B Black
    Write-Host '****   Do not stop or cancel! Will need to delete nodejs files and start over!   ****' -F Y -B Black  
    .\npm install gamedig
    .\npm install gamedig -g
    Set-Location $global:currentdir
}