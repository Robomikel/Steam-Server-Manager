Function Get-SevenZip {
    $path = "$global:currentdir\7za920\"
    $patha = "$global:currentdir\7za920\7za.exe"
    $pathb = "$global:currentdir\7za920.zip"
    Write-Host '****   Checking for 7ZIP   *****' -F Y -B Black   
    If ((Test-Path $path) -and (Test-Path $patha) -and (Test-Path $pathb)) { 
        Write-Host '****   7Zip already downloaded!   ****' -F Y -B Black
    }
    Else {
        Write-Host "****   7Zip not found!   ****" -F Y -B Black
        Add-Sevenzip
    }  
}