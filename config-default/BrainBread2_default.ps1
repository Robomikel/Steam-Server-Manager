Function New-LaunchScriptBB2serverPS {
    # BrainBread 2 Dedicated Server
    # APP ID # 475370
    #
    ################## Change Default Variables ################# 
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    ${global:port}          = "27015"
    #                       Client Port
    $global:CLIENTPORT      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    # GSLT used for running a public server.
    #                       Game Server Token : Optional
    $global:GSLT            = ""
    #                       Map
    $global:defaultmap      = "bba_barracks"
    #                       Maxplayers
    $global:maxplayers      = "20"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    ###########################/\#################################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\brainbread2\cfg"
    #                       Server Executable
    $global:executable      = "BB2"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "BB2"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\brainbread2"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "BrainBread2"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    If ($gslt) {
        $global:launchParams = '@("$executable -console -game brainbread2 -strictportbind -ip ${ip} -port ${port} +hostname `"${hostname}`" +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +sv_setsteamaccount ${gslt} +servercfgfile ${servercfg} -maxplayers ${maxplayers} -condebug")'
    }
    Else {
        $global:launchParams = '@("$executable -console -game brainbread2 -strictportbind -ip ${ip} -port ${port} +hostname `"${hostname}`" +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers ${maxplayers} -condebug")'
    }
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}