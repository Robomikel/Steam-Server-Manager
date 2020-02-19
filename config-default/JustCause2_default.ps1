Function New-LaunchScriptjc2serverPS {
    # Just Cause 2: Multiplayer - Dedicated Server
    # APP ID # 261140
    ################## Change Default Variables #################

    #                       Server Name
    $global:hostname        = "$env:USERNAME"


    ##############################/\##############################
    
    # 7777 TCP/UDP
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executabledir = ""
    $global:executable = "JcmpServer"
    $global:querytype = "jc2mp"
    #  Default Port for gamedig - change if needed
    $global:port = "7777"
    $global:saves = ""
    $global:process = "JcmpServer"
    $global:servercfgdir = "\"
    $global:logdir = ""
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = "JustCause2"
    $global:servercfg = "config.lua"
    Get-Servercfg
    # Select-RenameSource
    # game config
    Select-EditSourceCFG
    $global:launchParams = '@("$executable")'
  }   