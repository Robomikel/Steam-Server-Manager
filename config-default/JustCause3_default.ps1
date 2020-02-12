Function New-LaunchScriptjc3serverPS {
    # Just Cause™ 3: Multiplayer - Dedicated Server
    # APP ID # 619960
    ################## Change Default Variables #################

    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"


    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXEDIR = ""
    $global:EXE = "Server"
    $global:GAME = "jc3mp"
    #  Default Port for gamedig - change if needed
    $global:PORT = "4201"
    $global:SAVES = ""
    $global:PROCESS = "Server"
    $global:SERVERCFGDIR = "\"
    $global:LOGDIR = ""
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = "JustCause3"
    $global:config1 = "config.json"
    Get-Servercfg
    # Select-RenameSource
    # game config
    Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE")'
  }   