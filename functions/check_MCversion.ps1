Function Get-MCbrversion{
    $localbuild = Get-Content $global:server\version.txt
    Get-MCBRWebrequest
    $remotebuild = $global:mcbrWebResponse.href
    If (Compare-Object $remotebuild.ToString() $localbuild.ToString()) {
        Write-Host "****   Avaiable Updates Server   ****" -F Green -B Black
        Write-Host "****   Try Install command to update files  ****" -F Y -B Black
    }Else{
        Write-Host "****   No $global:server Updates found   ****" -F Y -B Black
    }
}

Function Get-MCversion{
    $localbuild = Get-Content $global:server\version.txt
    Get-MCWebrequest
    $remotebuild = $global:mcvWebResponse
    If (Compare-Object $remotebuild.ToString() $localbuild.ToString()) {
        Write-Host "****   Avaiable Updates Server   ****" -F Green -B Black
        Write-Host "****   Try Install command to update files  ****" -F Y -B Black
    }Else{
        Write-Host "****   No $global:server Updates found   ****" -F Y -B Black
    }
}
