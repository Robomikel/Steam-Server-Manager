Function New-LaunchScriptjc3serverPS {
    # Just Cause™ 3: Multiplayer - Dedicated Server
    # APP ID # 619960
    ################## Change Default Variables #################

    #                       Server Name
    $global:hostname        = "$env:USERNAME"


    ##############################/\##############################
    
    
    #  4200 TCP/UDP
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executabledir = ""
    $global:executable = "Server"
    $global:querytype = "jc3mp"
    #  Default Port for gamedig - change if needed
    $global:port = "4201"
    $global:saves = ""
    $global:process = "Server"
    $global:servercfgdir = "\"
    $global:logdir = ""
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = "JustCause3"
    $global:servercfg = "config.json"
    Get-Servercfg
    # Select-RenameSource
    # game config
    Select-EditSourceCFG
    $global:launchParams = '@("$executable")'
  }   