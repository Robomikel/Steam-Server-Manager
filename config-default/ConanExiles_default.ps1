Function New-LaunchScriptceserverPS {
    # Conan: Exiles Dedicated server
    # APP ID # 443030        
    #  http://cdn.funcom.com/downloads/exiles/DedicatedServerLauncher1044.exe
    ################## Change Default Variables ################# 
    #'*** N+1 PORTS 7777,27015 - 7778,27016 - etc.. *****'
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Maxplayers
    $global:maxplayers      = "50"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Admin Password
    $global:adminpassword   = "$RANDOMPASSWORD"
    #                       Map # Delete string if you want default map
    $global:defaultmap      = "/Game/DLC_EXT/DLC_Siptah/Maps/DLC_Isle_of_Siptah"
    #                       Rcon Port
    $global:rconport        = "27103"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    ###########################/\#################################
 

    #ConanSandboxServer.exe -log -MaxPlayers=50 -Port=7777 -QueryPort=27015 -usedir=SERVER1
    #ConanSandboxServer.exe -log -MaxPlayers=50 -Port=7779 -QueryPort=27017 -usedir=SERVER2
    #ConanSandboxServer.exe -log -MaxPlayers=50 -Port=7781 -QueryPort=27019 -usedir=SERVER3
    # https://forums.funcom.com/t/hosting-a-dedicated-server-for-isle-of-siptah/136857
    #Engine.ini
    #[URL]
    #Port=7777
    
    #[OnlineSubsystemSteam]
    #ServerQueryPort=27015
    #ServerName=Your awesome server name
    #ServerPassword=
    # * still working on an update for the tool to allow for a dropdown menu. Until then, add this to engine.ini *
    #[/Script/EngineSettings.GameMapsSettings] 
    #ServerDefaultMap=/Game/DLC_EXT/DLC_Siptah/Maps/DLC_Isle_of_Siptah
    
    ################### WorkShop Install change below #####################    
    # Advanced Steam WorkShop Mods COnfiguration
    # Mod Directory
    $global:moddir = "$serverdir\ConanSandbox\Mods"
    # steam appID for SE regular game (workshop content tied to this appID)
    $global:reg_appID = '440900'
    # list of mods to download and copy to server mod folder
    $global:wsmods = "@('861928199', '1417350098')"
    # $global:wsmods = "@('861928199', '1417350098','1890943363','1843153194','1395510096')"
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\ConanSandbox\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "ConanSandboxServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "conanexiles"
    #                       Game Process
    $global:process         = "ConanSandboxServer-Win64-Test"
    #                       Log Directory 
    $global:logdirectory    = "$serverdir\ConanSandbox\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "ConanSandbox.log"
    #                       Game-Server-Config
    $global:servercfg       = "ServerSettings.ini "
    $global:config2         =  "Engine.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -log  -MaxPlayers=${maxplayers} -Port=${port} -QueryPort=${queryport} -RconEnabled=1 -RconPassword=${rconpassword} -RconPort=${rconport}")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Install Adjustment
    Set-Location $serverdir
    Start-Process cmd "/c StartServer.bat"
    while (!(Get-Process $process -ea SilentlyContinue )) {
        Wait-process -Name $process -Timeout 45 >$null 2>&1
    }
    Get-StopServer    
    # Add-Content $ssmlog "[$logdate] Editing Default Engine.ini "
    # Add-Content -Path $servercfgdir\Engine.ini -Value "ServerPassword=$SERVERPASSWORD"
    # Add-Content -Path $servercfgdir\Engine.ini -Value "ServerName=$hostname"
    # Add-Content $ssmlog "[$logdate] Editing Default ServerSettings.ini"
    # Add-Content -Path $servercfgdir\$servercfg -Value "AdminPassword=$ADMINPASSWORD"
    Get-ceserverInstallChanges
    Set-Location $currentdir
}

Function Get-ceserverInstallChanges {
    $modfiletext = "$moddir\modlist.txt"
    Add-Content $ssmlog "[$loggingDate] $modfiletext "
    If (Test-Path $modfiletext) { 
        Add-Content $ssmlog "[$loggingDate] $modfiletext exists! "
    }
    Else {
       New-Item $modfiletext -Force | Out-File -Append -Encoding Default  $ssmlog
    }
    if ($defaultmap) {
    New-Item $servercfgdir\$config2 -Force
    Add-Content   $servercfgdir\$config2 `
   "[OnlineSubsystem]
ServerName=$hostname
ServerPassword=$serverpassword
[/Script/EngineSettings.GameMapsSettings] 
ServerDefaultMap=/Game/DLC_EXT/DLC_Siptah/Maps/DLC_Isle_of_Siptah"
}
    New-Item $servercfgdir\$servercfg -Force
    Add-Content   $servercfgdir\$servercfg `
   "[ServerSettings]
AdminPassword=$ADMINPASSWORD
DedicatedServerLauncherSteamBranch=Live,TestLive
serverRegion=1
DedicatedServerLauncherAutoRestartEnabled=True
DedicatedServerLauncherStartIfNotRunningEnabled=True
DedicatedServerLauncherAutoRestartTime=712800
DedicatedServerLauncherAutoRestartMinimumUpTime=698400
DedicatedServerLauncherBackupEnabled=False
DedicatedServerLauncherAutoRestartPerDay=1
DedicatedServerLauncherKillSteamClient=False
DedicatedServerLauncherBackupTrimmingEnabled=False
DedicatedServerLauncherBackupTrimmingLimit=7
DedicatedServerLauncherScriptExecute=0
DedicatedServerLauncherAutoRestartWarningDelay1=691800
DedicatedServerLauncherAutoRestartWarningDelay2=691500
DedicatedServerLauncherAutoRestartWarningDelay3=691320
DedicatedServerLauncherAutoUpdateStrategy=1
DedicatedServerLauncherSteamCMDDisabled=False
DedicatedServerLauncherBackgroundCheckDelay=691500
DedicatedServerLauncherUseAllAvailableCores=False
DedicatedServerLauncherServerAffinityMask=3
DedicatedServerLauncherProcessPriority=0
DedicatedServerLauncherDiscordEnabled=False
DedicatedServerLauncherDiscordTimeStampsEnabled=False
IsBattlEyeEnabled=True
IsVACEnabled=True
DedicatedServerLauncherSteamUser=anonymous
NPCMindReadingMode=0
MaxNudity=0
ServerCommunity=0
ConfigVersion=10
BlueprintConfigVersion=19
PurgeNPCBuildingDamageMultiplier=(5.000000,5.000000,10.000000,15.000000,20.000000,25.000000)
PlayerKnockbackMultiplier=1.000000
NPCKnockbackMultiplier=1.000000
StructureDamageMultiplier=1.000000
StructureHealthMultiplier=1.000000
NPCRespawnMultiplier=1.000000
NPCHealthMultiplier=1.000000
PlayerDamageMultiplier=1.000000
PlayerDamageTakenMultiplier=1.000000
MinionDamageMultiplier=1.000000
MinionDamageTakenMultiplier=1.000000
NPCDamageMultiplier=1.000000
NPCDamageTakenMultiplier=1.000000
PlayerEncumbranceMultiplier=1.000000
PlayerEncumbrancePenaltyMultiplier=1.000000
PlayerMovementSpeedScale=1.000000
PlayerStaminaCostSprintMultiplier=1.000000
PlayerSprintSpeedScale=1.000000
PlayerStaminaCostMultiplier=1.000000
PlayerHealthRegenSpeedScale=1.000000
PlayerXPRateMultiplier=1.000000
PlayerXPKillMultiplier=1.000000
PlayerXPHarvestMultiplier=1.000000
PlayerXPCraftMultiplier=1.000000
PlayerXPTimeMultiplier=1.000000
DogsOfTheDesertSpawnWithDogs=False
CrossDesertOnce=True
ThrallExclusionRadius=500.000000
MaxAggroRange=9000.000000
FriendlyFireDamageMultiplier=0.250000
CampsIgnoreLandclaim=True
AvatarDomeDurationMultiplier=1.000000
AvatarDomeDamageMultiplier=1.000000
NPCMaxSpawnCapMultiplier=1.000000
PVPEnabled=False
RestrictPVPTime=False
RestrictPVPBuildingDamageTime=False
PVPTimeMondayStart=0
PVPTimeTuesdayStart=0
PVPTimeWednesdayStart=0
PVPTimeThursdayStart=0
PVPTimeFridayStart=0
PVPTimeSaturdayStart=0
PVPTimeSundayStart=0
PVPTimeMondayEnd=0
PVPTimeTuesdayEnd=0
PVPTimeWednesdayEnd=0
PVPTimeThursdayEnd=0
PVPTimeFridayEnd=0
PVPTimeSaturdayEnd=0
PVPTimeSundayEnd=0
PVPEnabledMonday=False
PVPEnabledTuesday=False
PVPEnabledWednesday=False
PVPEnabledThursday=False
PVPEnabledFriday=False
PVPEnabledSaturday=False
PVPEnabledSunday=False
PVPBuildingDamageTimeMondayStart=0
PVPBuildingDamageTimeTuesdayStart=0
PVPBuildingDamageTimeWednesdayStart=0
PVPBuildingDamageTimeThursdayStart=0
PVPBuildingDamageTimeFridayStart=0
PVPBuildingDamageTimeSaturdayStart=0
PVPBuildingDamageTimeSundayStart=0
PVPBuildingDamageTimeMondayEnd=0
PVPBuildingDamageTimeTuesdayEnd=0
PVPBuildingDamageTimeWednesdayEnd=0
PVPBuildingDamageTimeThursdayEnd=0
PVPBuildingDamageTimeFridayEnd=0
PVPBuildingDamageTimeSaturdayEnd=0
PVPBuildingDamageTimeSundayEnd=0
PVPBuildingDamageEnabledMonday=False
PVPBuildingDamageEnabledTuesday=False
PVPBuildingDamageEnabledWednesday=False
PVPBuildingDamageEnabledThursday=False
PVPBuildingDamageEnabledFriday=False
PVPBuildingDamageEnabledSaturday=False
PVPBuildingDamageEnabledSunday=False
VocalVisibilityDurationInMinutes=5
CombatModeModifier=0
ContainersIgnoreOwnership=True
LandClaimRadiusMultiplier=1.000000
DisableLandclaimNotifications=True
BuildingPreloadRadius=80.000000
CanDamagePlayerOwnedStructures=False
DynamicBuildingDamage=False
DynamicBuildingDamagePeriod=1800
KickAFKPercentage=80
KickAFKTime=2700
OfflinePlayersUnconsciousBodiesHours=168
CorpsesPerPlayer=10
ItemConvertionMultiplier=1.000000
ThrallConversionMultiplier=1.000000
FuelBurnTimeMultiplier=1.000000
CraftingCostMultiplier=1.000000
StaminaRegenerationTime=3.000000
StaminaExhaustionTime=3.000000
StaminaStaticRegenRateMultiplier=1.000000
StaminaMovingRegenRateMultiplier=1.000000
PlayerStaminaRegenSpeedScale=1.000000
StaminaOnConsumeRegenPause=1.500000
StaminaOnExhaustionRegenPause=2.750000
ThrallScoutingTimeMinutes=10.000000
ThrallMinDistanceAwayFromHome=5000.000000
ThrallTeleportingCooldown=10.000000
MinionPopulationBaseValue=50
MinionPopulationPerPlayer=5
MinionOverpopulationCleanup=60
MinionOverpopulationAllowed=10
UseMinionPopulationLimit=False
EnableFollowerRescueOnLandClaimOnly=True
EnableFollowerRescueInBuildExclusionZone=False
FollowerRescueCooldown=3600
DamageCooldownBeforeRescue=600
ThrallCorruptionRemovalMultiplier=1.000000
PlayerCorruptionGainMultiplier=1.000000
AnimalPenCraftingTimeMultiplier=1.000000
FeedBoxRangeMultiplier=1.000000
BuildingDamageMultiplier=1.000000
PathFollowingSendsAngularVelocity=False
UnconsciousTimeSeconds=1800.000000
ConciousnessDamageMultiplier=1.000000
MaxBuildingDecayTime=1296000.000000
MaxDecayTimeToAutoDemolish=604800.000000
ThrallDecayTime=1296000.000000
DisableThrallDecay=False
BuildingDecayTimePerScore=5400.000000
BuildingDecayTimeMultiplier=1.000000
DecayCleanupTimeMultiplier=2.000000
DecayBonusTimeRate=600.000000
DecayShowBuildingScore=False
EnableAutoFacingOnAttack=True
EnableTargetLock=True
ValidatePhysNavWalkWithRaycast=True
LocalNavMeshVisualizationFrequency=-1.000000
LocalLandClaimVisualizationFrequency=-1.000000
LocalLandClaimVisualizationRadius=3000
LocalLandClaimVisualizationChannel=0
UseLocalQuadraticAngularVelocityPrediction=False
LQAVPUseTime=0.150000
LQAVPFadeTime=0.100000
LQAVPMethod=2
NetworkSimulatedSmoothRotationTimeWithLQAVP=0.100000
EnableClanMarkers=True
ValidatePlayerStats=False
AllowedTimeUndermesh=-1.000000
AllowedDistanceUndermeshSquared=490000.000000
EventLogCauserPrivacy=1
serverVoiceChat=1
AvatarsDisabled=False
RestrictAvatarSummoningTime=False
AvatarSummoningTimeWeekdayStart=0
AvatarSummoningTimeWeekdayEnd=0
AvatarSummoningTimeWeekendStart=0
AvatarSummoningTimeWeekendEnd=0
AvatarLifetime=60.000000
AvatarSummonTime=60.000000
MaxDeathMapMarkers=3
MaxAllowedPing=0
RegionAllowAfrica=True
RegionAllowAsia=True
RegionAllowCentralEurope=True
RegionAllowEasternEurope=True
RegionAllowWesternEurope=True
RegionAllowNorthAmerica=True
RegionAllowOceania=True
RegionAllowSouthAmerica=True
bCanBeDamaged=True
DedicatedServerLauncherAutoRestartWarningMessage1=
DedicatedServerLauncherAutoRestartWarningMessage2=
DedicatedServerLauncherAutoRestartWarningMessage3=
DedicatedServerLauncherServerReadyMessage=
DedicatedServerLauncherServerRestartedMessage=
DedicatedServerLauncherServerShutdownMessage=
DedicatedServerLauncherDiscordWebHooks=
DedicatedServerLauncherDiscordUsername=
DedicatedServerLauncherModList=
DedicatedServerLauncherBackupPath=
DedicatedServerLauncherScriptPath=
DedicatedServerLauncherExtraCommandLineParameters=
"
    if ($defaultmap){
        Add-Content   $servercfgdir\$servercfg `
   "StormEnabled = true;
ElderThingsEnabled = true;
ElderThingsIdleLifespan = 30.f;
SiegeElderThingsEnabled = true;
StormCooldown = 75.f;
StormAccumulationTime = 15.f;
StormDuration = 30.f;
StormDissipationTime = 2.f;
StormEnduranceDrainMultiplier = 1.f;
ElderThingSpawnRate = 1.f;
StormTimeWeekdayStart = 0000;
StormTimeWeekdayEnd = 2359;
StormTimeWeekendStart = 0000;
StormTimeWeekendEnd = 2359;
StormMinimumOnlinePlayers = 0;
StormBuildingAllowed = false;
StormMapBlocker = true;
ElderThingSiegeDamageMultiplier = 1.f;
MinimumBuildingSizeToBeSieged = 41;
AmbientElderThingRespawnRate = 1.f;
SiegeElderThingRespawnRate = 1.f;
StormBuildingDamageRateMultiplier = 1.f;
MaxAmbientElderThings = 200;
MaxSiegeElderThings = 5;
MaxAmbushElderThings = 200;
ElderThingSiegeBuildingSizeMultiplier = 1.f;
StormBuildingDamageEnabled = true;
SiegeElderThingMapMarkers = false;
MinimumStormDamageBuildingPieces = 0;
StormBuildingDamageMultiplier = 1.f;
VaultRefreshTime = 105;
VaultRefreshDeviation = 30;
SurgeDeviationMin = 60;
SurgeDeviationMax = 60;
SurgeSacrificeRequirementMultiplier = 1.f;
SurgeDespawnTimer = 90; //Minutes
AltarModuleActiveTimeMultiplier = 1.f;
RandomSurgesCountMin = 6;
RandomSurgesCountMax = 10;
DecoupleSurgeFromStorm = false;
DecoupledSurgeCooldown = 5;"}    
}