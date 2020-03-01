Function New-LaunchScriptSCPSecretLaboratoryserverPS {
    # SCP: Secret Laboratory Dedicated Server
    # 996560
    ################## Change Default Variables #################

    #                   Server Port 
    $global:port        = "7777"

    ##############################/\##############################
    
    
    # 7777
    # config located in "$env:APPDATA\SCP Secret Laboratory\config\$global:port\config_gameplay.txt"
    
    # Requires  admin email for public server or will not run
    # contact_email: default

    # Your server won't be visible on the public server list -
    # If you are 100% sure that the server is working, can be accessed from the Internet 
    # and YOU WANT TO MAKE IT PUBLIC, please set up your email in configuration file ("contact_email" value) and restart the server.
    
    ###################### Do not change below #####################
    #                           System Directory
    $global:systemdir           = "$serverdir"
    #                           Server Config Directory
    $global:servercfgdir        = "$env:APPDATA\SCP Secret Laboratory\config\$port\config_gameplay.txt"
    #                           Server Executable
    $global:executable          = "LocalAdmin"
    #                           Server Executable Directory
    $global:executabledir       = "$serverdir"
    #                           Appdata\Roaming Directory
    $global:saves               = "SCP Secret Laboratory"
    #                           Gamedig Query
    $global:querytype           = "protocol-valve"
    #                           Game Process
    $global:process             = "LocalAdmin|SCPS"
    #                           Log Directory
    $global:logdirectory        = "$env:APPDATA\SCP Secret Laboratory\ServerLogs\$port"
    #                           Game-Server-Config Directory
    $global:gamedirname         = ""
    #                           Game-Server-Config
    $global:servercfg           = ""
    #                           Server Launch Command
    $global:launchParams        = '@("$executable ${port}")'
    # Get User Input version must be set to 0
    Get-UserInput
}   