Function Get-MCRcon {
    $start_time = Get-Date
    $path = "$global:currentdir\mcrcon\"
    $patha = "$global:currentdir\mcrcon\mcrcon-0.7.1-windows-x86-32\mcrcon.exe" 
    If ((Test-Path $path) -and (Test-Path $patha)) { 
        Write-Host '****   mcrcon already downloaded!   ****' -F Y -B Black
    } 
    Else {  
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
}