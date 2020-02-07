Function New-LaunchScriptswarmserverPS {
    # Alien Swarm Dedicated Server
    #       635
    # https://developer.valvesoftware.com/wiki/Alien_Swarm_Dedicated_Server
    $global:EXE = "swarm"
    $global:EXEDIR = ""
    $global:GAME = "protocol-valve"
    $global:PROCESS = "swarm"
    $global:SERVERCFGDIR = "swarm\cfg"
    Get-StopServerInstall
    # GSLT used for running a public server.
    #  First Run Vars \/ \/ Add Here
    $global:RCONPORT = "${global:PORT}"
    $global:defaultMAP = "lobby"
    $global:defaultMAXPLAYERS = "4"
    #     Add here     /\ /\ /\ 
    Get-UserInput 0 0 0 0 0 0 0 1 0 1
    Select-RenameSource
    $global:launchParams = '@("$global:EXE -console -game swarm +map ${global:MAP} -maxplayers ${global:MAXPLAYERS} -autoupdate")'
}