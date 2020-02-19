Function New-LaunchScriptBB2serverPS {
    # BrainBread 2 Dedicated Server
    # APP ID # 475370
    #
    ################## Change Default Variables ################# 
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    
    #                       Server Port
    ${global:port}          = "27015"
    #                       Client Port
    $global:CLIENTPORT      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    # GSLT used for running a public server.
    #                       Game Server Token : Optional
    $global:GSLT            = "GameServerTokenHere"
    #                       Map
    $global:defaultmap             = "bba_barracks"
    #                       Maxplayers
    $global:maxplayers      = "20"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    ###########################/\#################################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executabledir = ""
    $global:executable = "BB2"
    $global:querytype = "protocol-valve"
    $global:saves = ""
    $global:process = "BB2"
    $global:servercfgdir = "brainbread2\cfg"
    $global:logdir = "brainbread2"

    
    $global:logdir = "brainbread2"
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = "BrainBread2"
    $global:servercfg = "server.cfg"
    Get-Servercfg
    #Get-UserInput 1 1 0 0 1 0 0 1 1 1
    Select-RenameSource
    # game config
    Select-EditSourceCFG
    $global:launchParams = '@("$executable -console -game brainbread2 -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} -maxplayers ${maxplayers} -condebug")'
}