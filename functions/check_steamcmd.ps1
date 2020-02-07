Function Get-Steamtxt {
    Write-Host "****   Check $global:server Steam runscripts txt   ****" -F Y -B Black
    $patha = "$global:currentdir\steamcmd\Validate-$global:server.txt"
    $pathb = "$global:currentdir\steamcmd\Updates-$global:server.txt"
    $pathc = "$global:currentdir\steamcmd\Buildcheck-$global:server.txt" 
    If ((Test-Path $patha) -and (Test-Path $pathb) -and (Test-Path $pathc)) {
        Write-Host '****   steamCMD Runscripts .txt Exist   ***' -F Y -B Black
    } 
    Else {  
        Write-Host "----------------------------------------------------------------------------" -F Y -B Black
        Write-Host "      $global:DIAMOND $global:DIAMOND Command $global:command Failed! $global:DIAMOND $global:DIAMOND" -F R -B Black
        Write-Host "***        Try install command again          ****  " -F Y -B Black
        Write-Host "----------------------------------------------------------------------------" -F Y -B Black
        Exit
    }
}