Function New-LaunchScriptBOserverPS {
    # Ballistic Overkill Dedicated Server
    # APP ID # 416880
    # https://steamcommunity.com/app/296300/discussions/1/135508662495143639/
    ################## Change Default Variables #################
    #                       Server IP 
     ${global:IP}           = "${ip}"
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
    #                               Server Directory
    $global:systemdir               = "$serverdir"
    #                               Server Config Directory
    $global:servercfgdir            = "$serverdir"
    #                               Server Executable
    $global:executable              = "BODS"
    #                               Server Executable Directory
    $global:executabledir           = "$serverdir"
    #                               Gamedig Query
    $global:querytype               = "protocol-valve"
    #                               Game Process
    $global:process                 = "BODS"
    #                               Log Directory
    $global:logdirectory            = "$serverdir"
    #                               Game-Server-Config Directory
    $global:gamedirname             = "BallisticOverkill"
    #                               Game-Server-Config
    $global:servercfg               = "config.txt"
    # Server Launch Command
    $global:launchParams            = '@("$executable -batchmode -nographics -dedicated ")'  
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG                                Server Launch Command
}