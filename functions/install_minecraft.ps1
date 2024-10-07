#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-MCBRBinaries {
    Write-log "Function: $($MyInvocation.Mycommand)"
    #################### MineCraftBedrock Install ################
    Get-MCBRWebrequest 
    Get-Infomessage "Downloading" 'Minecraft Bedrock'
    Invoke-WebRequest -uri $mcbrWebResponse.href -O $currentdir\bedrock-server.zip
    Get-Infomessage "Extracting" 'Minecraft Bedrock'
    Expand-Archive $currentdir\bedrock-server.zip $currentdir\bedrock-server -Force -ea SilentlyContinue
    Move-Item $currentdir\bedrock-server\* $serverdir -Force -ea SilentlyContinue
    New-Item $serverdir\version.txt -Force | Out-File -Append -Encoding Default  $ssmlog
    Add-Content $serverdir\version.txt $mcbrWebResponse.href -Force
    Remove-Item bedrock-server -Recurse -Force -ea SilentlyContinue
    ##############################################################
}
Function Get-MCjavaBinaries {
    Write-log "Function: $($MyInvocation.Mycommand)"
    #################### MineCraft Java Install ################
    java -version
    if ($?) {
        #Get-MCWebrequest 
        $mcversion = "1.21.1"
        If ($mcversion) {
            $defaultmcversion = "$mcversion"
            If (($mcversion = Read-Host -P(Write-Host "Enter Minecraft Version, Press Enter to Accept default [$mcversion]: "-F CY -N )) -eq '') { $mcversion = "$defaultmcversion" }Else { $mcversion }
        }
        # Can no longer scrape the offical site.
        # $mcWebResponse = ((Invoke-WebRequest "https://www.minecraft.net/en-us/download/server" -UseBasicParsing ).Links | Where-Object { $_.href -like "https://launcher.mojang.com/v1/objects/*/server.jar" })
        
        # $mcversionrequest = Invoke-WebRequest "https://mcversions.net/" -UseBasicParsing
        # $mcdownloadversion = $mcversionrequest.links.href |  where {$_ -like '*download/[1-9].[1-9].[1-9]' -and $_ -like "*$mcversion" }
        # $mcurlrequest = iwr "https://mcversions.net" + $mcdownloadversion -UseBasicParsing    
        $url = $("https://mcversions.net/download/" + $mcversion)
        try {
            $mcurlrequest = Invoke-WebRequest -Uri "$url" -UseBasicParsing
        }
        catch {
            write-log "Warning: $_"
        }
        $mcdownloadurl = $mcurlrequest.Links.href -like '*server.jar*'
        try {
            Get-Infomessage  "Downloading" 'Minecraft Java'
            Invoke-WebRequest -uri "$mcdownloadurl" -O $currentdir\server.jar
        }
        catch {
            Write-log "Warning: $_"
        }
        Move-Item $currentdir\server.jar $serverdir -Force -ea SilentlyContinue
        New-Item $serverdir\version.txt -Force | Out-File -Append -Encoding Default  $ssmlog
        Add-Content $serverdir\version.txt $mcversion -Force
        Push-location
        Set-Location $serverdir
        If (!(Test-Path eula.txt )) {
            Start-Process CMD "/c start java -Xms1024M -Xmx1024M -jar server.jar nogui" -Wait
            Start-Sleep 15
                ((Get-Content -path eula.txt -Raw) -replace "false", "true") | Set-Content -Path eula.txt
        }
        Pop-Location
        ##############################################################
    }
    Else {
        Write-log "Failed: Java not Installed"
        Write-Warning "Java not Installed" -WarningAction Stop
    }
}
Function Get-MCBRWebrequest {
    Write-log "Function: $($MyInvocation.Mycommand)"
    # get latest download
    try {
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        $global:mcbrWebResponse = ((Invoke-WebRequest "https://www.minecraft.net/en-us/download/server/bedrock" -UseBasicParsing).Links | Where-Object { $_.href -like "https://minecraft.azureedge.net/bin-win/*" })
        if ($?) {
            # Get-Infomessage "Downloaded" 'SteamCMD'
        }
    }
    catch {
        If (!$? -or !$mcbrWebResponse) {
            Write-log "Warning: $($_.Exception.Message)"
            Write-log "Failed: Get-MCBRWebrequest"
            Exit
        }
    }
}
Function Get-MCWebrequest {
    Write-log "Function: $($MyInvocation.Mycommand)"
    # check latest version
    try {
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        $mcvWebResponse = Invoke-WebRequest "https://launchermeta.mojang.com/mc/game/version_manifest.json" -UseBasicParsing | ConvertFrom-Json
        $global:mcvWebResponse = $mcvWebResponse.Latest.release
    }
    catch {
        If (!$? -or !$mcvWebResponse) {
            Write-log "Failed: Get-MCWebrequest"
            Exit
        }
    }
}
