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
    $global:MODDIR = ""
    $global:EXE = "rFactor2 Dedicated"
    $global:EXEDIR = "rFactor2-Dedicated\Bin64"
    $global:GAME = "protocol-valve"
    $global:PROCESS = "rFactor2 Dedicated"
    $global:SERVERCFGDIR = "rFactor2-Dedicated\Saved\Config\WindowsServer"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = ""

    
    # Get-Servercfg
    # Select-EditSourceCFG
    $global:launchParams = '@("$global:EXEDIR\$global:EXE +path=".."")'
} 