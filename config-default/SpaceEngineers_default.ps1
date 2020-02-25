Function New-LaunchScriptSEserverPS {
  # Space Engineers Dedicated Server
  # 298740
  # https://www.spaceengineersgame.com/dedicated-servers.html
  ################## Change Default Variables #################
  #                       Server IP
  ${global:ip}            = "${ip}"
  #                       Server Port
  ${global:port}          = "27015"
  #                       Maxplayers
  $global:maxplayers      = "20"
  #                       Server Name
  $global:hostname        = "SERVERNAME"
  #                       World Name
  $global:worldname       = "WorldName"
  #                       World template
  $global:customworlds    = "Alien Planet"
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
  # You can run SpaceEngineersDedicated.executable with the following arguments
  # -console: skips instance selection dialog, dedicated server configuration dialog, and goes directly to console application
  #  -noconsole: will run without black console window
  # -path: will load config and store all files in path specified ("D:\Whatever\Something" in example)
  #  -ignorelastsession: ignores last automatic save of the world and uses values from config file
  #  -maxPlayers : overrides maximum players that can be in session
  # -ip:  overrides ip address of dedicated server stored in config file
  #  -port: overrides port value stored in config file

  # taskkill /IM SpaceEngineersDedicated.executable
  # This will stop the dedicated server correctly, saving the world etc.
  # To stop it immediately add argument "/f", which will kill the server without asking to stop and without saving the world.
  
  
  
  ################### WorkShop Install change below #####################    
  # Advanced Steam WorkShop Mods COnfiguration
  # Mod Directory
  $global:moddir = "$serverfiles\Content\Mods"
  # steam appID for SE regular game (workshop content tied to this appID)
  $global:reg_appID = '244850'
  # list of mods to download and copy to server mod folder
  $global:mods = "@('899070352', '877084878')"

  ###################### Do not change below #############################
  $global:systemdir = ""
  $global:executabledir = "$serverdir\DedicatedServer64"
  $global:executable = "SpaceEngineersDedicated"
  $global:querytype = "protocol-valve"
  $global:saves = "SpaceEngineersDedicated"
  $global:process = "SpaceEngineersDedicated"
  $global:servercfgdir = "$env:APPDATA\$saves"
  $global:logdirectory = "$env:APPDATA\$saves"
  
  #Game-server-configs \/
  $global:gamedirname = ""
  $global:servercfg = ""
  # Get-Servercfg
  # Select-RenameSource
  # game config
  # Select-EditSourceCFG
  New-servercfgse
   Write-Host "Creating Save Dir" -F M
   New-Item "$servercfgdir\Saves\$WORLDNAME\" -ItemType directory -Force -ErrorAction SilentlyContinue
   Write-Host "Copying World template to Save Dir" -F M
  copy-item "$serverfiles\Content\CustomWorlds\$CustomWorlds\*" "$servercfgdir\Saves\$WORLDNAME\" -ErrorAction SilentlyContinue
  $global:launchParams = '@("$executable -console -ip ${ip} -port ${port} -maxPlayers ${maxplayers}")'
}   
Function New-servercfgse {
  Write-Host "Creating Custom Config" -F M
  New-Item $servercfgdir\SpaceEngineers-Dedicated.cfg -ItemType File -Force
  
  Add-Content $servercfgdir\SpaceEngineers-Dedicated.cfg `
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
<LoadWorld>$servercfgdir\Saves\$WORLDNAME</LoadWorld>
<IP>0.0.0.0</IP>
<SteamPort>8766</SteamPort>
<ServerPort>27016</ServerPort>
<AsteroidAmount>0</AsteroidAmount>
<Administrators />
<Banned />
<GroupID>0</GroupID>
<ServerName>$hostname</ServerName>
<WorldName>$WORLDNAME</WorldName>
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