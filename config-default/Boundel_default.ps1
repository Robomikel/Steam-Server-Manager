Function New-LaunchScriptboundelserverPS {
    # Boundel Server
    # 454070
    ################## Change Default Variables ################# 
    #                       Requieres Steam Login

    ###########################/\#################################
    # 8002 TCP/UDP
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "world"
    $global:executabledir = "$serverdir\Datcha_Server"
    $global:querytype = "protocol-valve"
    $global:process = "world"
    $global:logdirectory = "$serverdir"
    Get-StopServerInstall
    $global:launchParams = '@("$executable -batchmode")'
}