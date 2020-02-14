Function New-LaunchScriptjc2serverPS {
    # Just Cause 2: Multiplayer - Dedicated Server
    # APP ID # 261140
    ################## Change Default Variables #################

    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"


    ##############################/\##############################
    
    # 7777 TCP/UDP
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXEDIR = ""
    $global:EXE = "JcmpServer"
    $global:GAME = "jc2mp"
    #  Default Port for gamedig - change if needed
    $global:PORT = "7777"
    $global:SAVES = ""
    $global:PROCESS = "JcmpServer"
    $global:SERVERCFGDIR = "\"
    $global:LOGDIR = ""
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = "JustCause2"
    $global:config1 = "config.lua"
    Get-Servercfg
    # Select-RenameSource
    # game config
    Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE")'
  }   