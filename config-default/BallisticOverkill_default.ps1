Function New-LaunchScriptBOserverPS {
    # Ballistic Overkill Dedicated Server
    # APP ID # 416880
    # https://steamcommunity.com/app/296300/discussions/1/135508662495143639/
    ################## Change Default Variables #################
    #                       Server IP 
    # ${global:IP}     = "${global:IP}"
    # GSLT used for running a public server.
    #                       Game Server Token
    # $global:GSLT     = "GameServerTokenHere"
    ##############################/\##############################
    
    # UDP 8760 - 8790
    # UDP 7777 - 7778
    # UDP 4242
    # TCP/UDP 27015 (or selected ServerPort in config.txt)
    # TCP/UDP 27016 (or selected QueryPort in config.txt)
    
    
    
    ##################### Do not change below #####################
    $global:systemdir = ""
    $global:executabledir= "$serverdir"
    $global:executable = "BODS"
    $global:querytype = "protocol-valve"
    $global:saves = ""
    $global:process = "BODS"
    $global:servercfgdir = "$serverdir"
    $global:logdirectory = "$serverdir"
    
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = "BallisticOverkill"
    $global:servercfg = "config.txt"
    # Get-Servercfg
    # game config
    # Select-EditSourceCFG
    $global:launchParams = '@("$executable -batchmode -nographics -dedicated ")'
    
}