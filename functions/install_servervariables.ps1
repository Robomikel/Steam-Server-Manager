#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-CreateVariables {
    Write-Host '*** Creating Variables Script ****' -F M -B Black
    New-Item $currentdir\$server\Variables-$server.ps1 -Force
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     WEBHOOK HERE "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:WEBHOOK      = `"$global:WEBHOOK`""
    If ($APPID) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     App ID  "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:APPID        = `"$global:APPID`""
    }
    If ($Branch) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Branch   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:Branch       = `"$global:Branch`""
    }
    If ($username) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Steam username "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:username     = `"$global:username`""
    }
    If ($ANON) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Steam Anonymous user  "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:ANON         = `"$global:ANON`""
    }
    If ($MODDIR) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Mod dir "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:MODDIR       = `"$global:MODDIR`""
    }
    If ($WSMODDIR) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Work Shop Mod dir "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:WSMODDIR       = `"$global:WSMODDIR`""
    }
    If ($reg_appID) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     REgualr Game App ID "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:reg_appID       = `"$global:reg_appID`""
    }
    If ($wsmods) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                      WorkShop Mod IDs "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:wsmods       = $global:wsmods"
    }
    If ($mods) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                       Mods "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:mods       = `"$global:mods`""
    }
    If ($servermods) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                      Server Mods "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:servermods       = `"$global:servermods`""
    }
    If ($EXE) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Exe "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:EXE          = `"$global:EXE`""
    }
    If ($EXEDIR) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Exe dir "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:EXEDIR       = `"$global:EXEDIR`""
    }
    If ($SERVERCFGDIR) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     SERVERCFGDIR dir "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:SERVERCFGDIR = `"$global:SERVERCFGDIR`""
    }
    If ($GAME) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Game name used by Gamedig "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:game         = `"$global:GAME`""
    }
    If ($PROCESS) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     PROCESS name "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:PROCESS      = `"$global:PROCESS`""
    }
    If (${IP}) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Server IP "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`${global:IP}         = `"${global:IP}`""
    }
    If (${EXTIP}) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Server EXT IP "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`${global:EXTIP}      = `"${global:EXTIP}`""
    }
    If (${PORT}) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Server PORT "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`${global:PORT}       = `"${global:PORT}`""
    }
    If (${DIFF}) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Server Difficulty "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`${global:DIFF}       = `"${global:DIFF}`""
    }
    If ($SOURCETVPORT) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Server Source TV Port "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:SOURCETVPORT = `"$global:SOURCETVPORT`""
    }
    If ($SV_LAN) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Server SV_LAN "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:SV_LAN       = `"$global:SV_LAN`""
    }
    If ($CLIENTPORT) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     server client port"
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:CLIENTPORT   = `"$global:CLIENTPORT`""
    }
    If ($STEAMPORT) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     server STEAMPORT port"
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:STEAMPORT    = `"$global:STEAMPORT`""
    }
    If ($steamID64) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     server steamID64"
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:steamID64    = `"$global:steamID64`""
    }
    If ($MAP) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     default Map"
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:MAP          = `"$global:MAP`""
    }
    If ($GALAXYNAME) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     default GALAXYNAME"
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:GALAXYNAME   = `"$global:GALAXYNAME`""
    }
    If ($TICKRATE) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     server tick rate "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:TICKRATE     = `"$global:TICKRATE`""
    } 
    If ($GSLT) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Gamer Server token "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:GSLT         = `"$global:GSLT`""
    }
    If ($MAXPLAYERS) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Max Players  "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:MAXPLAYERS   = `"$global:MAXPLAYERS`""
    }
    If ($COOPPLAYERS) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     COOPPLAYERS Players  "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:COOPPLAYERS  = `"$global:COOPPLAYERS`""
    }
    If ($WORKSHOP) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Workshop 1/0 HERE "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:WORKSHOP     = `"$global:WORKSHOP`""
    }
    If ($HOSTNAME) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Server Name "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:HOSTNAME     = `"$global:HOSTNAME`""
    }
    If (${QUERYPORT}) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     query port "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`${global:QUERYPORT}  = `"${global:QUERYPORT}`""
    }
    If ($SAVES) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     local App Data SAVES folder "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:SAVES        = `"$global:SAVES`""
    }
    If ($RCONPORT) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Rcon Port  "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:RCONPORT     = `"$global:RCONPORT`""
    }
    If ($RCONPASSWORD) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Rcon Password HERE "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:RCONPASSWORD = `"$global:RCONPASSWORD`""
    }
    If ($adminpassword) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     adminpassword  HERE "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:adminpassword = `"$global:adminpassword`""
    }
    If ($SV_PURE) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Extra Launch Parms "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:SV_PURE      = `"$global:SV_PURE`""
    }
    If ($SCENARIO) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Sandstorm SCENARIO   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:SCENARIO     = `"$global:SCENARIO`""
    }
    If ($SAVEINTERVAL) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     SAVEINTERVAL   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:SAVEINTERVAL = `"$global:SAVEINTERVAL`""
    }
    If ($WORLDSIZE) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     WORLDSIZE  "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:WORLDSIZE    = `"$global:WORLDSIZE`""
    }
    If ($SEED) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     SEED   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:SEED         = `"$global:SEED`""
    }
    If ($RCONWEB) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     RCONWEB   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:RCONWEB      = `"$global:RCONWEB`""
    }
    If ($GAMETYPE) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     CSGO Gametype   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:GAMETYPE     = `"$global:GAMETYPE`""
    }
    If ($GAMEMODE) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     CSGO Gamemode   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:GAMEMODE     = `"$global:GAMEMODE`""
    }
    If ($MAPGROUP) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     CSGO mapgroup   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:MAPGROUP     = `"$global:MAPGROUP`""
    }
    If ($cluster) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     cluster   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:cluster      = `"$global:cluster`""
    }
    If ($shard) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     shard   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:shard        = `"$global:shard`""
    }
    If ($persistentstorageroot) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                              persistentstorageroot   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:persistentstorageroot = `"$global:persistentstorageroot`""
    }
    If ($gamedirname) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     gamedirname   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:gamedirname  = `"$global:gamedirname`""
    }
    If ($WSCOLLECTIONID) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                       WSCOLLECTIONID   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:WSCOLLECTIONID = `"$global:WSCOLLECTIONID`""
    }
    If ($WSSTARTMAP) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     WSSTARTMAP  "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:WSSTARTMAP   = `"$global:WSSTARTMAP`""
    }
    If ($WSAPIKEY) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     WSAPIKEY   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:WSAPIKEY     = `"$global:WSAPIKEY`""
    }
    If ($LOGDIR) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     LOGDIR   "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:LOGDIR       = `"$global:LOGDIR`""
    }
    If ($launchParams) {
        Add-Content  $currentdir\$server\Variables-$server.ps1  "#                     Server Launch Params "
        Add-Content  $currentdir\$server\Variables-$server.ps1  "`$global:launchParams = $global:launchParams"
    }
}