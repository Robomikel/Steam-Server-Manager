Function New-LaunchScriptrFactor2serverPS {
    # rFactor 2 Dedicated Server
    # APP ID # 400300
    # https://docs.studio-397.com/users-guide/setting-up-a-dedicated-server
    ################## Change Default Variables #################

    ##############################/\##############################
    
    # Multiplayer.JSON 
    # "HTTP Server Port":64297
    # "Simulation Port":54297
    # UDP+TCP 54297
    # TCP 64297
    # UDP 64298
    # UDP 64299
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "rFactor2 Dedicated"
    $global:executabledir = "rFactor2-Dedicated\Bin64"
    $global:querytype = "protocol-valve"
    $global:process = "rFactor2 Dedicated"
    $global:servercfgdir = "rFactor2-Dedicated\Saved\Config\WindowsServer"
    $global:logdir = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = ""

    
    # Get-Servercfg
    # Select-EditSourceCFG
    $global:launchParams = '@("$executabledir\$executable +path=".."")'
} 