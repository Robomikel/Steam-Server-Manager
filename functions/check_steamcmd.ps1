Function Get-Steam {
    $start_time = Get-Date
    $path = "$global:currentdir\steamcmd\"
    $patha = "$global:currentdir\steamcmd\steamcmd.exe" 
    If ((Test-Path $path) -and (Test-Path $patha)) { 
        Write-Host '****   steamCMD already downloaded!   ****' -F Y -B Black
    } 
    Else {  
        Install-Steam
    }
}    