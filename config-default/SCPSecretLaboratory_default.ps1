Function New-LaunchScriptSCPSecretLaboratoryserverPS {
    # SCP: Secret Laboratory Dedicated Server
    # 996560
    ################## Change Default Variables #################

    #                   Server Port 
    $global:port = "7777"

    ##############################/\##############################
    
    
    # 7777
    # config located in "$env:APPDATA\SCP Secret Laboratory\config\$global:port\config_gameplay.txt"
    
    # Requires  admin email for public server or will not run
    # contact_email: default

    # Your server won't be visible on the public server list -
    # If you are 100% sure that the server is working, can be accessed from the Internet 
    # and YOU WANT TO MAKE IT PUBLIC, please set up your email in configuration file ("contact_email" value) and restart the server.
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executabledir = ""
    $global:executable = "LocalAdmin"
    $global:querytype = "protocol-valve"
    $global:saves = "SCP Secret Laboratory"
    $global:process = "LocalAdmin|SCPS"
    $global:servercfgdir = "$env:APPDATA\SCP Secret Laboratory\config\$port\config_gameplay.txt"
    $global:logdir = "$env:APPDATA\SCP Secret Laboratory\ServerLogs\$port"
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = ""
    $global:servercfg = ""

    $global:launchParams = '@("$executable $port")'
}   