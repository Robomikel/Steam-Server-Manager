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