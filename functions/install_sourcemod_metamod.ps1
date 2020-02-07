Function Get-SourceMetaMod {
    $start_time = Get-Date
    Write-Host '****   Downloading Meta Mod   ****' -F M -B Black 
    #(New-Object Net.WebClient).DownloadFile("$global:metamodurl", "$global:currentdir\metamod.zip")
    #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $global:metamodurl -OutFile $global:currentdir\metamod.zip
    If (!$?) { 
        Write-Host "****   Downloading Meta Mod Failed !!   ****" -F R -B Black ; ; Exit 
    } 
    Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '****   Extracting Meta Mod   ****' -F M -B Black
    Expand-Archive "$global:currentdir\metamod.zip" "$global:currentdir\metamod\" -Force
    If (!$?) { 
        Write-Host "****   Extracting Meta Mod Failed !!   ****" -F R -B Black ; ; Exit 
    }
    Write-Host '****   Copying/installing Meta Mod   ****' -F M -B Black 
    Copy-Item  $global:currentdir\metamod\* -Destination $global:currentdir\$global:server\$global:MODDIR -Force -Recurse
    If (!$?) { 
        Write-Host "****   Copying Meta Mod Failed !!   ****" -F R -B Black ; ; Exit 
    }
    $start_time = Get-Date
    Write-Host '****   Downloading SourceMod   ****' -F M -B Black
    #(New-Object Net.WebClient).DownloadFile("$global:sourcemodurl", "$global:currentdir\sourcemod.zip")
    #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest -Uri $global:sourcemodurl -OutFile $global:currentdir\sourcemod.zip
    If (!$?) { 
        Write-Host "****   Downloading SourceMod Failed !!   ****" -F R -B Black ; ; Exit 
    } 
    Write-Host "Download Time:  $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
    Write-Host '****   Extracting SourceMod   ****' -F M -B Black 
    Expand-Archive "$global:currentdir\sourcemod.zip" "$global:currentdir\sourcemod\" -Force
    If (!$?) { 
        Write-Host "****   Extracting SourceMod Failed !!   ****" -F R -B Black ; ; Exit 
    }
    Write-Host '****   Copying/installing SourceMod   ****' -F M -B Black
    Copy-Item  $global:currentdir\sourcemod\* -Destination $global:currentdir\$global:server\$global:MODDIR -Force -Recurse
    If (!$?) { 
        Write-Host "****   Copying SourceMod Failed !!   ****" -F R -B Black ; ; Exit 
    }
}