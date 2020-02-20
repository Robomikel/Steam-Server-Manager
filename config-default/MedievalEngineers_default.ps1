Function New-LaunchScriptMEserverPS {
    # Medieval Engineers Dedicated Server
    # 367970
    # https://www.medievalengineerswiki.com/index.php?title=Keen:Dedicated_Server_Configuration
    ################## Change Default Variables #################
    #                       Server IP
    ${global:ip} = "${global:IP}"
    #                       Server Port
    ${global:port} = "27015"
    #                       Maxplayers
    $global:maxplayers = "20"
    #                   Server Name
    $global:hostname    = "$env:USERNAME"
    #                   World Name
    $global:worldname    = "WorldName"
    ##############################/\##############################
    
    # You can run MedievalEngineersDedicated.executable with the following arguments

    # console
    # skips instance selection dialog, dedicated server configuration dialog, and goes directly to console application
    # noconsole
    # will run without black console window
    # path
    # will load config and store all files in path specified (“D:\Whatever\Something” in example)
    # ignorelastsession
    # ignores last automatic save of the world and uses values from config file
    # maxPlayers
    # overrides maximum players that can be in session
    # ip
    # overrides ip address of dedicated server stored in config file
    # port
    # overrides port value stored in config file
    # taskkill /IM MedievalEngineersDedicated.executable
    # this will stop dedicated server correctly, saving the world etc
    # To stop it immediately add argument “/f”, that will kill server without asking to stop and without saving the world
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executabledir = "DedicatedServer64"
    $global:executable = "MedievalEngineersDedicated"
    $global:querytype = "protocol-valve"
    $global:saves = "MedievalEngineersDedicated"
    $global:process = "MedievalEngineersDedicated"
    $global:servercfgdir = ""
    $global:logdir = "$env:APPDATA\$global:saves"
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = ""
    $global:servercfg = ""
    # Get-Servercfg
    # Select-RenameSource
    # game config
    # Select-EditSourceCFG
    New-servercfgme
    $global:launchParams = '@("$executabledir\$executable -console -ip ${ip} -port ${port} -maxPlayers ${maxplayers}")'
}   


Function New-servercfgme {
    Write-Host "Creating Custom Config" -F M
    New-Item $env:APPDATA\$saves\MedievalEngineersDedicated-Dedicated.cfg -ItemType File -Force
    
    Add-Content $env:APPDATA\$saves\MedievalEngineersDedicated-Dedicated.cfg `
"
<?xml version=`"1.0`"?>
<MyConfigDedicated xmlns:xsd=`"http://www.w3.org/2001/XMLSchema`" xmlns:xsi=`"http://www.w3.org/2001/XMLSchema-instance`">
  <SessionSettings>
    <GameMode>Creative</GameMode>
    <InventorySizeMultiplier>1</InventorySizeMultiplier>
    <OnlineMode>PUBLIC</OnlineMode>
    <MaxPlayers>4</MaxPlayers>
    <MaxFloatingObjects>64</MaxFloatingObjects>
    <MaxBackupSaves>5</MaxBackupSaves>
    <EnableSpectator>false</EnableSpectator>
    <EnableCopyPaste>true</EnableCopyPaste>
    <ShowPlayerNamesOnHud>true</ShowPlayerNamesOnHud>
    <AutoSaveInMinutes>0</AutoSaveInMinutes>
    <ProceduralSeed>0</ProceduralSeed>
    <DestructibleBlocks>true</DestructibleBlocks>
    <ViewDistance>2600</ViewDistance>
    <Enable3rdPersonView>true</Enable3rdPersonView>
    <EnableSunRotation>true</EnableSunRotation>
    <PhysicsIterations>4</PhysicsIterations>
    <SunRotationIntervalMinutes>120</SunRotationIntervalMinutes>
    <DaysPerSeason>4</DaysPerSeason>
    <MaxSolarAltitude>0.41</MaxSolarAltitude>
    <EnableVoxelDestruction>true</EnableVoxelDestruction>
    <EnableStructuralSimulation>true</EnableStructuralSimulation>
    <MessageOfTheDay />
    <ServerSideChatLogging>true</ServerSideChatLogging>
    <EnableLargeDynamicGridDecay>true</EnableLargeDynamicGridDecay>
    <MaximumBots>3</MaximumBots>
    <EnableHostileAI>true</EnableHostileAI>
    <EnableFastTravel>true</EnableFastTravel>
    <EnableTravelReachability>true</EnableTravelReachability>
    <MaxActiveFracturePieces>50</MaxActiveFracturePieces>
  </SessionSettings>
  <Scenario Type=`"ScenarioDefinition`" Subtype=`"ArenaStart`" />
  <LoadWorld />
  <IP>0.0.0.0</IP>
  <SteamPort>8766</SteamPort>
  <ServerPort>27016</ServerPort>
  <Administrators />
  <Banned />
  <Mods />
  <GroupID>0</GroupID>
  <ServerName>$hostname</ServerName>
  <WorldName>$WORLDNAME</WorldName>
  <PauseGameWhenEmpty>false</PauseGameWhenEmpty>
  <IgnoreLastSession>false</IgnoreLastSession>
  <RemoteApiEnabled>true</RemoteApiEnabled>
  <PublicRemoteApiEnabled>true</PublicRemoteApiEnabled>
  <RemoteSecurityKey>&lt;Click Generate&gt;</RemoteSecurityKey>
  <RemoteApiPort>8080</RemoteApiPort>
</MyConfigDedicated>"
    }