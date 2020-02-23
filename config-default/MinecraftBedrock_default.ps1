Function New-LaunchScriptbedrock_serverPS {
    # Minecraft Bedrock
    # 11421000


    ################## Change Default Variables #################

    ###########################/\#################################

    
    # 19132 TCP/UDP IPV4
    
    
    ###################### Do not change below #####################
    Get-MCBRBinaries
    $global:systemdir = ""
    $global:executable = "bedrock_server"
    $global:executabledir = "$serverdir"
    $global:querytype = "minecraftbe"
    $global:saves = ""
    $global:process = "bedrock_server"
    $global:servercfgdir = "$serverdir"
    
    $global:gamedirname = ""
    $global:servercfg = ""

    
    $global:launchParams = '@("$executable ")'

}