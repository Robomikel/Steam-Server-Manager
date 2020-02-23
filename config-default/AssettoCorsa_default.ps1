Function New-LaunchScriptacserverPS {
    # Assetto Corsa Dedicated Server
    # 	302550
    # https://www.assettocorsa.net/forum/index.php?faq/dedicated-server-manual.28/
    #$global:systemdir="Assetto Corsa\Server"
    
    ################## Change Default Variables #################
    
    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir           = "$serverdir"
    $global:executable          = "acServer.bat"
    $global:executabledir       = "Assetto Corsa\Server"
    $global:querytype           = "protocol-valve"
    $global:process             = "acServer"
    $global:servercfgdir        = ""
    $global:logdirectory        = "$serverdir"

    $global:launchParams        = '@("$executable")'
}