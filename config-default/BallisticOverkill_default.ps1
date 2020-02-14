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
    $global:MODDIR = ""
    $global:EXEDIR = ""
    $global:EXE = "BODS"
    $global:GAME = "protocol-valve"
    $global:SAVES = ""
    $global:PROCESS = "BODS"
    $global:SERVERCFGDIR = ""

    
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = "BallisticOverkill"
    $global:config1 = "config.txt"
    # Get-Servercfg
    # game config
    # Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE -batchmode -nographics -dedicated ")'
}