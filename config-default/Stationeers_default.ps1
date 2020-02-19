Function New-LaunchScriptStationeersPS {
    # Stationeers Dedicated Server
    # APP ID # 600760
    ################## Change Default Variables #################

    #                       Server Port
    $global:port = "7777"
    #                       Query Port
    $global:queryport = "27015"
    #                       Server Name
    $global:hostname = "$env:USERNAME"
    ##############################/\##############################
    
    # parameter	value	etc
    # -batchmode		Dedicated server runs without UI and start to listen port.
    # -nographics		When running in batch mode, do not initialize graphics device at all.
    # -logfile	"path"	If no output_log.txt use this parameter. Check examples below for syntax
    # -autostart		Dedicated server start to listen port without player input. It's always enabled on Linux dedicated server
    # -autosaveinterval	integer	Save world in every interval.
    # -creator	int64	Set creator's steam id as gamedata and key-value.
    # This is for future integration of server instancing.

    # -worldname	string	Load and save game data automatically from existing file.
    # -worldtype	string	Worldtype(Space, Mars, Terrain)
    # -loadworld	string	Load world from saved file. If loadworld is enabled, worldname command is ignored.
    # -gameport	integer	UDP port for game. Avoid to set 27015-27020. It's steam's local server query ports.
    # -updateport	integer	UDP port for steam query
    # -servername	string	Server title.
    # -basedirectory	string	Absolute base directory for custom profile Ex) -basedirectory C:\Profile\Player1 Config Path : default.ini C:\Profile\Player1\ Save Path : C:\Profile\Player1\saves\[worldname]
    
    
    
###################### Do not change below #####################
$global:systemdir = ""
$global:executable = "rocketstation_DedicatedServer"
$global:executabledir = ""
$global:querytype = "protocol-valve"
$global:process = "rocketstation_DedicatedServer"
$global:servercfgdir = "rocketstation_DedicatedServer_Data\Saved\Config\WindowsServer"
$global:logdir = ""
Get-StopServerInstall
$global:gamedirname = ""
$global:servercfg = ""

    
# Get-Servercfg
# Select-EditSourceCFG
# rocketstation_DedicatedServer.executable -batchmode -nographics -autostart -autosaveinterval=300 -worldtype=Mars -worldname=Mars1 -basedirectory="C:\Server\User1"

$global:launchParams = '@("$executable -batchmode -nographics -autostart -autosaveinterval=300 -worldtype=Mars -worldname=Mars1 -servername $hostname -gameport ${port} -updateport ${QUERYPORT} -logfile server.log")'
} 