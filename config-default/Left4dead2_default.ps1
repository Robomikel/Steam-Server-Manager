Function New-LaunchScriptLFD2serverPS {
    #----------   left4dead2 Server CFG    -------------------
    # APP ID # 222860
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Map
    $global:defaultmap      = "c1m1_hotel"
    #                       Maxplayers
    $global:maxplayers      = "8"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below ##################### 
    # Steamer Vars Do Not Edit
    $global:systemdir = "left4dead2"
    $global:executabledir = ""
    $global:executable = "l4d2"
    $global:querytype = "left4dead2"
    $global:process = "l4d2"
    $global:servercfgdir = "left4dead2\cfg"
    $global:logdir = "left4dead2"
    Get-StopServerInstall
    # Game-Server-Configs
    $global:gamedirname = "Left4Dead2"
    $global:servercfg = "server.cfg"
    Get-Servercfg
    # - - - - - - - - - - - - -
    Select-RenameSource
    # Version 2.0

    # Get-UserInput 1 1 0 0 1 1 0 1 0 1 1
    #if(($global:workshop = Read-Host -Prompt (Write-Host "Input 1 to enable workshop, Press enter to accept default value [0]: "-ForegroundColor Cyan -NoNewline)) -eq ''){$global:workshop="0"}else{$global:workshop}
    #if(($global:sv_pure = Read-Host -Prompt (Write-Host "Input addtional launch params ie. +sv_pure 0, Press enter to accept default value []: "-ForegroundColor Cyan -NoNewline)) -eq ''){}else{$global:sv_pure}
    Select-EditSourceCFG
    $global:launchParams = '@("$executable -console -game left4dead2 -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +hostip ${extip} +maxplayers ${maxplayers} +map `"${defaultmap}`" -condebug ")'
    #Get-SourceMetMod
}