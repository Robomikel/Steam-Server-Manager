

Function New-LaunchScriptInssserverPS {
        #----------   INS: Sandstorm Server Install Function   -------------------
        # APP ID # 581330
        # tested 2.23.20
        ################## Change Default Variables #################
        #                       Server Scenario 
        $global:scenario        = "Scenario_Outskirts_Checkpoint_Security"
        #                       Server Map 
        $global:defaultmap      = "Compound"
        #                       Server max Players 
        $global:maxplayers      = "8"
        #                       Server Port   
        $global:port            = "27102"
        #                       Server Query Port  
        $global:queryport       = "27131"
        #                       Server Name       
        $global:hostname        = "SERVERNAME"
        #                       Server Password
        $global:serverpassword  = ""
        #                       Server Rcon Port
        $global:rconport         = "27103"
        #                       Server Rcon Password
        $global:rconpassword    = "$RANDOMPASSWORD"
        #                       Server Admin Steam ID 64
        $global:steamid64       = ""
        ##############################/\############################## 
        ###################### Do not change below #####################
        #                               System Directory
        $global:systemdir               = "$serverdir"
        #                               Server Config Directory
        $global:servercfgdir            = "$serverdir\Insurgency\Saved\Config\WindowsServer"
        #                               Server Executable
        $global:executable              = "InsurgencyServer"
        #                               Server Executable Directory
        $global:executabledir           = "$serverdir"
        #                               Gamedig Query
        $global:querytype               = "insurgencysandstorm"
        #                               Game Process
        $global:process                 = "InsurgencyServer-Win64-Shipping"
        #                               Log Directory
        $global:logdirectory            = "$serverdir\Insurgency\Saved\Logs"
        

        #                               Server Launch Command
        If ($SERVERPASSWORD -ne "") {
    
                $global:launchParams    = '@("$executable ${defaultmap}?Scenario=${scenario}?MaxPlayers=${maxplayers}?password=${serverpassword} -Port=${port} -QueryPort=${queryport} -log -hostname=`"${hostname}`"")'
        }
        Else {
                $global:launchParams    = '@("$executable ${defaultmap}?Scenario=${scenario}?MaxPlayers=${maxplayers} -Port=${port} -QueryPort=${queryport} -log -hostname=`"${hostname}`"")'     
        }

        # Custom config 
        mkdir $serverdir\Insurgency\Config\Server   >$null 2>&1
        $MapCyclePath = "$serverdir\Insurgency\Config\Server"  
        mkdir $servercfgdir   >$null 2>&1

        # Creates a Default Admins.txt
        Write-Host "***  Creating Admins.txt  ***" -ForegroundColor Magenta -BackgroundColor Black
        New-Item $MapCyclePath\Admins.txt -Force
        Add-Content  $MapCyclePath\Admins.txt $steamID64
    
        # Create a Default Mapcycle.txt 
        Write-Host "***  Creating Mapcycle.txt  ***" -ForegroundColor Magenta -BackgroundColor Black
        New-Item $MapCyclePath\Mapcycle.txt -Force
        
        # - - - - - - MAPCYCLE.TXT - - - - - - # EDIT \/   \/   \/  \/  \/  \/ \/ \/ \/
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Ministry_Checkpoint_Security
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Outskirts_Checkpoint_Security
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Summit_Checkpoint_Security
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Crossing_Checkpoint_Security
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Precinct_Checkpoint_Security
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Refinery_Checkpoint_Security 
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Farmhouse_Checkpoint_Security
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Hideout_Checkpoint_Security 
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Hillside_Checkpoint_Security
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Outskirts_Checkpoint_Insurgents
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Summit_Checkpoint_Insurgents
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Crossing_Checkpoint_Insurgents
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Precinct_Checkpoint_Insurgents
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Refinery_Checkpoint_Insurgents 
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Farmhouse_Checkpoint_Insurgents
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Hideout_Checkpoint_Insurgents
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Ministry_Checkpoint_Insurgents
        Add-Content   $MapCyclePath\Mapcycle.txt Scenario_Hillside_Checkpoint_Insurgents
        
        
        # - - - - - - Game.ini - - - -##  EDIT \/   \/   \/  \/  \/  \/ \/ \/ \/
        Write-Host "***  Creating Game.ini  ***" -ForegroundColor Magenta -BackgroundColor Black
        New-Item $servercfgdir\Game.ini -Force
        Add-Content   $servercfgdir\Game.ini ";.........Start Game.ini..................................."
        Add-Content   $servercfgdir\Game.ini [Rcon]
        Add-Content   $servercfgdir\Game.ini bEnabled=True
        Add-Content   $servercfgdir\Game.ini Password=$RCONPASSWORD
        Add-Content   $servercfgdir\Game.ini ListenPort=$RCONPORT
        Add-Content   $servercfgdir\Game.ini bUseBroadcastAddress=True
        Add-Content   $servercfgdir\Game.ini ListenAddressOverride=0.0.0.0
        Add-Content   $servercfgdir\Game.ini bAllowConsoleCommands=True
        Add-Content   $servercfgdir\Game.ini MaxPasswordAttempts=3
        Add-Content   $servercfgdir\Game.ini IncorrectPasswordBanTime=30
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.insgamemode]
        Add-Content   $servercfgdir\Game.ini ServerHostname=`"$hostname`"
        Add-Content   $servercfgdir\Game.ini bKillFeed=False
        Add-Content   $servercfgdir\Game.ini bKillFeedSpectator=True
        Add-Content   $servercfgdir\Game.ini bKillerInfo=True
        Add-Content   $servercfgdir\Game.ini bKillerInfoRevealDistance=False
        Add-Content   $servercfgdir\Game.ini TeamKillLimit=3
        Add-Content   $servercfgdir\Game.ini TeamKillGrace=0.2
        Add-Content   $servercfgdir\Game.ini TeamKillReduceTime=90
        Add-Content   $servercfgdir\Game.ini bDeadSay=False
        Add-Content   $servercfgdir\Game.ini bDeadSayTeam=True
        Add-Content   $servercfgdir\Game.ini bVoiceAllowDeadChat=False
        Add-Content   $servercfgdir\Game.ini bVoiceEnemyHearsLocal=True
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.insmultiplayermode]
        Add-Content   $servercfgdir\Game.ini GameStartingIntermissionTime=5
        Add-Content   $servercfgdir\Game.ini WinTime=5
        Add-Content   $servercfgdir\Game.ini PostRoundTime=15
        Add-Content   $servercfgdir\Game.ini PostGameTime=15
        Add-Content   $servercfgdir\Game.ini bAutoAssignTeams=True
        Add-Content   $servercfgdir\Game.ini bAllowFriendlyFire=True
        Add-Content   $servercfgdir\Game.ini FriendlyFireModifier=0.2
        Add-Content   $servercfgdir\Game.ini FriendlyFireReflect=0
        Add-Content   $servercfgdir\Game.ini bAutoBalanceTeams=True
        Add-Content   $servercfgdir\Game.ini AutoBalanceDelay=10
        Add-Content   $servercfgdir\Game.ini bMapVoting=True
        Add-Content   $servercfgdir\Game.ini bUseMapCycle=True
        Add-Content   $servercfgdir\Game.ini bVoiceIntermissionAllowAll=True
        Add-Content   $servercfgdir\Game.ini IdleLimit=150
        Add-Content   $servercfgdir\Game.ini IdleLimitLowReinforcements=90
        Add-Content   $servercfgdir\Game.ini IdleCheckFrequency=30
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini ";Any of the below settings under the general sections can be applied globally by putting them in the appropriate INI section"
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.insgamemode]
        Add-Content   $servercfgdir\Game.ini ObjectiveCaptureTime=Varies
        Add-Content   $servercfgdir\Game.ini ObjectiveResetTime=-1
        Add-Content   $servercfgdir\Game.ini ObjectiveSpeedup=0.25
        Add-Content   $servercfgdir\Game.ini ObjectiveMaxSpeedupPlayers=4
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.insmultiplayermode]
        Add-Content   $servercfgdir\Game.ini MinimumPlayers=1
        Add-Content   $servercfgdir\Game.ini RoundLimit=Varies
        Add-Content   $servercfgdir\Game.ini WinLimit=Varies
        Add-Content   $servercfgdir\Game.ini GameTimeLimit=-1
        Add-Content   $servercfgdir\Game.ini PreRoundTime=10
        Add-Content   $servercfgdir\Game.ini RoundTime=Varies
        Add-Content   $servercfgdir\Game.ini OverTime=60
        Add-Content   $servercfgdir\Game.ini TeamSwitchTime=10
        Add-Content   $servercfgdir\Game.ini SwitchTeamsEveryRound=Varies
        Add-Content   $servercfgdir\Game.ini bAllowPlayerTeamSelect=True
        Add-Content   $servercfgdir\Game.ini bBots=False
        Add-Content   $servercfgdir\Game.ini BotQuota=Varies
        Add-Content   $servercfgdir\Game.ini InitialSupply=15
        Add-Content   $servercfgdir\Game.ini MaximumSupply=15
        Add-Content   $servercfgdir\Game.ini bSupplyGainEnabled=False
        Add-Content   $servercfgdir\Game.ini bAwardSupplyInstantly=False
        Add-Content   $servercfgdir\Game.ini SupplyGainFrequency=150
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.inspushgamemode]
        Add-Content   $servercfgdir\Game.ini RoundTimeExtension=300
        Add-Content   $servercfgdir\Game.ini AttackerWavesPerObjective=5
        Add-Content   $servercfgdir\Game.ini AttackerWaveDPR=0.25
        Add-Content   $servercfgdir\Game.ini AttackerWaveTimer=20
        Add-Content   $servercfgdir\Game.ini DefenderWavesPerObjective=5
        Add-Content   $servercfgdir\Game.ini DefenderWaveDPR=0.25
        Add-Content   $servercfgdir\Game.ini DefenderWaveTimer=35
        Add-Content   $servercfgdir\Game.ini LastStandSetupDelay=10
        Add-Content   $servercfgdir\Game.ini AdvanceAttackerSpawnsDelay=30
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.insfrontlinegamemode]
        Add-Content   $servercfgdir\Game.ini StartingWaves=15
        Add-Content   $servercfgdir\Game.ini CapturingBonusWave=2
        Add-Content   $servercfgdir\Game.ini RegressSpawnsTimer=20
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.insskirmishgamemode]
        Add-Content   $servercfgdir\Game.ini DefaultReinforcementWaves=5
        Add-Content   $servercfgdir\Game.ini CaptureBonusWaves=1
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.insfirefightgamemode]
        Add-Content   $servercfgdir\Game.ini ";none"
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.inscoopmode]
        Add-Content   $servercfgdir\Game.ini AIDifficulty=0.5
        Add-Content   $servercfgdir\Game.ini bUseVehicleInsertion=True
        Add-Content   $servercfgdir\Game.ini FriendlyBotQuota=4
        Add-Content   $servercfgdir\Game.ini MinimumEnemies=6
        Add-Content   $servercfgdir\Game.ini MaximumEnemies=12
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.inscheckpointgamemode]
        Add-Content   $servercfgdir\Game.ini DefendTimer=90
        Add-Content   $servercfgdir\Game.ini DefendTimerFinal=180
        Add-Content   $servercfgdir\Game.ini RetreatTimer=10
        Add-Content   $servercfgdir\Game.ini RespawnDPR=0.1
        Add-Content   $servercfgdir\Game.ini RespawnDelay=20
        Add-Content   $servercfgdir\Game.ini PostCaptureRushTimer=30
        Add-Content   $servercfgdir\Game.ini CounterAttackRespawnDPR=0.2
        Add-Content   $servercfgdir\Game.ini CounterAttackRespawnDelay=20
        Add-Content   $servercfgdir\Game.ini ObjectiveTotalEnemyRespawnMultiplierMin=1
        Add-Content   $servercfgdir\Game.ini ObjectiveTotalEnemyRespawnMultiplierMax=1
        Add-Content   $servercfgdir\Game.ini FinalCacheBotQuotaMultiplier=1.5
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.teaminfo]
        Add-Content   $servercfgdir\Game.ini bVotingEnabled=True
        Add-Content   $servercfgdir\Game.ini TeamVoteIssues=/Script/Insurgency.VoteIssueKick
        Add-Content   $servercfgdir\Game.ini MinimumPlayersRequired=3
        Add-Content   $servercfgdir\Game.ini bRequiresMinimumToStart=True
        Add-Content   $servercfgdir\Game.ini MinimumPlayerRatio=0.25
        Add-Content   $servercfgdir\Game.ini VotePassRatio=0.75
        Add-Content   $servercfgdir\Game.ini MinimumYesNoDifference=2
        Add-Content   $servercfgdir\Game.ini VoteTimeout=90
        Add-Content   $servercfgdir\Game.ini bCanTargetEnemies=False
        Add-Content   $servercfgdir\Game.ini IdleVoteBanDuration=-1
        Add-Content   $servercfgdir\Game.ini DefaultVoteBanDuration=120
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini ";"
        Add-Content   $servercfgdir\Game.ini ";All Mutator settings go in Engine.ini"
        Add-Content   $servercfgdir\Game.ini ";(will bechanged to Game.ini in the future for consistency)."
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.mutator_headshotonly]
        Add-Content   $servercfgdir\Game.ini bCheckMeleeDamage=false
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.mutator_hotpotato]
        Add-Content   $servercfgdir\Game.ini GrenadeClass=/Game/Game/Actors/Projectiles/BP_Projectile_M67.BP_Projectile_M67_C
        Add-Content   $servercfgdir\Game.ini ThrowbackWeaponClass=/Game/Game/Actors/Weapons/Grenade/BP_Grenade_M67.BP_Grenade_M67_C
        Add-Content   $servercfgdir\Game.ini bIgnoreHeadshots=false
        Add-Content   $servercfgdir\Game.ini bBotsOnly=false
        Add-Content   $servercfgdir\Game.ini " "
        Add-Content   $servercfgdir\Game.ini [/script/insurgency.mutator_vampirism]
        Add-Content   $servercfgdir\Game.ini bCountFriendlyFire=Vampirism_bCountFriendlyFire
        Add-Content   $servercfgdir\Game.ini MaxHealth=1000
        Add-Content   $servercfgdir\Game.ini ";............End Game.ini"
}
