# Steam Server Manager   
![last commit](https://img.shields.io/github/last-commit/robomikel/steam-server-manager?color=blue&style=plastic)  ![commit activity](https://img.shields.io/github/commit-activity/y/Robomikel/steam-server-manager?style=plastic) ![commits since](https://img.shields.io/github/commits-since/robomikel/steam-server-manager/1.9.3?&style=plastic)     

![Details Command](https://github.com/Robomikel/Steam-Server-Manager/blob/master/Steamer%20-%20Details.gif)   

PowerShell Steam Server Manager
- Install and Manage Steam Servers with Powershell.

 
Install Any location:
Download, Extract, and Open PowerShell and Change Directory to ssm.ps1 to run script. [Wiki](https://github.com/Robomikel/Steam-Server-Manager/wiki/Installing-SSM)      
> Windows 10 may require to unblock downloaded files. In the Steam-Server-Manager folder. Use ```gci -r | Unblock-File``` command   

> Add SSM to Path to use `ssm` command in any directory without `./` [Wiki](https://github.com/Robomikel/Steam-Server-Manager/wiki/Installing-SSM-to-PATH)


# Install SSM   
 
PS Commands:   

```[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;```   
```Invoke-WebRequest "https://github.com/Robomikel/Steam-Server-Manager/archive/master.zip" -O Steam-Server-Manager.zip```   
```Expand-Archive "Steam-Server-Manager.zip" "Steam-Server-Manager" ```   
```Copy-Item Steam-Server-Manager\Steam-Server-Manager-master\* Steam-Server-Manager\ -Recurse -Force```   
```Remove-Item Steam-Server-Manager\Steam-Server-Manager-master -Recurse -Force```   
```Set-Location Steam-Server-Manager```  

- Servers install in the location of Steam-Server-Manager folder.  
- Before install you can change the server install directory to the location you want. [Wiki](https://github.com/Robomikel/Steam-Server-Manager/wiki/Custom-Backup-and-ServerFiles-Directories)   
- If you have an existing  Server folder or Steamcmd use [Wiki](https://github.com/Robomikel/Steam-Server-Manager/wiki/Existing-Server-Files-and-Steamcmd-folder)

# Console Menu   
Displays in console menu. Interactive Console Menu for SSM.   
```./ssm.ps1 menu```   

![Menu Command](https://github.com/Robomikel/Steam-Server-Manager/blob/master/Steamer%20-%20Menu.gif)   
# Install Server
open PowerShell as user NOT Admin   
ssm accepts 1 or 2 parameters. first param specifies ssm command and the second is server folder name. if server folder name does not exist it creates it.   ```.\ssm.ps1 install insserver```   

Configure during install :     
During server install will download and copy `default-config\*_default.ps1` to `config-local\*_default.ps1`. Will Prompt for input to change default variables like ports and servername. [Wiki](https://github.com/Robomikel/Steam-Server-Manager/wiki/Configure-Default-Variables-during-Game-Server-install) 
>change "$advanced = on" in config-local\local_settings before run to disable prompt for input to change default variables. Pauses to allow manual edit of 
```\Steam-Server-Manager\config-local\*_default.ps1``` change any vars like port/s or server name.    

Recommned using Optional name, It will automatically grab APP ID   

Example:          
Install miscreated server ```./ssm install misserver```   

```./ssm <command> <serverFolder>```
 - Creates Server Folder Named ```<serverFolder>``` and starts install
 - Downloads and extract steamcmd
 - Asks and uses Steaminfo.db App ID - (optional server folder name gets AppID)
 - Asks anon or steam login for install         
 - Creates Server Launch Params- per App ID, if exists. (Found in server folder after install)
 - Creates per instance variables (Found in server folder after install)
 - Creates custom default config for server - if available
 
 # Server List 
   * 7 Days to Die server (294420) - "7d2dserver" (optional server folder name)  
   * Angels Fall First Dedicated Server (407480) - "affserver" (optional server folder name)  
   * Action: Source Dedicated Server (985050) "ahl2server" (optional server folder name)  
   * Age of Chivalry Dedicated Server (17515)  "aocserver" (optional server folder name)  
   * Alien Swarm: Reactive Drop Dedicated Server (582400) "asrdserver" (optional server folder name)  
   * ARK: Survival Evolved Dedicated Server (376030)- “arkserver" (optional server folder name)  
   * Arma3 Server (233780)- “arma3server" (optional server folder name)   
   * Arma Reforger Server  (1874900) - "armareforgerserver" (optional server folder name)   
   * Assetto Corsa Dedicated Server (302550) "acserver" (optional server folder name)   
   * ASTRONEER Dedicated Server  (728470) - "astroserver" (optional server folder name)   
   * Avorion - Dedicated Server (565060) "avorionserver" (optional server folder name)   
   * Beyond the Wire Dedicated Server  (1064780) - "btwserver" (optional server folder name)   
   * Black Mesa: Deathmatch Dedicated Server (346680) "bmdmserver" (optional server folder name)  
   * Ballistic Overkill Dedicated Server (416880) "boserver" (optional server folder name)   
   * Blade Symphony Dedicated Server (228780) "bsserver" (optional server folder name)   
   * BadLads Dedicated Server  (1203110) - "blserver" (optional server folder name)  
   * Boundel - Dedicated Server (454070) "boundelserver" (optional server folder name)   
   * BrainBread 2 Dedicated Server (475370) "bb2server" (optional server folder name)   
   * Barotrauma Dedicated Server (1026340) "btserver" (optional server folder name)   
   * Battalion 1944 Dedicated Server (805140) "bt1944server" (optional server folder name)   
   * Blackwake Dedicated Server (423410) - "bwserver" (optional server folder name)   
   * caspa Dedicated Server (667230) - "caspaserver" (optional server folder name)   
   * Codename CURE Dedicated Server (383410) "ccserver" (optional server folder name)   
   * Crafting Dead Server  (685100) - "craftingdeadserver" (optional server folder name)   
   * Conan Exiles Dedicated Server (443030) "ceserver" (optional server folder name)   
   * Craftopia Dedicated Server  (1670340) - "craftserver" (optional server folder name)  
   * Call of Duty: Modern Warfare 3 - Dedicated Server (42750)- "cod3mwserver" (optional server folder name)   
   * Contagion Dedicated Server (238430) - "contagion" (optional server folder name)  
   * Colony Survival Dedicated Server (748090) - "csserver" (optional server folder name)   
   * Counter-Strike Global Offensive - Dedicated Server (740) "csgoserver" (optional server folder name)   
   * Double Action Dedicated Server (317800) - "daserver" (optional server folder name)   
   * Day of Dragons - Dedicated Server (1088320) "dayofdragonsserver" (optional server folder name)   
   * DayZ Server  (223350) - "dayzserver" (optional server folder name)   
   * Day of Defeat Source Dedicated Server (232290) "dodserver" (optional server folder name)   
   * Days of War Dedicated Server (541790) "dowserver" (optional server folder name)   
   * Day of Infamy Dedicated Server (462310)- “doiserver" (optional server folder name)   
   * Don't Starve Together Dedicated Server (343050) "dstserver" (optional server folder name)   
   * Dark N Light Dedicated Server (630230) "dnlserver" (optional server folder name)   
   * Dystopia Dedicated Server (17585) "dysserver" (optional server folder name)   
   * Empires Dedicated Server (460040) - "emserver" (optional server folder name)   
   * Empyrion - Galactic Survival Dedicated Server (530870) "empserver" (optional server folder name)   
   * Eden Star Dedicated Server (419790) - "esserver" (optional server folder name)   
   * Eternal Silence Dedicated Server (17555) - "esmodserver" (optional server folder name)  
   * Fortress Forever Dedicated Server  (329710) - "ffserver" (optional server folder name)   
   * Frozen Flame Dedicated Server  (1348640) - "frozenflame" (optional server folder name)   
   * Fistful of Frags Dedicated Server (295230) "fofserver" (optional server folder name)   
   * Garry's Mod Dedicated Server (4020) "gmodserver"  (optional server folder name)  
   * GearStorm Dedicated Server  (696120) - "gsserver" (optional server folder name)   
   * Half-Life 2: Deathmatch Dedicated Server (232370) "hl2dmserver" (optional server folder name)   
   * Hurtworld Dedicated Server (405100) - "hwserver" (optional server folder name)   
   * Iron Armada Dedicated Server (770340) - "ironarmada" (optional server folder name)   
   * Isles of Yore Dedicated Server  (1827320) - "isleofyoreserver" (optional server folder name)   
   * Insurgency Server (237410) - "insserver" (optional server folder name)   
   * Insurgency: Sandstorm Server (581330) - "inssserver" (optional server folder name)   
   * Just Cause 2: Multiplayer - Dedicated Server (261140) "jc2server" (optional server folder name)   
   * Just Cause™ 3: Multiplayer - Dedicated Server (619960) "jc3server" (optional server folder name)   
   * Killing Floor 2 - Dedicated Server (232130) "kf2server" (optional server folder name)    
   * Left 4 Dead 2 - Dedicated Server (222860) "l4d2server" (optional server folder name)   
   * Medieval Engineers Dedicated Server (367970) - "meserver" (optional server folder name)   
   * Miscreated Server (302200) - "misserver" (optional server folder name) 
   * Memories of Mars - Dedicated Server (897590) - "momserver" (optional server folder name)   
   * Minecraft Bedrock Edition - Dedicated Server (11421000) - "mcbrserver" (optional server folder name)   
   * Minecraft Java Edition - Dedicated Server (11500000) - "mcserver" (optional server folder name)   
   * MORDHAU Dedicated Server (629800) - "mserver" (optional server folder name)   
   * No More Room in Hell Dedicated Server (317670) "nmrihserver" (optional server folder name)   
   * Night of the Dead Dedicated Server  (1420710) - "notdserver" (optional server folder name)   
   * Natural Selection 2 Dedicated Server (4940) "ns2server" (optional server folder name)   
   * Onset Dedicated Server (1204170) - "onsetserver" (optional server folder name)   
   * Project CARS - Dedicated Server (332670) "pcserver" (optional server folder name)   
   * Primal Carnage: Extinction Dedicated Server (336400) - "pcedserver" (optional server folder name)   
   * PixARK Dedicated Server (824360)- “pixarkserver" (optional server folder name)   
   * Project Zomboid Dedicated Server (380870) "pzserver" (optional server folder name)   
   * Remnants Dedicated Server  (1141420) - "remnantsserver" (optional server folder name)  
   * Risk of Rain 2 Dedicated Server  (1180760) - "ror2server" (optional server folder name)  
   * Rust server (258550) - "rustserver" (optional server folder name)   
   * rFactor 2 Dedicated Server (400300) - "rFactor2server" (optional server folder name)   
   * Rising Storm 2 - Dedicated Server  (418480) - "rs2server" (optional server folder name)   
   * Satisfactory Dedicated Server  (1690800) - "factoryserver" (optional server folder name)  
   * StickyBots Dedicated Server  (974130) - "stickybotsserver" (optional server folder name)  
   * SCP: 5K Dedicated Server (884110) "scp5kserver" (optional server folder name)   
   * SCP: Secret Laboratory Dedicated Server (996560) "scpserver" (optional server folder name)   
   * Space Engineers Dedicated Server (298740) "seserver" (optional server folder name)   
   * Sniper Elite 4 Dedicated Server (568880) "se4server" (optional server folder name)   
   * Space Impossible (1222650) - "siserver" (optional server folder name)   
   * Serious Sam 2017 Dedicated Server (564390) - "ss2017server" (optional server folder name)    
   * Serious Sam 3 Dedicated Server (41080) - "ss3server" (optional server folder name)   
   * Serious Sam Classics: Revolution Dedicated Server (299310) - "sscrserver" (optional server folder name)   
   * Serious Sam HD Dedicated Server (41005) - "sshdserver" (optional server folder name)   
   * Stormworks Dedicated Server (1247090) - "swserver" (optional server folder name)   
   * Stationeers Dedicated Server (600760) - "stationeersserver" (optional server folder name)   
   * Squad Dedicated Server (403240) "squadserver" (optional server folder name)   
   * SvenCoop Dedicated Server (276060) "svenserver" (optional server folder name)   
   * Terraria Dedicated Server  (105600) - "terrariaserver" (optional server folder name)    
   * Takedown: Red Sabre Dedicated Server (261020) - "trsserver" (optional server folder name)   
   * Team Fortress 2 Dedicated Server (232250) "tf2server" (optional server folder name)   
   * The Isle Dedicated Server (412680) - "tiserver" (optional server folder name)   
   * Unturned Dedicated Server (1110390) - "unturnedserver" (optional server folder name)   
   * Unfortunate Spacemen Dedicated Server  (824240) - "spacemanserver" (optional server folder name)   
   * The Forest Dedicated Server (556450) "forestserver" (optional server folder name)   
   * Valhiem Dedicated Server  (896660) - "valhiem" (optional server folder name)   
   * Vanguard: Normandy 1944 Dedicated Server (1017070) - "vanguardserver" (optional server folder name)    
   * V Rising Dedicated Server  (1829350) - "vrisingserver" (optional server folder name)    
   * Vox Machinae  (944490) - "voxserver" (optional server folder name)    
   * Wreckfest Dedicated Server (361580) - "wfserver" (optional server folder name)    
   * Zombie Panic! Source Dedicated Server (17505) "zpsserver" (optional server folder name)   

   -----   
 # Features  
 - Manage Steam server with features
   * Add SSM to Path
   * Custom Backup and Server Files Directories
   * SSM Console Menu   
   * install steam server
   * starting server 
   * stopping server 
   * restarting server 
   * check if server process running 
   * update server/App ID
   * validate server files 
   * backup server files
   * restore server files   
   * get details from host and server
   * monitor server process
   * console and steamer logging - server console log to pastebin.
   * sourcemod/metamod and oxide install
   * update mods
   * Steam Workshop install
   * Rcon to server (MCRcon supported servers)
   * Daily AutoRestart server process 
   * send discord alerts - backup - monitor - update 
   * Graphical CPU and Memory stats
   * run gamedig on hosted server 
   * update ssm PS scripts from github   
   
 
   
 # Commands:
 - ```./ssm menu ```  - Use Interactive SSM console Menu [Wiki](https://github.com/Robomikel/Steam-Server-Manager/wiki/Menu-command)    
 - ```./ssm install <serverFolder>```  - install server   
 - ```./ssm start <serverFolder>```  - Starts  server process   
 - ```./ssm stop <serverFolder>``` - stop process server   
 - ```./ssm restart <serverFolder>``` - stops and starts process for server    
 - ```./ssm validate <serverFolder>``` - Validate App ID files   
 - ```./ssm monitor <serverFolder>``` - checks process server and starts if need with Discord Alert. Optional GameDig query   
 - ```./ssm update <serverFolder>``` - updates App ID, with  Discord alert. Stop server as needed, can be disabled in settings   
 - ```./ssm force-update <serverFolder>``` - updates App ID. Force server stop and update   
 - ```./ssm backup <serverFolder>``` - Creates zip folder of server files in backups folder, with  Discord alert. purge backups over specfic count. (Downloads portable 7Zip)   
 - ```./ssm restore <serverFolder>``` - Lists zip folder backups of server files in backups folder and overwrites serverfiles with backup files.   
 - ```./ssm install-monitor <serverFolder>``` - Creates Scheduled Task to monitor server   
 - ```./ssm install-restart <serverFolder>``` - create scheduled task to restart server daily.    
 - ```./ssm install-backup <serverFolder>``` - create scheduled task to backup server daily.    
 - ```./ssm install-mod <serverFolder>```  - Install Sourcemod or Oxide for specified servers   
 - ```./ssm update-mods <serverFolder>``` - updates mods and plugins for server     
 - ```./ssm install-ws <serverFolder>```  - Workshop Install   
 - ```./ssm discord <serverFolder>``` -  * Discord Alert * -command will send test alert. requires Discord webhook in ```\config-local\local_settings.ps1```     
 - ```./ssm mcrcon <serverFolder>``` - Uses MCRcon. Rcon to server (Downloads MCRcon)   
 - ```./ssm query <serverFolder>``` -  runs gamedig on server (Downloads  NodeJS and installs Gamedig)   
 - ```./ssm ssm update``` -  Downloads and overwrites ssm github files   
 - ```./ssm details <serverFolder>``` - outputs host and server details.   
 - ```./ssm stats ``` - Graphical output of host CPU and Memory details.
 - ```ssm start-pode``` - will download Pode. start pode and Discord bot. Use ctl-C to stop [Wiki](https://github.com/Robomikel/Steam-Server-Manager/wiki/DiscordJS-Bot-and-Pode-API-for-SSM)

# Configure
- After install can edit ```\ServerFolder\variables-*.ps1``` to change launch vars or edit Launch Params. [Wiki](https://github.com/Robomikel/Steam-Server-Manager/wiki/Changing-Per-instance-variables)     
- ```\config-local\local_settings.ps1``` change some of the default features. Discord Webhook Goes here. local_settings.ps1 will be created on first run.   
-  "core_settings.ps1" and "default-config" will be overwritten during update. Use config-local for changes..   
- Server console log to pastebin ```\functions\core_pastebin.ps1 ``` (dev key and creds in local_settings.ps1 and enable)   

# Mod
 * Insurgency - option for sourcemod and Meta Mod install
 * Rust - option for Oxide install
 * Counter-Strike Global Offensive - option for sourcemod and Meta Mod install
 * Left 4 Dead 2 - Dedicated Server - option for sourcemod and Meta Mod install
 * Sourcemod and Oxide for other supported games available
 * 7D2D - Undead-Legacy
 * Rust - Plugin Updater
 * CSGO - Get5, Pug-setup, and Steamworks 
 * BlackMesa - Source Coop
 * Assetto Corsa - AssettoServer
 * Terraria - TShock
 
# Steam Workshop install
* advanced configuration in *_default.ps1 (see Space Engineers for example)
 
# MCRcon
 * MCRcon Download and Install
 * Used to Rcon to supported servers
 
# Graphical Stats 
 ![stats Command](https://github.com/Robomikel/Steam-Server-Manager/blob/master/Steamer%20-%20Stats.gif)
# Discord Alert
 ![monitor Command](https://github.com/Robomikel/Steam-Server-Manager/blob/master/Discord-Alert.png)
# Restore
![monitor Command](https://github.com/Robomikel/Steam-Server-Manager/blob/master/RestoreMenu.jpg)
- - - -  
 When creating a Schedule task to run Monitor script in background.  
 - If using a user windows account. May need to add user to the "log on as batch job" to run the task in background under that account  
 [wiki](https://github.com/Robomikel/Steam-Server-Manager/wiki/log-on-as-batch-job)    
- - - - 
 Does not install Dependencies like Visual C++ Redistributable   
 https://www.techpowerup.com/download/visual-c-redistributable-runtime-package-all-in-one/
 
 Does not install Dependencies like Direct X  
 https://www.microsoft.com/en-us/download/details.aspx?id=35     
 Direct X offline installer if above fails       
 https://www.microsoft.com/en-us/download/details.aspx?id=8109   
 
 Does not install Dependencies like Java   
 https://www.java.com/en/download/   

 Does not Forward ports   
 https://portforward.com/  
 
 Does not open ports on firewall  
 https://www.tomshardware.com/news/how-to-open-firewall-ports-in-windows-10,36451.html
- - - - 
# Oxide
https://umod.org/
# SourceMod
https://www.sourcemod.net/
# Metamod:Source
https://www.sourcemm.net/
# Rust Admin
https://www.rustadmin.com/
# Miscreated Rcon Tool
https://github.com/csprance/MisRCON/releases
# MCRCON
https://github.com/Tiiffi/mcrcon
# GameDig
https://github.com/sonicsnes/node-gamedig
# Game Server Managers
Game server configs from
https://github.com/GameServerManagers
 "open source, open mind"
# PS Discord
https://github.com/EvotecIT/PSDiscord
# PS SharedGoods
https://github.com/EvotecIT/PSSharedGoods
# VcRedist
https://github.com/aaronparker/VcRedist   
# Graphical
https://github.com/PrateekKumarSingh/Graphical
# PS-Menu
https://github.com/chrisseroka/ps-menu
# Get5
https://github.com/splewis/get5/releases
# csgo-pug-setup
https://github.com/splewis/csgo-pug-setup/releases
# steamworks
https://github.com/KyleSanderson/SteamWorks
# Pode
https://github.com/Badgerati/Pode
# DiscordJS
https://github.com/discordjs/discord.js/
# SourceCoop
https://github.com/ampreeT/SourceCoop
# AssettoServer
https://github.com/compujuckel/AssettoServer
# TShock
https://github.com/Pryaxis/TShock
