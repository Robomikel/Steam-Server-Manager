Function New-LaunchScriptforestserverPS {
    #----------   The Forest Server Install Function   -------------------
    # APP ID # 556450
    ################## Change Default Variables #################
    #                   Server IP 
    $global:ip          = "${global:IP}"
    #                   Server Name 
    $global:hostname    = "$env:USERNAME"
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
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "TheForestDedicatedServer"
    $global:executabledir = "$serverdir"
    $global:querytype = "forrest"
    $global:process = "TheForestDedicatedServer"
    # $global:servercfgdir = "$serverdir\SKS\TheForestDedicatedServer\ds"
    $global:servercfgdir = "$serverdir\cfg"
    $global:logdirectory = "$serverdir"
    Get-StopServerInstall  
    #   Launch Param
    $global:launchParams = '@("$executable -serverip ${ip} -serversteamport ${steamport} -servergameport ${port} -serverqueryport ${queryport} -servername `"${hostname}`" -serverplayers ${maxplayers} -difficulty ${diff} -configfilepath $servercfgdir\server.cfg -inittype Continue -slot 4 -batchmode -nographics")'
}