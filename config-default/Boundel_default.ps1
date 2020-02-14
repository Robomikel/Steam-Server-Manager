Function New-LaunchScriptboundelserverPS {
    # Boundel Server
    # 454070
    ################## Change Default Variables ################# 
    #                       Requieres Steam Login
    #                       Steam Anonymous user
    $global:ANON = "no"
    #                       Steam Username
    $global:username        = ""
    ###########################/\#################################
    # 8002 TCP/UDP
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "world"
    $global:EXEDIR = "Datcha_Server"
    $global:GAME = "protocol-valve"
    $global:PROCESS = "world"
    Get-StopServerInstall
    $global:launchParams = '@("$global:EXEDIR\$global:EXE -batchmode")'
}