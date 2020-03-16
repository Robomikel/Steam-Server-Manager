Function New-LaunchScriptboundelserverPS {
    # Boundel Server
    # 454070
    ################## Change Default Variables ################# 
    #                       Requieres Steam Login

    ###########################/\#################################
    # 8002 TCP/UDP

    ###################### Do not change below #####################
    #                       System Directory 
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "world"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Datcha_Server"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "world"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog      = ""
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -batchmode")'
    # Get User Input version must be set to 0
    Get-UserInput
}