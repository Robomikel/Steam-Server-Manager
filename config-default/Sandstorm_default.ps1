

Function New-LaunchScriptInssserverPS {
        #----------   INS: Sandstorm Server Install Function   -------------------
        # APP ID # 581330
        ################## Change Default Variables #################
        #                       Server Scenario 
        $global:SCENARIO        = "Scenario_Outskirts_Checkpoint_Security"
        #                       Server Map 
        $global:MAP             = "Compound"
        #                       Server max Players 
        $global:MAXPLAYERS      = "8"
        #                       Server Port   
        $global:PORT            = "27102"
        #                       Server Query Port  
        $global:QUERYPORT       = "27131"
        #                       Server Name       
        $global:HOSTNAME        = "$env:USERNAME"
        #                       Server Password
        $global:SERVERPASSWORD  = ""
        #                       Server Rcon Port
        $global:RCONPORT         = "27103"
        #                       Server Rcon Password
        $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
        #                       Server Admin Steam ID 64
        $global:steamID64       = ""
        ##############################/\############################## 
        
        
        
        ###################### Do not change below #####################

        # $global:MODDIR=""
        $global:EXE = "InsurgencyServer"
        $global:EXEDIR = ""
        $global:GAME = "insurgencysandstorm"
        $global:PROCESS = "InsurgencyServer-Win64-Shipping"
        $global:SERVERCFGDIR = ""
        $global:LOGDIR = ""
        Get-StopServerInstall

        #  Version 2 Launch Param
        If ($global:SERVERPASSWORD -ne "") {
    
                $global:launchParams = '@("$global:EXE ${global:MAP}?Scenario=${global:SCENARIO}?MaxPlayers=${global:MAXPLAYERS}?password=${global:SERVERPASSWORD} -Port=${global:PORT} -QueryPort=${global:QUERYPORT} -log -hostname=`"${global:HOSTNAME}`"")'
        }
        Else {
                $global:launchParams = '@("$global:EXE ${global:MAP}?Scenario=${global:SCENARIO}?MaxPlayers=${global:MAXPLAYERS} -Port=${global:PORT} -QueryPort=${global:QUERYPORT} -log -hostname=`"${global:HOSTNAME}`"")'     
        }

        # Custom config game based
        mkdir $global:currentdir\$global:server\Insurgency\Config\Server   >$null 2>&1
        $MapCyclePath = "$global:currentdir\$global:server\Insurgency\Config\Server"  
        mkdir $global:currentdir\$global:server\Insurgency\Saved\Config\WindowsServer   >$null 2>&1
        $GamePath = "$global:currentdir\$global:server\Insurgency\Saved\Config\WindowsServer"

        # Creates a Default Admins.txt
        Write-Host "***  Creating Admins.txt  ***" -ForegroundColor Magenta -BackgroundColor Black
        New-Item $MapCyclePath\Admins.txt -Force
        Add-Content  $MapCyclePath\Admins.txt $global:steamID64
    
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
        
        
        # - - - - - - GAME.INI - - - -##  EDIT \/   \/   \/  \/  \/  \/ \/ \/ \/
        Write-Host "***  Creating Game.ini  ***" -ForegroundColor Magenta -BackgroundColor Black
        New-Item $GamePath\Game.ini -Force
        Add-Content   $GamePath\Game.ini ";.........Start Game.ini..................................."
        Add-Content   $GamePath\Game.ini [Rcon]
        Add-Content   $GamePath\Game.ini bEnabled=True
        Add-Content   $GamePath\Game.ini Password=$global:RCONPASSWORD
        Add-Content   $GamePath\Game.ini ListenPort=$global:RCONPORT
        Add-Content   $GamePath\Game.ini bUseBroadcastAddress=True
        Add-Content   $GamePath\Game.ini ListenAddressOverride=0.0.0.0
        Add-Content   $GamePath\Game.ini bAllowConsoleCommands=True
        Add-Content   $GamePath\Game.ini MaxPasswordAttempts=3
        Add-Content   $GamePath\Game.ini IncorrectPasswordBanTime=30
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini [/script/insurgency.insgamemode]
        Add-Content   $GamePath\Game.ini ServerHostname=`"$global:HOSTNAME`"
        Add-Content   $GamePath\Game.ini bKillFeed=False
        Add-Content   $GamePath\Game.ini bKillFeedSpectator=True
        Add-Content   $GamePath\Game.ini bKillerInfo=True
        Add-Content   $GamePath\Game.ini bKillerInfoRevealDistance=False
        Add-Content   $GamePath\Game.ini TeamKillLimit=3
        Add-Content   $GamePath\Game.ini TeamKillGrace=0.2
        Add-Content   $GamePath\Game.ini TeamKillReduceTime=90
        Add-Content   $GamePath\Game.ini bDeadSay=False
        Add-Content   $GamePath\Game.ini bDeadSayTeam=True
        Add-Content   $GamePath\Game.ini bVoiceAllowDeadChat=False
        Add-Content   $GamePath\Game.ini bVoiceEnemyHearsLocal=True
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini [/script/insurgency.insmultiplayermode]
        Add-Content   $GamePath\Game.ini GameStartingIntermissionTime=5
        Add-Content   $GamePath\Game.ini WinTime=5
        Add-Content   $GamePath\Game.ini PostRoundTime=15
        Add-Content   $GamePath\Game.ini PostGameTime=15
        Add-Content   $GamePath\Game.ini bAutoAssignTeams=True
        Add-Content   $GamePath\Game.ini bAllowFriendlyFire=True
        Add-Content   $GamePath\Game.ini FriendlyFireModifier=0.2
        Add-Content   $GamePath\Game.ini FriendlyFireReflect=0
        Add-Content   $GamePath\Game.ini bAutoBalanceTeams=True
        Add-Content   $GamePath\Game.ini AutoBalanceDelay=10
        Add-Content   $GamePath\Game.ini bMapVoting=True
        Add-Content   $GamePath\Game.ini bUseMapCycle=True
        Add-Content   $GamePath\Game.ini bVoiceIntermissionAllowAll=True
        Add-Content   $GamePath\Game.ini IdleLimit=150
        Add-Content   $GamePath\Game.ini IdleLimitLowReinforcements=90
        Add-Content   $GamePath\Game.ini IdleCheckFrequency=30
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini ";Any of the below settings under the general sections can be applied globally by putting them in the appropriate INI section"
        Add-Content   $GamePath\Game.ini [/script/insurgency.insgamemode]
        Add-Content   $GamePath\Game.ini ObjectiveCaptureTime=Varies
        Add-Content   $GamePath\Game.ini ObjectiveResetTime=-1
        Add-Content   $GamePath\Game.ini ObjectiveSpeedup=0.25
        Add-Content   $GamePath\Game.ini ObjectiveMaxSpeedupPlayers=4
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini [/script/insurgency.insmultiplayermode]
        Add-Content   $GamePath\Game.ini MinimumPlayers=1
        Add-Content   $GamePath\Game.ini RoundLimit=Varies
        Add-Content   $GamePath\Game.ini WinLimit=Varies
        Add-Content   $GamePath\Game.ini GameTimeLimit=-1
        Add-Content   $GamePath\Game.ini PreRoundTime=10
        Add-Content   $GamePath\Game.ini RoundTime=Varies
        Add-Content   $GamePath\Game.ini OverTime=60
        Add-Content   $GamePath\Game.ini TeamSwitchTime=10
        Add-Content   $GamePath\Game.ini SwitchTeamsEveryRound=Varies
        Add-Content   $GamePath\Game.ini bAllowPlayerTeamSelect=True
        Add-Content   $GamePath\Game.ini bBots=False
        Add-Content   $GamePath\Game.ini BotQuota=Varies
        Add-Content   $GamePath\Game.ini InitialSupply=15
        Add-Content   $GamePath\Game.ini MaximumSupply=15
        Add-Content   $GamePath\Game.ini bSupplyGainEnabled=False
        Add-Content   $GamePath\Game.ini bAwardSupplyInstantly=False
        Add-Content   $GamePath\Game.ini SupplyGainFrequency=150
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini [/script/insurgency.inspushgamemode]
        Add-Content   $GamePath\Game.ini RoundTimeExtension=300
        Add-Content   $GamePath\Game.ini AttackerWavesPerObjective=5
        Add-Content   $GamePath\Game.ini AttackerWaveDPR=0.25
        Add-Content   $GamePath\Game.ini AttackerWaveTimer=20
        Add-Content   $GamePath\Game.ini DefenderWavesPerObjective=5
        Add-Content   $GamePath\Game.ini DefenderWaveDPR=0.25
        Add-Content   $GamePath\Game.ini DefenderWaveTimer=35
        Add-Content   $GamePath\Game.ini LastStandSetupDelay=10
        Add-Content   $GamePath\Game.ini AdvanceAttackerSpawnsDelay=30
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini [/script/insurgency.insfrontlinegamemode]
        Add-Content   $GamePath\Game.ini StartingWaves=15
        Add-Content   $GamePath\Game.ini CapturingBonusWave=2
        Add-Content   $GamePath\Game.ini RegressSpawnsTimer=20
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini [/script/insurgency.insskirmishgamemode]
        Add-Content   $GamePath\Game.ini DefaultReinforcementWaves=5
        Add-Content   $GamePath\Game.ini CaptureBonusWaves=1
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini [/script/insurgency.insfirefightgamemode]
        Add-Content   $GamePath\Game.ini ";none"
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini [/script/insurgency.inscoopmode]
        Add-Content   $GamePath\Game.ini AIDifficulty=0.5
        Add-Content   $GamePath\Game.ini bUseVehicleInsertion=True
        Add-Content   $GamePath\Game.ini FriendlyBotQuota=4
        Add-Content   $GamePath\Game.ini MinimumEnemies=6
        Add-Content   $GamePath\Game.ini MaximumEnemies=12
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini [/script/insurgency.inscheckpointgamemode]
        Add-Content   $GamePath\Game.ini DefendTimer=90
        Add-Content   $GamePath\Game.ini DefendTimerFinal=180
        Add-Content   $GamePath\Game.ini RetreatTimer=10
        Add-Content   $GamePath\Game.ini RespawnDPR=0.1
        Add-Content   $GamePath\Game.ini RespawnDelay=20
        Add-Content   $GamePath\Game.ini PostCaptureRushTimer=30
        Add-Content   $GamePath\Game.ini CounterAttackRespawnDPR=0.2
        Add-Content   $GamePath\Game.ini CounterAttackRespawnDelay=20
        Add-Content   $GamePath\Game.ini ObjectiveTotalEnemyRespawnMultiplierMin=1
        Add-Content   $GamePath\Game.ini ObjectiveTotalEnemyRespawnMultiplierMax=1
        Add-Content   $GamePath\Game.ini FinalCacheBotQuotaMultiplier=1.5
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini [/script/insurgency.teaminfo]
        Add-Content   $GamePath\Game.ini bVotingEnabled=True
        Add-Content   $GamePath\Game.ini TeamVoteIssues=/Script/Insurgency.VoteIssueKick
        Add-Content   $GamePath\Game.ini MinimumPlayersRequired=3
        Add-Content   $GamePath\Game.ini bRequiresMinimumToStart=True
        Add-Content   $GamePath\Game.ini MinimumPlayerRatio=0.25
        Add-Content   $GamePath\Game.ini VotePassRatio=0.75
        Add-Content   $GamePath\Game.ini MinimumYesNoDifference=2
        Add-Content   $GamePath\Game.ini VoteTimeout=90
        Add-Content   $GamePath\Game.ini bCanTargetEnemies=False
        Add-Content   $GamePath\Game.ini IdleVoteBanDuration=-1
        Add-Content   $GamePath\Game.ini DefaultVoteBanDuration=120
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini ";"
        Add-Content   $GamePath\Game.ini ";All Mutator settings go in Engine.ini"
        Add-Content   $GamePath\Game.ini ";(will bechanged to Game.ini in the future for consistency)."
        Add-Content   $GamePath\Game.ini [/script/insurgency.mutator_headshotonly]
        Add-Content   $GamePath\Game.ini bCheckMeleeDamage=false
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini [/script/insurgency.mutator_hotpotato]
        Add-Content   $GamePath\Game.ini GrenadeClass=/Game/Game/Actors/Projectiles/BP_Projectile_M67.BP_Projectile_M67_C
        Add-Content   $GamePath\Game.ini ThrowbackWeaponClass=/Game/Game/Actors/Weapons/Grenade/BP_Grenade_M67.BP_Grenade_M67_C
        Add-Content   $GamePath\Game.ini bIgnoreHeadshots=false
        Add-Content   $GamePath\Game.ini bBotsOnly=false
        Add-Content   $GamePath\Game.ini " "
        Add-Content   $GamePath\Game.ini [/script/insurgency.mutator_vampirism]
        Add-Content   $GamePath\Game.ini bCountFriendlyFire=Vampirism_bCountFriendlyFire
        Add-Content   $GamePath\Game.ini MaxHealth=1000
        Add-Content   $GamePath\Game.ini ";............End Game.ini"
}
