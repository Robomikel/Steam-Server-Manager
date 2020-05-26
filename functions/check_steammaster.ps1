
Function Test-SteamMaster {
	If ($ssmlog -and $loggingdate) {
		Add-Content $ssmlog "[$loggingdate] Checking Steam Master"
		if ($Useprivate = "off") { 
			if ( ${extip} -and ${queryport}) { 
				if ( ${steammastercheck} -eq "on" ) {
					$global:masterserver = Invoke-Webrequest "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${extip}:${queryport}" -UseBasicParsing | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
					Add-Content $ssmlog "[$loggingdate] https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${extip}:${queryport} "
					# $masterserver = $masterserver.response.success
					# $global:masterresponse = $masterserver 
					# | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
				}
			}
			Elseif (${extip} -and ${port} ) { 
				if ( ${steammastercheck} -eq "on" ) {
					$global:masterserver = Invoke-Webrequest "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${extip}:${port}" -UseBasicParsing | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
					Add-Content $ssmlog "[$loggingdate] https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${extip}:${port} "
					# $masterserver = $masterserver.response.success
					# $global:masterresponse = $masterserver 
					# | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
				}
			}	
		
		}
		Else {
			if ( ${ip} -and ${queryport} ) { 
				if ( ${steammastercheck} -eq "on" ) { 
					$global:masterserver = Invoke-Webrequest "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${ip}:${queryport}" -UseBasicParsing | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
					Add-Content $ssmlog "[$loggingdate] https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${ip}:${queryport} "
					# $masterserver = $masterserver.response.success
					# $global:masterresponse = $masterserver 
					# | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
				}
			}
			Elseif ( ${ip} -and ${port}) { 
				if ( ${steammastercheck} -eq "on" ) { 
					$global:masterserver = Invoke-Webrequest "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${ip}:${port}" -UseBasicParsing | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
					Add-Content $ssmlog "[$loggingdate] https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${ip}:${port} "
					# $masterserver = $masterserver.response.success
					# $global:masterresponse = $masterserver 
					# | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
				}
			}		
		}
		Add-Content $ssmlog "[$loggingdate] Test-SteamMaster $masterserver ${steammastercheck}"
	}
}