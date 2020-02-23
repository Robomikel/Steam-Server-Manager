Function New-LaunchScriptMemoriesofMarsServerPS {
    # Memories of Mars - Dedicated Server
    # APP ID # 897590
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Maxplayers
    $global:maxplayers      = "2"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    ##############################/\##############################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\ShooterGame\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "MemoriesOfMarsServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Game\Binaries\Win64\"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "MemoriesOfMarsServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\Game\Saved\Logs"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "DedicatedServerConfig.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -MULTIHOME=`"${ip}`" -port=${port} -queryport=${queryport} -maxplayers=${maxplayers}")'
    New-servercfgmom
} 
Function New-servercfgmom {
    Write-Host "Creating Custom Config" -F M
    Rename-Item "$servercfgdir\DedicatedServerConfig.cfg" "$servercfgdir\DedicatedServerConfig.cfg.bak" -ea SilentlyContinue
    New-Item $servercfgdir\DedicatedServerConfig.cfg -ItemType File -Force
    
    Add-Content $servercfgdir\DedicatedServerConfig.cfg `
"{
    `"ServerName`": `"$hostname`",
    `"ServerPassword`": `"$SERVERPASSWORD`",
    `"ServerID`": `"mom_dedicated_01`",
    `"MapName`": `"Main`",
    `"MaxPlayers`":  $maxplayers,
    `"EnablePVP`": false,
    `"EnablePVPAreas`": true,
    `"EnableEAC`": true,
    `"DailyRestartUTCHour`": `"12`",
    `"Headless`": false,
    `"UserWhitelist`": `"`",
    `"UserBlacklist`": `"`",
    `"Admins`" : `"`"
}"
}