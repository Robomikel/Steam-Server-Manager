Function Get-Oxide {
    $start_time = Get-Date
    Write-Host '****   Downloading Oxide   ****' -F M -B Black
    #(New-Object Net.WebClient).DownloadFile("$global:oxiderustlatestlink", "$global:currentdir\oxide.zip")
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $global:oxiderustlatestlink -OutFile $global:currentdir\oxide.zip
    If (!$?) { 
        Write-Host "****   Downloading Oxide Failed !!   ****" -F R -B Black ; ; Exit 
    } 
    Write-Host "Download Time: $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '****   Extracting Oxide    ****' -F M -B Black
    Expand-Archive "$global:currentdir\oxide.zip" "$global:currentdir\oxide\" -Force
    If (!$?) { 
        Write-Host "****   Extracting Oxide Failed !!   ****" -F R -B Black ; ; Exit 
    }

    Write-Host '****   Copying Oxide *****' -F M -B Black
    Copy-Item  $global:currentdir\oxide\$global:MODDIR\* -Destination $global:currentdir\$global:server\$global:MODDIR\ -Force -Recurse
    If (!$?) { 
        Write-Host "****   Copying Oxide Failed !!   ****" -F R -B Black ; ; Exit 
    }
}