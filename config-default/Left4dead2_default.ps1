Function New-LaunchScriptLFD2serverPS {
    #----------   left4dead2 Server CFG    -------------------
    # APP ID # 222860
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:PORT            = "27015"
    #                       Client Port
    $global:CLIENTPORT      = "27005"
    #                       Map
    $global:MAP             = "c1m1_hotel"
    #                       Maxplayers
    $global:MAXPLAYERS      = "8"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below ##################### 
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

    # Get-UserInput 1 1 0 0 1 1 0 1 0 1 1
    #if(($global:workshop = Read-Host -Prompt (Write-Host "Input 1 to enable workshop, Press enter to accept default value [0]: "-ForegroundColor Cyan -NoNewline)) -eq ''){$global:workshop="0"}else{$global:workshop}
    #if(($global:sv_pure = Read-Host -Prompt (Write-Host "Input addtional launch params ie. +sv_pure 0, Press enter to accept default value []: "-ForegroundColor Cyan -NoNewline)) -eq ''){}else{$global:sv_pure}
    Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE -console -game left4dead2 -strictportbind -ip ${global:IP} -port ${global:PORT} +clientport ${global:CLIENTPORT} +hostip ${global:EXTIP} +maxplayers ${global:MAXPLAYERS} +map `"${global:MAP}`" -condebug ")'
    #Get-SourceMetMod
}