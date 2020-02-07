Function Get-MCRcon {
    $start_time = Get-Date
    $path = "$global:currentdir\mcrcon\"
    $patha = "$global:currentdir\mcrcon\mcrcon-0.7.1-windows-x86-32\mcrcon.exe" 
    If ((Test-Path $path) -and (Test-Path $patha)) { 
        Write-Host '****   mcrcon already downloaded!   ****' -F Y -B Black
    } 
    Else {  
        install-mcrcon
    }
}