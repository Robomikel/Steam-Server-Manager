Function Get-Forgeforge {
    $global:forgeversion = "*"
    $global:forgeWebResponse = ((Invoke-WebRequest "http://files.minecraftforge.net/").Links | Where-Object { $_.href -like "https://adfoc.us/serve/sitelinks/?id=271228&amp;url=https:///maven/net/minecraftforge/forge/$global:forgeversion/forge-$global:forgeversion-installer.jar" })
    $global:forgeWebResponse = $global:forgeWebResponse.href | Get-Unique
    $global:forgeWebResponse = $global:forgeWebResponse -replace ".*;url="
    $global:forgeWebResponse = $global:forgeWebResponse -replace 'https:///', 'https://files.minecraftforge.net/'
    # $global:forgeWebResponse
    Invoke-WebRequest -Uri $global:forgeWebResponse -OutFile forge-$global:forgeversion-installer.jar
    java -jar forge-$global:forgeversion-installer.jar --installServer
}
Function Get-InstallForge {

    $global:forgeWebResponse = "https://files.minecraftforge.net/maven/net/minecraftforge/forge/$global:forgeversion/forge-$global:forgeversion-installer.jar"
    Invoke-WebRequest -Uri $global:forgeWebResponse -OutFile forge-$global:forgeversion-installer.jar
    Move-Item forge-$global:forgeversion-installer.jar $global:currentdir\$global:server -Force -ea SilentlyContinue
    Set-Location $global:currentdir\$global:server
    java -jar forge-$global:forgeversion-installer.jar --installServer
    Remove-Item forge-$global:forgeversion-installer.jar
    Rename-Item server.jar server.jar.bak
    Rename-Item forge-$global:forgeversion.jar server.jar
    Set-Location $global:currentdir
}