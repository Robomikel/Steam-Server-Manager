#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-DriveSpace {
  Write-log "Function: $($MyInvocation.Mycommand)"
  Get-Infomessage "Getting Host Storage Size" 'info'
  $t = Measure-Command { $global:diskresults = (Get-PSDrive) | Where-Object Name -like "[A-Z]" | Foreach-Object {
      $n = $($_.Name ) ;
      $u = $([Math]::Round($_.Used / 1GB));
      $i = $( [Math]::Round($_.Free / 1GB));
      $r = $( [Math]::Round(($_.Free + $_.Used) / 1GB ))
      "$n`: $u / $r GB "
    }
  }
  write-log "info: Get-DriveSpace $($t.Seconds)`:$($t.Milliseconds)"
  clear-hostline 1
  Get-Infomessage "Getting Host Storage info" 'Done'
}
Function Get-Details {
  Write-log "Function: $($MyInvocation.Mycommand)"
  $host.UI.RawUI.ForegroundColor = "Cyan"
  Get-DriveSpace
  $portarrayname = @()
  $portarrayvalue = @()
  $portarraytcpstatus = @()
  $portarrayudpstatus = @()
  $openportarraytcpstatus = @()
  $portarraytcpOwningProcess = @()
  $portarrayudpOwningProcess = @()
  $visualcpackages = @()
  clear-hostline 1
  Get-Infomessage "Getting Server TCP/UDP status" 'info'
    ($array = (Get-Variable | Where-Object name -like "*port")) | Foreach-Object { $portarrayvalue += "$($_.value)" ; $portarrayname += "$($_.name)" }
  $t = Measure-Command { $array |  Foreach-Object { if ($tcpstatus = (Get-NetTCPConnection -LocalPort $_.Value -ErrorAction SilentlyContinue | Select-Object OwningProcess, State)) { $portarraytcpstatus += "$($tcpstatus.State)" ; $portarraytcpOwningProcess += "`nTCPPort: " + $_.Value + "` `tOwning Process: " + ((Get-Process -Id $tcpstatus.OwningProcess).ProcessName) }Else { $portarraytcpstatus += "$false" } }}
  write-log "info: Get-NetTCPConnection $($t.Seconds)`:$($t.Milliseconds)"
  $t = Measure-Command { $array |  Foreach-Object { if ($udpstatus = (Get-NetUDPEndpoint -LocalPort $_.Value -ErrorAction SilentlyContinue | Select-Object OwningProcess)) { $portarrayudpstatus += "Listen"  ; $portarrayudpOwningProcess += "`nUDPPort: " + $_.Value + "` `tOwning Process: " + ((Get-Process -Id $udpstatus.OwningProcess).ProcessName) }Else { $portarrayudpstatus += "$false" } }}
  write-log "info: Get-NetUDPEndpoint $($t.Seconds)`:$($t.Milliseconds)"
  #  if ($psSeven -eq $true) {
  #      $array |  Foreach-Object { if (($status = (Test-Connection $extip -TcpPort $_.Value)) -eq $true ) {$openportarraytcpstatus+="$true"}Else{$openportarraytcpstatus+="$false"}}
  #  }
  #  Else{
  #      $global:ProgressPreference = 'SilentlyContinue'
  #      $global:WarningPreference = 'SilentlyContinue'
  #      $array |  Foreach-Object { if (($status = (Test-NetConnection $extip -Port $_.Value -ErrorAction SilentlyContinue).TcpTestSucceeded) -eq $true) {$openportarraytcpstatus+="$true"}Else{$openportarraytcpstatus+="$false"}}
  #  }
  clear-hostline 1
  Get-Infomessage "Getting Server TCP/UDP status" 'done'
  clear-hostline 1
  Get-Infomessage "Getting CPU, Visual C++" 'info'
  If ($psSeven -eq $true) {
    $windows32 = Get-CimInstance Win32_OperatingSystem
    $window32processor = Get-CimInstance Win32_processor
    # $windows32computer = Get-CimInstance Win32_ComputerSystem
    $uptime = (Get-Date) - ($windows32.lastbootuptime)
    $visualc = Get-CimInstance -Class Win32_Product -Filter "Name LIKE '%Visual C++ %'" | Foreach-Object { $visualcpackages += "`n " + $_.Name }
  }
  Else {
    $windows32 = Get-WmiObject Win32_OperatingSystem
    $window32processor = Get-WMIObject Win32_processor
    # $windows32computer = Get-WMIObject Win32_ComputerSystem
    $uptime = (Get-Date) - ($windows32.ConvertToDateTime($windows32.lastbootuptime))
    $visualc = Get-WMIObject -Class Win32_Product -Filter "Name LIKE '%Visual C++ %'" | Foreach-Object { $visualcpackages += "`n " + $_.Name }
  }
  clear-hostline 1
  Get-Infomessage "Getting CPU, Visual C++" 'done'
  clear-hostline 1
  Get-Infomessage "Getting Steam Master, SSM, Direct X, Memory and Uptime" 'info'
  Get-info
  Get-ChecktaskDetails
  Get-ChecktaskautorestartDetails
  $t = Measure-Command { Test-SteamMaster };write-log "info: Test-SteamMaster $($t.Seconds)`:$($t.Milliseconds)"
  Get-CreatedVaribles
  $stats = $masterserver
  # $masterserver = $masterserver.addr
  New-BackupFolder
  $netinterface = Get-NetAdapter
  # $netip = (Get-NetIPConfiguration | Where-Object InterfaceAlias -like "$($netinterface.Name[0])").IPv4Address.IPAddress
  $uptime = "uptime:    " + $Uptime.Days + " days, " + $Uptime.Hours + " hours, " + $Uptime.Minutes + " minutes"
  $totalfree = "{0:N2} GB" -f ($windows32.FreePhysicalMemory / 1MB)
  $totalmem = "{0:N2} GB" -f ($windows32.TotalVisibleMemorySize / 1MB)
  $totalusedmem = "{0:N2} GB" -f ( ( $windows32.TotalVisibleMemorySize - $windows32.FreePhysicalMemory) / 1MB)
  $backups = ((Get-Childitem -Depth 1 $backupdir -recurse).Name | Select-String -SimpleMatch "$serverfiles" -Exclude "AppData").Count
  $backupssize = "{0:N2} GB" -f ((Get-Childitem -Depth 1 $backupdir  -Include "*$serverfiles*" -Exclude "*AppData*" | Measure-Object Length -Sum -ea silentlycontinue ).Sum / 1GB)
  $serverfilesdir = "{0:N2} GB" -f ((Get-Childitem $sfwd\$serverfiles -Recurse | Measure-Object Length -Sum -ea silentlycontinue ).Sum / 1GB)
  $currentdir = "{0:N2} GB" -f ((Get-Childitem $currentdir -Recurse | Measure-Object Length -Sum -ea silentlycontinue ).Sum / 1GB)
  $directx = Get-ItemProperty "hklm:\Software\Microsoft\DirectX"
  If ((Get-Process "$process" -ea SilentlyContinue)) {
    $gameservermem = "{0:N2} GB" -f ((Get-Process $process).WS / 1GB)
  }
  $gamecpucooked = [math]::Truncate(((Get-Counter '\Process(*)\% Processor Time' -ea SilentlyContinue).CounterSamples | Where-Object InstanceName -like $process).CookedValue)
  clear-hostline 1
  Get-Infomessage "Getting Steam Master, SSM, Direct X, Memory and Uptime" 'done'
  clear-hostline 1
  Get-Infomessage "Print info" 'info'
  clear-hostline 1
  Write-Host "Host Details"
  Write-Host ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:."
  Write-Host "OS:                $($windows32.caption)"
  Write-Host "Arch:              $($windows32.OSArchitecture)"
  Write-Host "Version:           $($windows32.version) "
  Write-Host "hostname:          $($windows32.csname)"
  Write-Host "$uptime"
  Write-Host " "
  Write-Host "Host Resources"
  Write-Host ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:."
  Write-Host "CPU"
  Write-Host "Model:             $($window32processor.Name)"
  Write-Host "Cores:             $($window32processor.NumberOfCores)"
  Write-Host "MaxClockSpeed:     $($window32processor.MaxClockSpeed)"
  Write-Host "CurrentClockSpeed: $($window32processor.CurrentClockSpeed)"
  Write-Host "Current Load:      $($window32processor.LoadPercentage) %"
  Write-Host " "
  Write-Host "Memory"
  Write-Host "Mem:       Total     Used      Free      "
  Write-Host "Physical:  $totalmem   $totalusedmem   $totalfree "
  Write-Host " "
  Write-Host " "
  Write-Host "Network"
  Write-Host "Interface:         $($netinterface.Name)"
  Write-Host "Link Speed:        $($netinterface.LinkSpeed)"
  Write-Host "IP:                $ip"
  Write-Host "Internet IP:       $extip"
  Write-Host " "
  Write-Host "Server Resource Usage"
  Write-Host ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:."
  Write-Host "CPU Cooked:        $gamecpucooked %"
  Write-Host "Mem Used:          $gameservermem"
  Write-Host "Storage"
  Write-Host "SSM Total:         $currentdir"
  Write-Host "Serverfiles:       $serverfilesdir"
  Write-Host "Backups:           $backups"
  Write-Host "Backups Size:      $backupssize"
  Write-Host "Monitor:           $monitorjob"
  Write-Host "AutoRestart:       $restartjob"
  Write-Host " "
  Write-Host "Server details"
  Write-Host ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:."
  Write-Host "Server Name     : $hostname"
  If ($($portarrayname[0])) { Write-Host "$($portarrayname[0])" -n }
  If ($($portarrayvalue[0])) { Write-host "`     `t: $($portarrayvalue[0])" -n }
  If ($($portarraytcpstatus[0])) { Write-host "`     `tTCPBind: $($portarraytcpstatus[0])" -n }
  If ($($portarrayudpstatus[0])) { Write-host "`     UDPBind: $($portarrayudpstatus[0])" }
  # If ($($openportarraytcpstatus[0])) {Write-host "`     `tExtTCP: $($openportarraytcpstatus[0])" }
  If ($($portarrayname[1])) { Write-Host "$($portarrayname[1])" -n }
  If ($($portarrayvalue[1])) { Write-host "`    `t: $($portarrayvalue[1])" -n }
  If ($($portarraytcpstatus[1])) { Write-host "`    `tTCPBind: $($portarraytcpstatus[1])" -n }
  If ($($portarrayudpstatus[1])) { Write-host "`    UDPBind: $($portarrayudpstatus[1])" }
  #  If ($($openportarraytcpstatus[1])) {Write-host "`     `tExtTCP: $($openportarraytcpstatus[1])" }
    If ($($portarrayname[2])) {Write-Host "$($portarrayname[2])" -n}
    If ($($portarrayvalue[2])) {Write-host "`   `t: $($portarrayvalue[2])" -n }
    If ($($portarraytcpstatus[2])) {Write-host "`   `tTCPBind: $($portarraytcpstatus[2])" -n}
    If ($($portarrayudpstatus[2])) {Write-host "`   UDPBind: $($portarrayudpstatus[2])" }
   # If ($($openportarraytcpstatus[2])) {Write-host "`     `tExtTCP: $($openportarraytcpstatus[2])" }
    If ($($portarrayname[3])) {Write-Host "$($portarrayname[3])" -n}
    If ($($portarrayname[3])) {Write-host "`   `t: $($portarrayvalue[3])" -n}
    If ($($portarraytcpstatus[3])) {Write-host "`  `tTCPBind: $($portarraytcpstatus[3])" -n}
    If ($($portarrayudpstatus[3])) {Write-host "`  UDPBind: $($portarrayudpstatus[3])" }
  #  If ($($openportarraytcpstatus[3])) {Write-host "`     `tExtTCP: $($openportarraytcpstatus[3])" }
    If ($($portarrayname[4])) {Write-Host "$($portarrayname[4])" -n} 
    If ($($portarrayname[4])) {Write-host "`    `t: $($portarrayvalue[4])" -n}
    If ($($portarraytcpstatus[4])) {Write-host "`   `tTCPBind: $($portarraytcpstatus[4])" -n}
    If ($($portarrayudpstatus[4])) {Write-host "`   UDPBind: $($portarrayudpstatus[4])" }
  #  If ($($openportarraytcpstatus[4])) {Write-host "`     `tExtTCP: $($openportarraytcpstatus[4])" }
    If ($portarraytcpOwningProcess) {Write-host "` $($portarraytcpOwningProcess)"}
    If ($portarrayudpOwningProcess) {Write-host "` $($portarrayudpOwningProcess)"}
    Write-Host ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:."
    Write-Host "App ID          : $appid"
    Write-Host "Process         : $process"
    Write-Host "    Process status    : "-NoNewline; ; If ($Null -eq (Get-Process "$process" -ea SilentlyContinue)) { $status = " ----NOT RUNNING----"; ; Write-Host $status -F R }Else { $status = "**** RUNNING ****"; ; Write-Host $status -F Green }
    Write-Host "    Steam Master      : .:.:.:.:.:.."
    Write-Host "         Status       : "-NoNewline; ; If ($Null -eq $stats) { $stats = "----Offline----"; ; Write-Host $stats -F R }Else { $stats = "**** Online ***"; ; Write-Host $stats -F Green }
    If ($stats) {
        Write-Host "         -addr        : $($masterserver.addr)"
        Write-Host "         -gmsindex    : $($masterserver.gmsindex)"
        Write-Host "         -appid       : $($masterserver.appid)"
        Write-Host "         -gamedir     : $($masterserver.gamedir)"
        Write-Host "         -region      : $($masterserver.region)"
        Write-Host "         -secure      : $($masterserver.secure)"
        Write-Host "         -lan         : $($masterserver.lan)"
        Write-Host "         -gameport    : $($masterserver.gameport)"
        Write-Host "         -secport     : $($masterserver.secport)"
    }
    Write-Host " "
    Write-Host "Visual C++ Packages installed"
    Write-Host ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:."
    If ($visualcpackages) {Write-host "`t$($visualcpackages)"}
    Write-Host " "
    Write-Host "Direct X Version"
    Write-Host ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:."
    Write-Host "$($directx.PSChildName)`t$($directx.Version)"
    Write-Host " "
    Write-Host "Host Storage"
    Write-Host ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:."
    $diskresults
    $global:botdetails = @{
        ServerName = $hostname;
        CPU = $($window32processor.LoadPercentage);
        TotalMemory = $totalmem ;
        MemoryUsed = $totalusedmem ;
        Steam_Master = $stats;
        Backups = $backups;
        Storage      = $diskresults;
    } | ConvertTo-Json
}