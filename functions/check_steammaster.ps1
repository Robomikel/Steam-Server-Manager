
Function Test-SteamMaster {
	If ($steammaster) {
		if ($Useprivate = "off") { 
			if (( "${extip}" ) -and ( "${port}" )) { 
				if ( "${steammastercheck}" -eq "on" ) { 
					$masterserver = Invoke-Webrequest "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${extip}:${port}" -UseBasicParsing | ConvertFrom-Json
					# $masterserver = $masterserver.response.success
					$masterresponse = $masterserver.Content  | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
				}
			}
			Else {
				if (( "${ip}" ) -and ( "${port}" )) { 
					if ( "${steammastercheck}" -eq "on" ) { 
						$masterserver = Invoke-Webrequest "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${ip}:${port}" -UseBasicParsing | ConvertFrom-Json
						# $masterserver = $masterserver.response.success
						$masterresponse = $masterserver.Content  | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
					}
				}	
			}
		}
		If ( $masterserver -eq $True) {
			Write-Host '---> Connection to Steam Master Server <---' -F Y 
			Write-Host "   $masterresponse   " -ForegroundColor Green
		}
	}
}