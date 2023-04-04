#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Forgeforge {
    $forgeversion = "*"
    $forgeWebResponse = ((Invoke-WebRequest "http://files.minecraftforge.net/" -UseBasicParsing).Links | Where-Object { $_.href -like "https://adfoc.us/serve/sitelinks/?id=271228&amp;url=https:///maven/net/minecraftforge/forge/$forgeversion/forge-$forgeversion-installer.jar" })
    $forgeWebResponse = $forgeWebResponse.href | Get-Unique
    $forgeWebResponse = $forgeWebResponse -replace ".*;url="
    $forgeWebResponse = $forgeWebResponse -replace 'https:///', 'https://files.minecraftforge.net/'
    # $forgeWebResponse
    Invoke-WebRequest -Uri $forgeWebResponse -OutFile forge-$forgeversion-installer.jar
    java -jar forge-$forgeversion-installer.jar --installServer
}
Function Get-InstallForge {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($forgeversion) {
        $forgeWebResponse = "https://files.minecraftforge.net/maven/net/minecraftforge/forge/$forgeversion/forge-$forgeversion-installer.jar"
        If ($command -eq 'update-mods') {
            Compare-Modlist 'Minecraft Forge' "forge-$forgeversion-installer.jar"
        }
        If ($nomodupdate -eq $true) {
            clear-hostline 1
            Get-Infomessage "No Minecraft Forge updates" 'info'
            return
        }
        clear-hostline 1
        Get-Infomessage "Downloading" 'Minecraft Forge' 'info'
        try { 
            Invoke-WebRequest -Uri $forgeWebResponse -OutFile $currentdir\forge-$forgeversion-installer.jar 
            If ($?) {
                clear-hostline 1
                Get-Infomessage "Downloading" 'Minecraft Forge'
            } 
        }
        catch { 
            Write-log "Warning: $($_.Exception.Message)" 
            Get-WarnMessage 'Downloadfailed' 'Minecraft Forge'
            New-TryagainNew 
        }
        Move-Item $currentdir\forge-$forgeversion-installer.jar $serverdir -Force -ea SilentlyContinue
        Push-location
        Set-Location $serverdir
        java -jar forge-$forgeversion-installer.jar --installServer
        Remove-Item forge-$forgeversion-installer.jar
        Rename-Item server.jar server.jar.bak
        Rename-Item forge-$forgeversion.jar server.jar
        Pop-Location
        Edit-Modlist 'Minecraft Forge' "forge-$forgeversion-installer.jar"
    }
}
