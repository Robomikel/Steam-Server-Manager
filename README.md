# Steam-Server-Manager

PowerShell Steam Server Manager
- Install and Manage Steam Servers with Powershell.


Install Any location:
Download, Extract, and Open PowerShell and Change Directory to ssm.ps1
Server install in the location of ssm. before install change directory to the location you want the server.

PS Commands for install:

```Invoke-WebRequest "https://github.com/Robomikel/Steam-Server-Manager/archive/master.zip" -O Steam-Server-Manager.zip```   
```Expand-Archive "Steam-Server-Manager.zip" "Steam-Server-Manager" ```   
```Move-Item Steam-Server-Manager\Steam-Server-Manager-master\* Steam-Server-Manager\ ```   
```Remove-Item Steam-Server-Manager\Steam-Server-Manager-master ```   
```Set-Location Steam-Server-Manager```   

Configure berfore install (optional):
Find default config for game you wish to install
Steam-Server-Manager\\config-default\\*_default.ps1
Change any vars like port or server name.

Run: 
open PowerShell as user NOT Admin
ssm accepts 1 or 2 parameters. first param specifies ssm command and the second is server folder name. if server folder name does not exist it creates it.   ```.\ssm.ps1 install insserver```
If Optional name is used, will grab APP ID

Example          
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
   * Miscreated Server (302200) - "misserver" (optional server folder name) 
   * 7 Days to Die server (294420) - "sdtdserver" (optional server folder name)  
   * Insurgency Server (237410) - "insserver" (optional server folder name) 
   * Insurgency: Sandstorm Server (581330) - "inssserver" (optional server folder name) 
   * Rust server (258550) - "rustserver" (optional server folder name) 
   * Arma3 Server (233780)- “arma3server" (optional server folder name)
   * ARK: Survival Evolved Dedicated Server (376030)- “arkserver" (optional server folder name)
   * Day of Infamy Dedicated Server (462310)- “doiserver" (optional server folder name)
   * Killing Floor 2 - Dedicated Server (232130) "kf2server" (optional server folder name)
   * Empyrion - Galactic Survival Dedicated Server (530870) "empserver" (optional server folder name)
   * Conan Exiles Dedicated Server (443030) "ceserver" (optional server folder name)
   * The Forest Dedicated Server (556450) "forestserver" (optional server folder name)
   * Counter-Strike Global Offensive - Dedicated Server (740) "csgoserver" (optional server folder name)
   * Left 4 Dead 2 - Dedicated Server (222860) "lfd2server" (optional server folder name)
   * Age of Chivalry Dedicated Server (17515)  "aocserver" (optional server folder name)
   * Team Fortress 2 Dedicated Server (232250) "tf2server" (optional server folder name)
   * Avorion - Dedicated Server (565060) "avorionserver" (optional server folder name)
   * Boundel - Dedicated Server (454070) "boundelserver" (optional server folder name)
   * Dystopia Dedicated Server (17585) "dysserver" (optional server folder name)
   * BrainBread 2 Dedicated Server (475370) "bb2server" (optional server folder name)
   * Half-Life 2: Deathmatch Dedicated Server (232370) "hl2dmserver" (optional server folder name)
   * Black Mesa: Deathmatch Dedicated Server (346680) "bmdmserver" (optional server folder name)
   * Action: Source Dedicated Server (985050) "ahl2server" (optional server folder name)
   * Day of Defeat Source Dedicated Server (232290) "dodserver" (optional server folder name)
   * Don't Starve Together Dedicated Server (343050) "dstserver" (optional server folder name)
   * Ballistic Overkill Dedicated Server (416880) "boserver" (optional server folder name)
   * Alien Swarm: Reactive Drop Dedicated Server (582400) "asrdserver" (optional server folder name)
   * Garry's Mod Dedicated Server (4020) "gmodserver"  (optional server folder name)
   * No More Room in Hell Dedicated Server (317670) "nmrihserver" (optional server folder name)
   * Blade Symphony Dedicated Server (228780) "bsserver" (optional server folder name)
   * Fistful of Frags Dedicated Server (295230) "fofserver" (optional server folder name)
   * Project Zomboid Dedicated Server (380870) "pzserver" (optional server folder name)
   * SvenCoop Dedicated Server (276060) "svenserver" (optional server folder name)
   * Assetto Corsa Dedicated Server (302550) "acserver" (optional server folder name)
   * Battalion 1944 Dedicated Server (805140) "bt1944server" (optional server folder name)
   * Barotrauma Dedicated Server (1026340) "btserver" (optional server folder name)
   * Codename CURE Dedicated Server (383410) "ccserver" (optional server folder name)
   * Just Cause 2: Multiplayer - Dedicated Server (261140) (optional server folder name)
   * Just Cause™ 3: Multiplayer - Dedicated Server (619960) (optional server folder name)
   -----
 # Features
 - Manage Steam server with features
   * install steam server
   * starting server 
   * stopping server 
   * restarting server 
   * check if server process running 
   * update server/App ID
   * validate server files 
   * backup server files
   * get details from host and server
   * monitor server process
   * console and steamer logging
   * sourcemod/metamod and oxide install
   * Rcon to server (MCRcon supported servers)
   * Daily AutoRestart server process 
   * send discord alerts - backup - monitor - update 
   * run gamedig on hosted server 
   * update ssm PS scripts from github
   
 
   
 # Commands:  
 - ```./ssm Start <serverFolder>```  - Starts  server process          
 - ```./ssm Stop <serverFolder>``` - stop process server
 - ```./ssm restart <serverFolder>``` - stops and starts process for server]
 - ```./ssm validate <serverFolder>``` - Validate App ID files
 - ```./ssm check <serverFolder>``` - checks process server
 - ```./ssm update <serverFolder>``` - updates App ID, with  Discord alert. Stop server as needed, can be disabled in settings
  - ```./ssm ForceUpdate <serverFolder>``` - updates App ID. Force server stop and update
 - ```./ssm backup <serverFolder>``` - Creates zip folder of server files in backups folder, with  Discord alert. purge backups over specfic count. (Downloads portable 7Zip)
 - ```./ssm monitor <serverFolder>``` - Creates Scheduled Task to start server if off, with  Discord alert
  - ```./ssm ModInstall <serverFolder>```  - Install Sourcemod or Oxide for specified servers

 - ```./ssm discord <serverFolder>``` -  * Discord Alert * -command will send test alert. requires Discord webhook
 - ```./ssm AutoRestart <serverFolder>``` - Creates Scheduled Task for Daily Auto Restart
 - ```./ssm MCRcon <serverFolder>``` - Uses MCRcon. Rcon to server (Downloads MCRcon)
 - ```./ssm gamedig <serverFolder>``` -  runs gamedig on server (Downloads  NodeJS and installs Gamedig)
 - ```./ssm SSM update``` -  Downloads and overwrites ssm github files
  - ```./ssm details <serverFolder>``` - outputs host and server details.

# Configure
- change default variables in \\config-default\\*_default.ps1
- After install can edit \\ServerFolder\\variables-$server.ps1 to change launch vars or edit Launch Params.
- \\functions\\core_settings.ps1 disable some of the default features. 


# Mod
 * Insurgency - option for sourcemod and Meta Mod install
 * Rust - option for Oxide install
 * Counter-Strike Global Offensive - option for sourcemod and Meta Mod install
 * Left 4 Dead 2 - Dedicated Server - option for sourcemod and Meta Mod install
 * Sourcemod and Oxide for other supported games available

 
# MCRcon
 * MCRcon Download and Install
 * Use used to Rcon to servers.
 
 
 
 
- - - -  
 When creating a Schedule task to run Monitor script.
- If using a user windows account. May need to add user to the "log on as batch job" to run the task under that account
- - - - 
 Does not install Dependencies like Visual C++ Redistributable 
 https://www.techpowerup.com/download/visual-c-redistributable-runtime-package-all-in-one/
 
 Does not install Dependencies like Direct X  
 https://www.microsoft.com/en-us/download/details.aspx?id=8109
 
 Does not Forward ports   
 https://portforward.com/  
 
 Does not open ports on firewall  
 https://www.tomshardware.com/news/how-to-open-firewall-ports-in-windows-10,36451.html
- - - - 
 # MCRCON
https://github.com/Tiiffi/mcrcon
# GameDig
https://github.com/sonicsnes/node-gamedig
# Game Server Managers
Game server configs from
https://github.com/GameServerManagers
 "open source, open mind"

