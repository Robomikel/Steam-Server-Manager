Function New-LaunchScriptSpacecImpossibleserverPS {
    # Space Impossible Dedicated Server
    # 1222650
    ################## Change Default Variables #################

  
    ##############################/\##############################
    
    
    # Ports 4545 and 4546 TCP/UDP 
    # 27015 Query
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executabledir = "$serverdir"
    $global:executable = "SIDedicatedServer"
    $global:querytype = "protocol-valve"
    $global:saves = ""
    $global:process = "SIDedicatedServer"
    $global:servercfgdir = "$serverdir"
    $global:logdirectory = "$serverdir\SIDedicatedServer_Data"
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = ""
    $global:servercfg = "serverconfig.txt"

    $global:launchParams = '@("$executable -config serverconfig.txt -console -batchmode -nographics -LOG")'
  }   