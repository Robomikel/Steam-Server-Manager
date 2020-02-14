Function New-LaunchScriptbedrock_serverPS {
    # Minecraft Bedrock
    # 11421000


    ################## Change Default Variables #################

    ###########################/\#################################

    
    # 19132 TCP/UDP IPV4
    
    
    ###################### Do not change below #####################
    Get-MCBRBinaries
    $global:MODDIR = ""
    $global:EXE = "bedrock_server"
    $global:EXEDIR = ""
    $global:GAME = "minecraftbe"
    $global:SAVES = ""
    $global:PROCESS = "bedrock_server"
    $global:SERVERCFGDIR = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = ""

    
    $global:launchParams = '@("$global:EXE ")'

}