Function New-LaunchScriptforestserverPS {
    #----------   The Forest Server Install Function   -------------------
    # APP ID # 556450
    ################## Change Default Variables #################
    #                   Server IP 
    $global:IP          = "${global:IP}"
    #                   Server Name 
    $global:HOSTNAME    = "$env:USERNAME"
    #                   Steam Port
    $global:STEAMPORT   = "8766"
    #                   Server Port
    $global:PORT        = "27015"
    #                   Server Query Port
    $global:QUERYPORT   = "27016"
    #                   Server Max Players
    $global:MAXPLAYERS  = "8"
    #                   Server Difficulty
    ${global:DIFF}      = "Normal"

    ##############################/\##############################
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "TheForestDedicatedServer"
    $global:EXEDIR = ""
    $global:GAME = "forrest"
    $global:PROCESS = "TheForestDedicatedServer"
    $global:SERVERCFGDIR = "SKS\TheForestDedicatedServer\ds"
    $global:LOGDIR = ""
    Get-StopServerInstall  
    #   Launch Param
    $global:launchParams = '@("$global:EXE -serverip ${global:IP} -serversteamport ${global:STEAMPORT} -servergameport ${global:PORT} -serverqueryport ${global:QUERYPORT} -servername `"${global:HOSTNAME}`" -serverplayers ${global:MAXPLAYERS} -difficulty ${global:DIFF} -configfilepath $global:currentdir\$global:server\cfg\server.cfg -inittype Continue -slot 4 -batchmode -nographics")'
}