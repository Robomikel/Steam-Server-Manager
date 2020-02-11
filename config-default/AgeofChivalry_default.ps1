Function New-LaunchScriptAoCserverPS {
    # Age of Chivalry Dedicated Server
    # 17515
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    ${global:PORT}          = "27015"
    #                       Map
    $global:MAP             = "aoc_siege"
    #                       Maxplayers
    $global:MAXPLAYERS      = "32"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "aoc"
    $global:EXEDIR = ""
    $global:GAME = "ageofchivalry"
    $global:SAVES = ""
    $global:PROCESS = "aoc"
    $global:SERVERCFGDIR = "ageofchivalry\cfg"
    $global:LOGDIR = "ageofchivalry"

    $global:username = ""
    $global:RCONPORT = "${global:PORT}"   
    Get-StopServerInstall
    $global:gamedirname = "AgeOfChivalry"
    $global:config1 = "server.cfg"
    Get-Servercfg
    Select-RenameSource
    Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE -console -game ageofchivalry -secure +map ${global:MAP} -autoupdate +log on +maxplayers ${global:MAXPLAYERS} -port ${global:PORT} +ip ${global:IP} +exec server.cfg -condebug")'
}