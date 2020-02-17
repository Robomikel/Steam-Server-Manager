Function Get-MCBRBinaries{
        
    #################### MineCraftBedrock Install ################
    Get-MCBRWebrequest 
    Invoke-WebRequest -uri $global:mcbrWebResponse.href -O bedrock-server.zip
    Expand-Archive "bedrock-server.zip" "bedrock-server" -Force -ea SilentlyContinue
    Move-Item bedrock-server\* $global:server\ -Force -ea SilentlyContinue
    Add-Content $global:server\version.txt $global:mcbrWebResponse.href -Force
    Remove-Item bedrock-server -Recurse -Force -ea SilentlyContinue
    ##############################################################
}
Function Get-MCjavaBinaries{
        
    #################### MineCraft Java Install ################
    Get-MCWebrequest 
    $global:mcWebResponse = ((Invoke-WebRequest "https://www.minecraft.net/en-us/download/server").Links | Where-Object { $_.href -like "https://launcher.mojang.com/v1/objects/*/server.jar" })
    
    Invoke-WebRequest -uri $global:mcWebResponse.href -O server.jar
    # $global:mcWebResponse.outerText
    # Expand-Archive "bedrock-server.zip" "bedrock-server" -Force -ea SilentlyContinue
    Move-Item server.jar $global:server\ -Force -ea SilentlyContinue
    Add-Content $global:server\version.txt $global:mcvWebResponse -Force
    Set-Location $global:currentdir\$global:server
    Write-Host "starting server eula"
    Start-Process CMD "/c start java -Xms1024M -Xmx1024M -jar server.jar nogui"
    Pause
    ((Get-Content -path eula.txt -Raw) -replace "false", "true") | Set-Content -Path eula.txt
    Set-Location $global:currentdir
    # Add-Content $global:server\eula.txt 'eula=true' -Force
    # Remove-Item bedrock-server -Recurse -Force -ea SilentlyContinue
    ##############################################################
}