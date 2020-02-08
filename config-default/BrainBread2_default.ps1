Function New-LaunchScriptBB2serverPS {
    # BrainBread 2 Dedicated Server
    # 475370
    #
  
    # - - - - - - - - - Change Default Variables ------------

    ${global:IP} = "${global:IP}"
    ${global:PORT} = "27015"
    $global:CLIENTPORT = "27005"
    $global:SOURCETVPORT = "27020"
    # GSLT used for running a public server.
    $global:GSLT = ""
    $global:MAP = "bba_barracks"
    $global:MAXPLAYERS = "20"
    $global:RCONPASSWORD = "$global:RANDOMPASSWORD"
    # - - - - - - - Do not change below - - - - - - - - -
    # Version 2.0
    $global:MODDIR = ""
    $global:EXEDIR = ""
    $global:EXE = "BB2"
    $global:GAME = "protocol-valve"
    $global:SAVES = ""
    $global:PROCESS = "BB2"
    $global:SERVERCFGDIR = "cfg"
    $global:ANON = "yes"
    $global:username = ""
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = "BrainBread2"
    $global:config1 = "server.cfg"
    Get-Servercfg
    $global:RCONPORT = "${global:PORT}"

    #     Add here     /\ /\ /\
    #Get-UserInput 1 1 0 0 1 0 0 1 1 1
    Select-RenameSource
    # game config
    Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE -console -game brainbread2 -strictportbind -ip ${global:IP} -port ${global:PORT} +clientport ${global:CLIENTPORT} +tv_port ${global:SOURCETVPORT} +map ${global:MAP} -maxplayers ${global:MAXPLAYERS} ")'
}