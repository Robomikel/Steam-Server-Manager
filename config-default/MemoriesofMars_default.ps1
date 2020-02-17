Function New-LaunchScriptMemoriesofMarsServerPS {
    # Memories of Mars - Dedicated Server
    # APP ID # 897590
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Maxplayers
    $global:MAXPLAYERS      = "2"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Server Password
    $global:SERVERPASSWORD  = ""
    #                       Server Port
    $global:PORT            = "7777"
    #                       Query Port
    $global:QUERYPORT       = "27015"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "MemoriesOfMarsServer"
    $global:EXEDIR = "Game\Binaries\Win64\"
    $global:GAME = ""
    $global:PROCESS = "MemoriesOfMarsServer"
    $global:SERVERCFGDIR = "ShooterGame\Saved\Config\WindowsServer"
    $global:LOGDIR = "Game\Saved\Logs"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "DedicatedServerConfig.cfg"

    
    New-servercfgmom
    $global:launchParams = '@("$global:EXEDIR\$global:EXE -MULTIHOME=`"${global:IP}`" -port=$global:PORT -queryport=$global:QUERYPORT -maxplayers=$global:MAXPLAYERS")'
} 
Function New-servercfgmom {
    Write-Host "Creating Custom Config" -F M
    Rename-Item "$global:currentdir\$global:server\DedicatedServerConfig.cfg" "$global:currentdir\$global:server\DedicatedServerConfig.cfg.bak" -ea SilentlyContinue
    New-Item $global:server\DedicatedServerConfig.cfg -ItemType File -Force
    
    Add-Content $global:server\DedicatedServerConfig.cfg `
"{
    `"ServerName`": `"$global:HOSTNAME`",
    `"ServerPassword`": `"$global:SERVERPASSWORD`",
    `"ServerID`": `"mom_dedicated_01`",
    `"MapName`": `"Main`",
    `"MaxPlayers`":  $global:MAXPLAYERS,
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