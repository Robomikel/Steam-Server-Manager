Function Get-NodeJS {
    $path = "$global:currentdir\node-v$global:nodeversion-win-x64\node-v$global:nodeversion-win-x64"
    $patha = "$global:currentdir\node-v$global:nodeversion-win-x64\node-v$global:nodeversion-win-x64\node.exe"
    $pathb = "node-v$global:nodeversion-win-x64.zip"
    Write-Host "****   Checking for Nodejs   ****" -F M -B Black     
    If ((Test-Path $path) -and (Test-Path $pathb) -and (Test-Path $patha)) { 
        Write-Host '****   NodeJS already downloaded!   ****' -F Y -B Black
    }
    Else {
        Write-Host "****   NodeJS not found   ****" -F Y -B Black
        Add-NodeJS
    }
}
