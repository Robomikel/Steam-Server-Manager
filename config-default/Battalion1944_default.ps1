Function New-LaunchScriptBT1944serverPS {
    #* * Add to Read-AppID in fn_Actions.ps1 * *
    # Battalion 1944 Dedicated Server
    # APP ID # 805140
    # 
    ################## Change Default Variables #################
    #                       Server IP 
    $global:ip              = "${global:IP}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "7780"
    ##############################/\##############################
    
    
    
    ###################### Do not change below #####################
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = ""
    #--->Exe NOT in root server folder \/\/
    $global:executabledir= "Windows\Battalion\Binaries\Win64"
    #--->rename srcds to this name \/\/
    $global:executable = "BattalionServer"
    #--->Requieres \/ \/ game dig
    $global:querytype = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:saves = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:process = "BattalionServer"
    #--->game config folder
    $global:servercfgdir = "Windows"
    $global:logdir = "Windows\Battalion\Saved\Logs"  

    #--->Stop existing process if running 
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "Battalion1944"
    #--->Game-server-manger config name \/
    $global:servercfg = "DefaultGame.ini"
    #--->Get game-server-config \/\/
    Get-Servercfg

    #--->input questions 1 1 0 0 0 0 0 1 0 1 1 0 0
    #Get-UserInput 1 1 0 0 0 0 0 1 0 1 0 0 0
    #--->rename srcds.exe \/\/
    # Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    # Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$executabledir\$executable  /Game/Maps/Final_Maps/Derailed?Game=/Script/ShooterGame.WartideGameMode?listen -broadcastip=`"${extip}`" -PORT=${port} -QueryPort=${queryport} -log -defgameini=`"..\..\..\DefaultGame.ini`"")'
    # OR    EXE NOT In server folder ROOT add executabledir\/ \/
    #$launchParams = '@("$executabledir\$executable -< LAUNCH PARAMS HERE >-")'
}