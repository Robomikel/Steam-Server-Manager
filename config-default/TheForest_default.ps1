Function New-LaunchScriptforestserverPS {
    #----------   The Forest Server Install Function   -------------------
    # APP ID # 556450
    ################## Change Default Variables #################
    #                   Server IP 
    $global:ip          = "${ip}"
    #                   Server Name 
    $global:hostname    = "SERVERNAME"
    #                   Steam Port
    $global:steamport   = "8766"
    #                   Server Port
    $global:port        = "27015"
    #                   Server Query Port
    $global:queryport   = "27016"
    #                   Server Max Players
    $global:maxplayers  = "8"
    #                   Server Difficulty
    ${global:diff}      = "Normal"

    ##############################/\##############################
    # In server.cfg
    # showLogs on to view console
    ###################### Do not change below #####################
    #                       System Directory     
    $global:systemdir       = ""
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\cfg"
    #                       Server Executable
    $global:executable      = "TheForestDedicatedServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "forrest"
    #                       Game Process
    $global:process         = "TheForestDedicatedServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"  
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -serverip ${ip} -serversteamport ${steamport} -servergameport ${port} -serverqueryport ${queryport} -servername `"${hostname}`" -serverplayers ${maxplayers} -difficulty ${diff} -configfilepath $servercfgdir\server.cfg -inittype Continue -slot 4 -batchmode -nographics")'
    # Get User Input version must be set to 0
    Get-UserInput    
}