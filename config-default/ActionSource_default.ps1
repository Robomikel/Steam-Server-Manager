Function New-LaunchScriptAHL2serverPS {
    # Action: Source Dedicated Server
    # 985050
    # Requiere Steam Login
    # Requiered Dont change
    # Version 2.0
    $global:MODDIR = ""
    $global:EXEDIR = ""
    $global:EXE = "ahl2"
    $global:GAME = "protocol-valve"
    $global:SAVES = ""
    $global:PROCESS = "ahl2"
    $global:SERVERCFGDIR = "cfg"
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = "ActionSource"
    $global:config1 = "server.cfg"
    Get-Servercfg
    # GSLT used for running a public server.
    #  First Run Vars \/ \/ Add Here
    ${global:defaultIP} = "${global:IP}"
    ${global:defaultPORT} = "27015"
    $global:defaultCLIENTPORT = "27005"
    $global:defaultSOURCETVPORT = "27020"
    $global:defaultGSLT = ""
    $global:defaultMAP = "act_airport"
    $global:defaultMAXPLAYERS = "20"
    #     Add here     /\ /\ /\
    Get-UserInput 1 1 0 0 0 0 0 1 1 1 1 1
    Select-RenameSource
    # game config
    Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE -console -game ahl2 -strictportbind -ip ${global:IP} -port ${global:PORT} +clientport ${global:CLIENTPORT} +tv_port ${global:SOURCETVPORT} +map ${global:MAP} -maxplayers ${global:MAXPLAYERS} ")'
}   