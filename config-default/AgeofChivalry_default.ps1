Function New-LaunchScriptAoCserverPS {
    # Age of Chivalry Dedicated Server
    # 17515
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    ${global:port}          = "27015"
    #                       Map
    $global:defaultmap      = "aoc_siege"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "aoc"
    $global:executabledir= "$serverdir"
    $global:querytype = "ageofchivalry"
    $global:saves = ""
    $global:process = "aoc"
    $global:servercfgdir = "$serverdir\ageofchivalry\cfg"
    $global:logdirectory = "$serverdir\ageofchivalry"

    
      
    Get-StopServerInstall
    $global:gamedirname = "AgeOfChivalry"
    $global:servercfg = "server.cfg"
    Get-Servercfg
    Select-RenameSource
    Select-EditSourceCFG
    $global:launchParams = '@("$executable -console -game ageofchivalry -secure +map ${defaultmap} -autoupdate +log on +maxplayers ${maxplayers} -port ${port} +ip ${ip} +exec server.cfg -condebug")'
}