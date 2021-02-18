#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-MCBRBinaries {
    Write-log "Function: Get-MCBRBinaries"
    #################### MineCraftBedrock Install ################
    Get-MCBRWebrequest 
    Get-Infomessage "Downloading" 'Minecraft Bedrock'
    Invoke-WebRequest -uri $mcbrWebResponse.href -O bedrock-server.zip
    Get-Infomessage "Extracting" 'Minecraft Bedrock'
    Expand-Archive "bedrock-server.zip" "bedrock-server" -Force -ea SilentlyContinue
    Move-Item bedrock-server\* $serverfiles\ -Force -ea SilentlyContinue
    New-Item $serverfiles\version.txt -Force | Out-File -Append -Encoding Default  $ssmlog
    Add-Content $serverfiles\version.txt $mcbrWebResponse.href -Force
    Remove-Item bedrock-server -Recurse -Force -ea SilentlyContinue
    ##############################################################
}
Function Get-MCjavaBinaries {
    Write-log "Function: Get-MCjavaBinaries"
    #################### MineCraft Java Install ################
    java -version
        if ($?) {
            Get-MCWebrequest 
            $mcWebResponse = ((Invoke-WebRequest "https://www.minecraft.net/en-us/download/server" -UseBasicParsing ).Links | Where-Object { $_.href -like "https://launcher.mojang.com/v1/objects/*/server.jar" })
            Get-Infomessage  "Downloading" 'Minecraft Java'
            Invoke-WebRequest -uri $mcWebResponse.href -O server.jar 
            # $mcWebResponse.outerText
            # Expand-Archive "bedrock-server.zip" "bedrock-server" -Force -ea SilentlyContinue
            Move-Item server.jar $serverfiles\ -Force -ea SilentlyContinue
            New-Item $serverfiles\version.txt -Force | Out-File -Append -Encoding Default  $ssmlog
            Add-Content $serverfiles\version.txt $mcvWebResponse -Force
            Set-Location $ssmwd\$serverfiles
            If (!(Test-Path eula.txt )) {
                Start-Process CMD "/c start java -Xms1024M -Xmx1024M -jar server.jar nogui" -Wait
                Start-Sleep 3
                ((Get-Content -path eula.txt -Raw) -replace "false", "true") | Set-Content -Path eula.txt
            }
            Pop-Location -StackName cwd
            # Add-Content $serverfiles\eula.txt 'eula=true' -Force
            # Remove-Item bedrock-server -Recurse -Force -ea SilentlyContinue
            ##############################################################
        }
    Else {
        Write-log "Failed: Java not Installed"
        Write-Warning "Java not Installed" -WarningAction Stop
    }
}