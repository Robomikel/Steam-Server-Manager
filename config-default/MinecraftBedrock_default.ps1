Function New-LaunchScriptbedrock_serverPS {
    # Minecraft Bedrock
    # 11421000


    ################## Change Default Variables #################

    ###########################/\#################################

    
    # On some systems, when you wish to connect to the server using a client running on the same machine as the server is running on, you will need to exempt the Minecraft client from UWP loopback restrictions:
    # un-comment below before first run to exempt the Minecraft client from UWP loopback restrictions
    # CheckNetIsolation.exe LoopbackExempt –a –p=S-1-15-2-1958404141-86561845-1752920682-3514627264-368642714-62675701-733520436

    
    
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