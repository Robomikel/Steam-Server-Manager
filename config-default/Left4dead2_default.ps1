Function New-LaunchScriptLFD2serverPS {
    #----------   left4dead2 Server CFG    -------------------
    # APP ID # 222860
    # Steamer Vars Do Not Edit
    $global:MODDIR = "left4dead2"
    $global:EXEDIR = ""
    $global:EXE = "l4d2"
    $global:GAME = "left4dead2"
    $global:PROCESS = "l4d2"
    $global:SERVERCFGDIR = "left4dead2\cfg"
    Get-StopServerInstall
    # Game-Server-Configs
    $global:gamedirname = "Left4Dead2"
    $global:config1 = "server.cfg"
    Get-Servercfg
    $global:RCONPORT = "${global:PORT}"
    # - - - - - - - - - - - - -
    Select-RenameSource
    # Version 2.0
    #  First Run Vars \/ \/ Add Here
    ${global:defaultIP} = "${global:IP}"
    $global:defaultPORT = "27015"
    $global:defaultCLIENTPORT = "27005"
    $global:defaultMAP = "c1m1_hotel"
    $global:defaultMAXPLAYERS = "8"
    $global:defaultHOSTNAME = "PS Steamer"
    $global:defaultRCONPASSWORD = "$global:RANDOMPASSWORD"
    #  Edit Vars here     /\ /\ /\
    Get-UserInput 1 1 0 0 1 1 0 1 0 1 1
    #if(($global:workshop = Read-Host -Prompt (Write-Host "Input 1 to enable workshop, Press enter to accept default value [0]: "-ForegroundColor Cyan -NoNewline)) -eq ''){$global:workshop="0"}else{$global:workshop}
    #if(($global:sv_pure = Read-Host -Prompt (Write-Host "Input addtional launch params ie. +sv_pure 0, Press enter to accept default value []: "-ForegroundColor Cyan -NoNewline)) -eq ''){}else{$global:sv_pure}
    Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE -console -game left4dead2 -strictportbind -ip ${global:IP} -port ${global:PORT} +clientport ${global:CLIENTPORT} +hostip ${global:EXTIP} +maxplayers ${global:MAXPLAYERS} +map `"${global:MAP}`" -condebug ")'
    Get-SourceMetMod
}