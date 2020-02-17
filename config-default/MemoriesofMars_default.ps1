Function New-LaunchScriptMemoriesofMarsServerPS {
    # Memories of Mars - Dedicated Server
    # APP ID # 897590
    ################## Change Default Variables #################

    #                       Maxplayers
    $global:MAXPLAYERS      = "2"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Server Password
    $global:SERVERPASSWORD  = ""
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "MemoriesOfMarsServer"
    $global:EXEDIR = "Game\Binaries\Win64\"
    $global:GAME = ""
    $global:PROCESS = "MemoriesOfMarsServer"
    $global:SERVERCFGDIR = "ShooterGame\Saved\Config\WindowsServer"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "DedicatedServerConfig.cfg"

    
    New-servercfgmom
    $global:launchParams = '@("$global:EXEDIR\$global:EXE")'
} 
Function New-servercfgmom {
    Set-Location 
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