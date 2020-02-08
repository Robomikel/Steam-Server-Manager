Function New-LaunchScriptswarmserverPS {
    # Alien Swarm Dedicated Server
    #       635
    # https://developer.valvesoftware.com/wiki/Alien_Swarm_Dedicated_Server
    # GSLT used for running a public server.
    ################## Change Default Variables #################
    #                       Map
    $global:MAP             = "lobby"
    #                       Maxplayers
    $global:MAXPLAYERS      = "4"
    #                       Game Server Token
    $global:GSLT            = ""
    ##############################/\##############################
    
    ###################### Do not change below #####################
    $global:EXE = "swarm"
    $global:EXEDIR = ""
    $global:GAME = "protocol-valve"
    $global:PROCESS = "swarm"
    $global:SERVERCFGDIR = "swarm\cfg"
    $global:ANON = "yes"
    $global:username = ""
    $global:RCONPORT = "${global:PORT}"
    Get-StopServerInstall
    Select-RenameSource
    $global:launchParams = '@("$global:EXE -console -game swarm +map ${global:MAP} -maxplayers ${global:MAXPLAYERS} -autoupdate")'
}