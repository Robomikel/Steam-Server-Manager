Function New-LaunchScriptBOserverPS {
    # Ballistic Overkill Dedicated Server
    # 416880
    # https://steamcommunity.com/app/296300/discussions/1/135508662495143639/
    # Requiered Dont change 
    # Version 2.0
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
    Get-Servercfg
    # GSLT used for running a public server.
    #  First Run Vars \/ \/ Add Here
    ${global:defaultIP} = "${global:IP}"
    $global:defaultGSLT = ""
    #     Add here     /\ /\ /\
    Get-UserInput 1 0 0 0 0 0 0 0 1
    # game config
    Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE -batchmode -nographics -dedicated ")'
}