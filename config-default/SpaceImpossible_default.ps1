Function New-LaunchScriptSpacecImpossibleserverPS {
    # Space Impossible Dedicated Server
    # 1222650
    ################## Change Default Variables #################

  
    ##############################/\##############################
    
    
    # Ports 4545 and 4546 TCP/UDP 
    # 27015 Query
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXEDIR = ""
    $global:EXE = "SIDedicatedServer"
    $global:GAME = "protocol-valve"
    $global:SAVES = ""
    $global:PROCESS = "SIDedicatedServer"
    $global:SERVERCFGDIR = ""
    $global:LOGDIR = "SIDedicatedServer_Data"
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = ""
    $global:config1 = "serverconfig.txt"

    $global:launchParams = '@("$global:EXE -config serverconfig.txt -console -batchmode -nographics -LOG")'
  }   