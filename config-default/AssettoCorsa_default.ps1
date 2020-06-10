Function New-LaunchScriptacserverPS {
    # Assetto Corsa Dedicated Server
    # 	302550
    # https://www.assettocorsa.net/forum/index.php?faq/dedicated-server-manual.28/
    #$global:systemdir="Assetto Corsa\Server"
    
    ################## Change Default Variables #################
    
    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    #                           System Directory
    $global:systemdir           = "$serverdir"
    #                           Server Executable
    $global:executable          = "acServer.bat"
    #                           Server Executable Directory
    $global:executabledir       = "Assetto Corsa\Server"
    #                           Gamedig Query
    $global:querytype           = "protocol-valve"
    #                           Game Process
    $global:process             = "acServer"
    #                           Log Directory
    $global:logdirectory        = "$serverdir"
    #                           Server Log
    $global:consolelog          = ""
    #                           Server Config Directory
    $global:servercfgdir        = ""
    #                           Server Launch Command
    $global:launchParams        = '@("${executable}")'
    # Get User Input version must be set to 0
    Get-UserInput
}