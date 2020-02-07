Function New-LaunchScriptBB2serverPS {
    # BrainBread 2 Dedicated Server
    # 475370
    #
    # Requiered Dont change
    # Version 2.0
    $global:MODDIR = ""
    $global:EXEDIR = ""
    $global:EXE = "BB2"
    $global:GAME = "protocol-valve"
    $global:SAVES = ""
    $global:PROCESS = "BB2"
    $global:SERVERCFGDIR = "cfg"
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = "BrainBread2"
    $global:config1 = "server.cfg"
    Get-Servercfg
    $global:RCONPORT = "${global:PORT}"
    # GSLT used for running a public server.
    #  First Run Vars \/ \/ Add Here
    ${global:defaultIP} = "${global:IP}"
    ${global:defaultPORT} = "27015"
    $global:defaultCLIENTPORT = "27005"
    $global:defaultSOURCETVPORT = "27020"
    $global:defaultGSLT = ""
    $global:defaultMAP = "bba_barracks"
    $global:defaultMAXPLAYERS = "20"
    $global:defaultRCONPASSWORD = "$global:RANDOMPASSWORD"
    #     Add here     /\ /\ /\
    Get-UserInput 1 1 0 0 1 0 0 1 1 1
    Select-RenameSource
    # game config
    Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE -console -game brainbread2 -strictportbind -ip ${global:IP} -port ${global:PORT} +clientport ${global:CLIENTPORT} +tv_port ${global:SOURCETVPORT} +map ${global:MAP} -maxplayers ${global:MAXPLAYERS} ")'
}