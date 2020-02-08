Function New-LaunchScriptboundelserverPS {
    # Boundel Server
    # 454070
    ################## Change Default Variables ################# 
    
    ###########################/\#################################
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "world"
    $global:EXEDIR = "Datcha_Server"
    $global:GAME = "protocol-valve"
    $global:PROCESS = "world"
    $global:ANON = "yes"
    $global:username = ""
    Get-StopServerInstall
    $global:launchParams = '@("$global:EXEDIR\$global:EXE -batchmode")'
}