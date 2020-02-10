# Steam-Server-Manger

PowerShell Steam Server Manager
- Install and Manage Steam Servers with Powershell.


Install Any location:
Download, Extract, and Open PowerShell and Change Directory to ssm.ps1

Run: 
open PowerShell as user NOT Admin
ssm accepts 1 or 2 parameters. first param specifies ssm command and the second is server folder name. if server folder name does not exist it creates it.   ```.\ssm.ps1 install insserver```

```>_./ssm <command> <serverFolder>```
          
Install steam server ```>_./ssm install misserver```
 - Creates Server Folder Named ```<serverFolder>``` and starts install
 - Downloads and extract steamcmd
 - Asks and uses Steaminfo.db App ID -
 - uses anon or steam login for install         
 - Server Launch - per App ID, if exists.
 - Creates per instance variables
 - Creates custom default config for server- if available 
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
   * Team Fortress 2 Dedicated Server (232250) "tf2server"
   * Avorion - Dedicated Server (565060)
   * Boundel - Dedicated Server (454070)
   * Dystopia Dedicated Server (17585)
   
   # untested
   * Assetto Corsa Dedicated Server (302550)
   * Alien Swarm Dedicated Server (17515)
   * Ballistic Overkill Dedicated Server (416880)
   * Action: Source Dedicated Server (985050)
   * BrainBread 2 Dedicated Server (475370)
   * Half-Life 2: Deathmatch Dedicated Server (232370)
   * Black Mesa: Deathmatch Dedicated Server (346680)
   * Day of Defeat Source Dedicated Server (232290)
   * Don't Starve Together Dedicated Server (343050)
   * Garry's Mod Dedicated Server (4020)
   * No More Room in Hell Dedicated Server (317670)
   * Blade Symphony Dedicated Server (228780)
   * Fistful of Frags Dedicated Server (295230)
   * Project Zomboid Dedicated Server (380870)
   * SvenCoop Dedicated Server (276060)
   -----
 - Manage Steam server with features
   * install steam server
   * starting server 
   * stopping server 
   * restarting server 
   * check if running 
   * update server
   * validate server files 
   * backup server files 
   * monitor server process
   * sourcemod/metamod and oxide install
   * Rcon to server 
   * Daily AutoRestart server process 
   * send discord alerts - backup - monitor - update 
   * run gamedig on hosted server 
   * update ssm PS scripts from github
   * get details from host and server
   
 
   
 # Commands:  
 - ```Start <serverFolder>``` - ```>_./ssm start missesrver```  - Starts miscreated server process          
 - ```Stop <serverFolder>``` - ```>_./ssm stop misserver``` - stop process for miscreated server
 - ```restart <serverFolder>``` - ```>_./ssm restart misserver``` - stops and starts process for miscreated server]
 - ```validate <serverFolder>``` - ```>_./ssm validate misserver``` - Validate App ID files
 - ```check <serverFolder>``` - ```>_./ssm check misserver``` - checks process for miscreated server
 - ```update <serverFolder>``` - ```>_./ssm update misserver``` - updates App ID, with  Discord alert. Stop server as needed, can be disabled in settings
  - ```ForceUpdate <serverFolder>``` - ```>_./ssm ForceUpdate misserver``` - updates App ID, with  Discord alert. Force server stop and update
 - ```backup <serverFolder>``` - ```>_./ssm backup misserver``` - Creates zip folder of server files in backups folder, with  Discord alert. purge backups over specfic count. (Downloads portable 7Zip)
 - ```monitor <serverFolder>``` - ```>_./ssm monitor misserver``` - Creates Scheduled Task to start server if off, with  Discord alert
  - ```ModInstall <serverFolder>``` - ```>_./ssm ModInstall insserver``` - Install Sourcemod or Oxide for specified servers

 - ```discord <serverFolder>``` - ```>_./ssm discord misserver``` -  * Discord Alert * -command will send test alert. requires Discord webhook
 - ```AutoRestart <serverFolder>``` - ```>_./ssm AutoRestart misserver``` - Creates Scheduled Task for Daily Auto Restart
 - ```MCRcon <serverFolder>``` - ```>_./ssm mcrcon inssserver``` - Uses MCRcon. Rcon to server (Downloads MCRcon)
 - ```gamedig <serverFolder>``` - ```>_./ssm gamedig sdtdserver``` * not supported for miscreated. although supported by several games. (Downloads  NodeJS and installs Gamedig)
 - ```SSM update``` - ```>_./ssm ssm update```  - Downloads and overwrites ssm github files
  - ```details <serverFolder>``` - ```>_./ssm details sdtdserver```  - outputs host and server details. requires gamedig.

# Configure
- change default variables in config-default\\*_default.ps1
- After install can edit variables-$server.ps1 to change launch vars or edit Launch Params.
- core_settings.ps1 disable some of the default features. 


# Mod
* Insurgency - option for sourcemod and Meta Mod install
 * Rust - option for Oxide install
 * Counter-Strike Global Offensive - option for sourcemod and Meta Mod install
 * Left 4 Dead 2 - Dedicated Server - option for sourcemod and Meta Mod install

 
  # MCRcon
 * MCRcon Download and Install
 * Use used to Rcon to servers.
 
 
 
 
- - - -  
 When creating a Schedule task to run Monitor script.
- If using a user windows account. Will need to add user to the "log on as batch job" to run the task under that account
- - - - 
 Does not install Dependencies like Visual C++ Redistributable or Direct X
 
 Does not Forward ports or open ports on firewall
- - - - 
 # MCRCON
https://github.com/Tiiffi/mcrcon
# GameDig
https://github.com/sonicsnes/node-gamedig
# Game Server Managers
Game server configs from
https://github.com/GameServerManagers
 "open source, open mind"

