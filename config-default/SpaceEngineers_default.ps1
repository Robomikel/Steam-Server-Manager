Function New-LaunchScriptSEserverPS {
    # Space Engineers Dedicated Server
    # 298740
    # https://www.spaceengineersgame.com/dedicated-servers.html
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP} = "${global:IP}"
    #                       Server Port
    ${global:PORT} = "27015"
    #                       Maxplayers
    $global:MAXPLAYERS = "20"
    #                   Server Name
    $global:HOSTNAME = "$env:USERNAME"
    #                   World Name
    $global:WORLDNAME = "WorldName"
    #                   World template
    $global:CustomWorlds = "Alien Planet"
    ##############################/\##############################
    ##   World templates ##
    # Alien Planet
    # Crashed Red Ship
    # Dead Drop Arena
    # Earth Planet
    # Empty World
    # Green Station
    # Lone Survivor
    # Mars Planet
    # Moon Base
    # Red Ship
    # Rival Platforms
    # Star System
    ###############
    # You can run SpaceEngineersDedicated.exe with the following arguments
    # -console: skips instance selection dialog, dedicated server configuration dialog, and goes directly to console application
    #  -noconsole: will run without black console window
    # -path: will load config and store all files in path specified ("D:\Whatever\Something" in example)
    #  -ignorelastsession: ignores last automatic save of the world and uses values from config file
    #  -maxPlayers : overrides maximum players that can be in session
    # -ip:  overrides ip address of dedicated server stored in config file
    #  -port: overrides port value stored in config file

    # taskkill /IM SpaceEngineersDedicated.exe
    # This will stop the dedicated server correctly, saving the world etc.
    # To stop it immediately add argument "/f", which will kill the server without asking to stop and without saving the world.
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXEDIR = "DedicatedServer64"
    $global:EXE = "SpaceEngineersDedicated"
    $global:GAME = "protocol-valve"
    $global:SAVES = "SpaceEngineersDedicated"
    $global:PROCESS = "SpaceEngineersDedicated"
    $global:SERVERCFGDIR = "$env:APPDATA\$global:saves\"
    $global:LOGDIR = ""
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = ""
    $global:config1 = ""
    # Get-Servercfg
    # Select-RenameSource
    # game config
    # Select-EditSourceCFG
    New-servercfgse
    New-Item "$env:APPDATA\$global:saves\Saves\$global:WORLDNAME\" -ItemType directory -ErrorAction SilentlyContinue
    copy-item "$global:server\Content\CustomWorlds\$global:CustomWorlds\*" "$env:APPDATA\$global:saves\Saves\$global:WORLDNAME\" -ErrorAction SilentlyContinue
    $global:launchParams = '@("$global:EXEDIR\$global:EXE -console -ip ${global:IP} -port ${global:PORT} -maxPlayers $global:MAXPLAYERS")'
}   
Function New-servercfgse {
    New-Item $env:APPDATA\$global:saves\SpaceEngineers-Dedicated.cfg -ItemType File -Force
    
    Add-Content $env:APPDATA\$global:saves\SpaceEngineers-Dedicated.cfg `
"<?xml version=`"1.0`"?>
<MyConfigDedicated xmlns:xsd=`"http://www.w3.org/2001/XMLSchema`" xmlns:xsi=`"http://www.w3.org/2001/XMLSchema-instance`">
  <SessionSettings>
    <GameMode>Survival</GameMode>
    <InventorySizeMultiplier>3</InventorySizeMultiplier>
    <BlocksInventorySizeMultiplier>1</BlocksInventorySizeMultiplier>
    <AssemblerSpeedMultiplier>3</AssemblerSpeedMultiplier>
    <AssemblerEfficiencyMultiplier>3</AssemblerEfficiencyMultiplier>
    <RefinerySpeedMultiplier>3</RefinerySpeedMultiplier>
    <OnlineMode>PUBLIC</OnlineMode>
    <MaxPlayers>4</MaxPlayers>
    <MaxFloatingObjects>56</MaxFloatingObjects>
    <MaxBackupSaves>5</MaxBackupSaves>
    <MaxGridSize>0</MaxGridSize>
    <MaxBlocksPerPlayer>0</MaxBlocksPerPlayer>
    <TotalPCU>100000</TotalPCU>
    <PiratePCU>50000</PiratePCU>
    <MaxFactionsCount>0</MaxFactionsCount>
    <BlockLimitsEnabled>GLOBALLY</BlockLimitsEnabled>
    <EnableRemoteBlockRemoval>true</EnableRemoteBlockRemoval>
    <EnvironmentHostility>SAFE</EnvironmentHostility>
    <AutoHealing>true</AutoHealing>
    <EnableCopyPaste>false</EnableCopyPaste>
    <WeaponsEnabled>true</WeaponsEnabled>
    <ShowPlayerNamesOnHud>true</ShowPlayerNamesOnHud>
    <ThrusterDamage>true</ThrusterDamage>
    <CargoShipsEnabled>true</CargoShipsEnabled>
    <EnableSpectator>false</EnableSpectator>
    <WorldSizeKm>0</WorldSizeKm>
    <RespawnShipDelete>false</RespawnShipDelete>
    <ResetOwnership>false</ResetOwnership>
    <WelderSpeedMultiplier>2</WelderSpeedMultiplier>
    <GrinderSpeedMultiplier>2</GrinderSpeedMultiplier>
    <RealisticSound>false</RealisticSound>
    <HackSpeedMultiplier>0.33</HackSpeedMultiplier>
    <PermanentDeath>false</PermanentDeath>
    <AutoSaveInMinutes>5</AutoSaveInMinutes>
    <EnableSaving>true</EnableSaving>
    <InfiniteAmmo>false</InfiniteAmmo>
    <EnableContainerDrops>true</EnableContainerDrops>
    <SpawnShipTimeMultiplier>0</SpawnShipTimeMultiplier>
    <ProceduralDensity>0.35</ProceduralDensity>
    <ProceduralSeed>0</ProceduralSeed>
    <DestructibleBlocks>true</DestructibleBlocks>
    <EnableIngameScripts>false</EnableIngameScripts>
    <ViewDistance>15000</ViewDistance>
    <EnableToolShake>true</EnableToolShake>
    <VoxelGeneratorVersion>4</VoxelGeneratorVersion>
    <EnableOxygen>true</EnableOxygen>
    <EnableOxygenPressurization>true</EnableOxygenPressurization>
    <Enable3rdPersonView>true</Enable3rdPersonView>
    <EnableEncounters>true</EnableEncounters>
    <EnableConvertToStation>true</EnableConvertToStation>
    <StationVoxelSupport>false</StationVoxelSupport>
    <EnableSunRotation>true</EnableSunRotation>
    <EnableRespawnShips>true</EnableRespawnShips>
    <ScenarioEditMode>false</ScenarioEditMode>
    <Scenario>false</Scenario>
    <CanJoinRunning>false</CanJoinRunning>
    <PhysicsIterations>8</PhysicsIterations>
    <SunRotationIntervalMinutes>119.999992</SunRotationIntervalMinutes>
    <EnableJetpack>true</EnableJetpack>
    <SpawnWithTools>true</SpawnWithTools>
    <StartInRespawnScreen>false</StartInRespawnScreen>
    <EnableVoxelDestruction>true</EnableVoxelDestruction>
    <MaxDrones>5</MaxDrones>
    <EnableDrones>true</EnableDrones>
    <EnableWolfs>false</EnableWolfs>
    <EnableSpiders>false</EnableSpiders>
    <FloraDensityMultiplier>1</FloraDensityMultiplier>
    <EnableStructuralSimulation>false</EnableStructuralSimulation>
    <MaxActiveFracturePieces>50</MaxActiveFracturePieces>
    <BlockTypeLimits>
      <dictionary />
    </BlockTypeLimits>
    <EnableScripterRole>false</EnableScripterRole>
    <MinDropContainerRespawnTime>5</MinDropContainerRespawnTime>
    <MaxDropContainerRespawnTime>20</MaxDropContainerRespawnTime>
    <EnableTurretsFriendlyFire>false</EnableTurretsFriendlyFire>
    <EnableSubgridDamage>false</EnableSubgridDamage>
    <SyncDistance>3000</SyncDistance>
    <ExperimentalMode>false</ExperimentalMode>
    <AdaptiveSimulationQuality>true</AdaptiveSimulationQuality>
    <EnableVoxelHand>true</EnableVoxelHand>
    <RemoveOldIdentitiesH>0</RemoveOldIdentitiesH>
    <TrashRemovalEnabled>true</TrashRemovalEnabled>
    <StopGridsPeriodMin>15</StopGridsPeriodMin>
    <TrashFlagsValue>1562</TrashFlagsValue>
    <AFKTimeountMin>0</AFKTimeountMin>
    <BlockCountThreshold>20</BlockCountThreshold>
    <PlayerDistanceThreshold>500</PlayerDistanceThreshold>
    <OptimalGridCount>0</OptimalGridCount>
    <PlayerInactivityThreshold>0</PlayerInactivityThreshold>
    <PlayerCharacterRemovalThreshold>15</PlayerCharacterRemovalThreshold>
    <VoxelTrashRemovalEnabled>false</VoxelTrashRemovalEnabled>
    <VoxelPlayerDistanceThreshold>5000</VoxelPlayerDistanceThreshold>
    <VoxelGridDistanceThreshold>5000</VoxelGridDistanceThreshold>
    <VoxelAgeThreshold>24</VoxelAgeThreshold>
    <EnableResearch>true</EnableResearch>
    <EnableGoodBotHints>true</EnableGoodBotHints>
    <OptimalSpawnDistance>16000</OptimalSpawnDistance>
    <EnableAutorespawn>true</EnableAutorespawn>
    <EnableBountyContracts>true</EnableBountyContracts>
    <EnableSupergridding>false</EnableSupergridding>
    <EnableEconomy>false</EnableEconomy>
    <DepositsCountCoefficient>2</DepositsCountCoefficient>
    <DepositSizeDenominator>30</DepositSizeDenominator>
    <HarvestRatioMultiplier>1</HarvestRatioMultiplier>
    <TradeFactionsCount>15</TradeFactionsCount>
    <StationsDistanceInnerRadius>10000000</StationsDistanceInnerRadius>
    <StationsDistanceOuterRadiusStart>10000000</StationsDistanceOuterRadiusStart>
    <StationsDistanceOuterRadiusEnd>30000000</StationsDistanceOuterRadiusEnd>
    <EconomyTickInSeconds>1200</EconomyTickInSeconds>
  </SessionSettings>
  <LoadWorld>$env:APPDATA\$global:saves\Saves\$global:WORLDNAME</LoadWorld>
  <IP>0.0.0.0</IP>
  <SteamPort>8766</SteamPort>
  <ServerPort>27016</ServerPort>
  <AsteroidAmount>0</AsteroidAmount>
  <Administrators />
  <Banned />
  <GroupID>0</GroupID>
  <ServerName>$global:HOSTNAME</ServerName>
  <WorldName>$global:WORLDNAME</WorldName>
  <PauseGameWhenEmpty>false</PauseGameWhenEmpty>
  <MessageOfTheDay />
  <MessageOfTheDayUrl />
  <AutoRestartEnabled>true</AutoRestartEnabled>
  <AutoRestatTimeInMin>0</AutoRestatTimeInMin>
  <AutoRestartSave>true</AutoRestartSave>
  <AutoUpdateEnabled>false</AutoUpdateEnabled>
  <AutoUpdateCheckIntervalInMin>10</AutoUpdateCheckIntervalInMin>
  <AutoUpdateRestartDelayInMin>15</AutoUpdateRestartDelayInMin>
  <AutoUpdateSteamBranch />
  <AutoUpdateBranchPassword />
  <IgnoreLastSession>false</IgnoreLastSession>
  <PremadeCheckpointPath></PremadeCheckpointPath>
  <ServerDescription />
  <ServerPasswordHash />
  <ServerPasswordSalt>WVaBxgcY5v30SvAsj6r2zw==</ServerPasswordSalt>
  <Reserved />
  <RemoteApiEnabled>true</RemoteApiEnabled>
  <RemoteSecurityKey>/7YM8v7xAVgy/qE09myPag==</RemoteSecurityKey>
  <RemoteApiPort>8080</RemoteApiPort>
  <Plugins />
  <WatcherInterval>30</WatcherInterval>
  <WatcherSimulationSpeedMinimum>0.05</WatcherSimulationSpeedMinimum>
  <ManualActionDelay>5</ManualActionDelay>
  <ManualActionChatMessage>Server will be shut down in {0} min(s).</ManualActionChatMessage>
  <AutodetectDependencies>true</AutodetectDependencies>
  <SaveChatToLog>false</SaveChatToLog>
</MyConfigDedicated>"
}