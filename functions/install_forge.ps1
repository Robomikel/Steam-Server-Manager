Function Get-Forgeforge {
    $forgeversion = "*"
    $global:forgeWebResponse = ((Invoke-WebRequest "http://files.minecraftforge.net/").Links | Where-Object { $_.href -like "https://adfoc.us/serve/sitelinks/?id=271228&amp;url=https:///maven/net/minecraftforge/forge/$forgeversion/forge-$forgeversion-installer.jar" })
    $global:forgeWebResponse = $global:forgeWebResponse.href | Get-Unique
    $global:forgeWebResponse = $global:forgeWebResponse -replace ".*;url="
    $global:forgeWebResponse = $global:forgeWebResponse -replace 'https:///', 'https://files.minecraftforge.net/'
    # $global:forgeWebResponse
    Invoke-WebRequest -Uri $global:forgeWebResponse -OutFile forge-$forgeversion-installer.jar
    java -jar forge-$forgeversion-installer.jar --installServer
}
Function Get-InstallForge {
    $forgeversion = "1.15.2-31.1.2"
    $global:forgeWebResponse = "https://files.minecraftforge.net/maven/net/minecraftforge/forge/$forgeversion/forge-$forgeversion-installer.jar"
    Invoke-WebRequest -Uri $global:forgeWebResponse -OutFile forge-$forgeversion-installer.jar
    Move-Item forge-$forgeversion-installer.jar $global:currentdir\$global:server -Force -ea SilentlyContinue
    Set-Location $global:currentdir\$global:server
    java -jar forge-$forgeversion-installer.jar --installServer
    Remove-Item forge-$forgeversion-installer.jar
    Rename-Item server.jar server.jar.bak
    Rename-Item forge-$forgeversion.jar server.jar
    Set-Location $global:currentdir
}