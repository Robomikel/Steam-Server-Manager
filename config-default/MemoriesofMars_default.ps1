Function New-LaunchScriptMemoriesofMarsServerPS {
    # Memories of Mars - Dedicated Server
    # APP ID # 897590
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Maxplayers
    $global:maxplayers      = "2"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "MemoriesOfMarsServer"
    $global:executabledir = "$serverdir\Game\Binaries\Win64\"
    $global:querytype = "protocol-valve"
    $global:process = "MemoriesOfMarsServer"
    $global:servercfgdir = "$serverdir\ShooterGame\Saved\Config\WindowsServer"
    $global:logdirectory = "$serverdir\Game\Saved\Logs"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "DedicatedServerConfig.cfg"

    
    New-servercfgmom
    $global:launchParams = '@("$executable -MULTIHOME=`"${ip}`" -port=$port -queryport=${queryport} -maxplayers=${maxplayers}")'
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