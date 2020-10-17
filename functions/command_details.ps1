#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-DriveSpace {
    Write-log "Function: Get-DriveSpace"
    If ($psSeven) { 
    $disks = Get-CimInstance -class "Win32_LogicalDisk" -namespace "root\CIMV2" -computername $env:COMPUTERNAME
    }
    Else {
    $disks = Get-WMIObject -class "Win32_LogicalDisk" -namespace "root\CIMV2" -computername $env:COMPUTERNAME
    }
    $global:diskresults = Foreach ($disk in $disks) {
        If ($disk.Size -gt 0) {
            $size = [math]::round($disk.Size / 1GB, 0)
            $free = [math]::round($disk.FreeSpace / 1GB, 0)
            [PSCustomObject]@{
                Disk           = $disk.Name
                Name            = $disk.VolumeName
                "Total GB" = $size
                "Free GB"  = "{0:N0} ({1:P0})" -f $free, ($free / $size)
            }
        }
    }
}


Function Get-Details {
    $host.UI.RawUI.ForegroundColor = "Cyan"
    $portarrayname = @()
    $portarrayvalue = @()
    $portarraytcpstatus = @()
    $portarrayudpstatus = @()
    ($array = (Get-Variable | ? name -like "*port")) | foreach { $portarrayvalue += "$($_.value)" ; $portarrayname += "$($_.name)"} ; $array |  foreach { if ($status = (Get-NetTCPConnection -LocalPort $_.Value -ErrorAction SilentlyContinue).State) {$portarraytcpstatus+="Open"}Else{$portarraytcpstatus+="Closed"}}
    $array |  foreach { if ($status = (Get-NetUDPEndpoint -LocalPort $_.Value -ErrorAction SilentlyContinue).LocalPort) {$portarrayudpstatus+="Open"}Else{$portarrayudpstatus+="Closed"}}

    If ($psSeven) { 
        $windows32 = Get-CimInstance Win32_OperatingSystem
        $window32processor = Get-CimInstance Win32_processor
        $windows32computer = Get-CimInstance Win32_ComputerSystem
        $uptime = (Get-Date) - ($windows32.lastbootuptime)
    }
    Else {
        $windows32 = Get-WmiObject Win32_OperatingSystem
        $window32processor = Get-WMIObject Win32_processor
        $windows32computer = Get-WMIObject Win32_ComputerSystem
        $uptime = (Get-Date) - ($windows32.ConvertToDateTime($windows32.lastbootuptime))
    }
    Get-ChecktaskDetails
    Get-ChecktaskautorestartDetails
    Test-SteamMaster
    Get-CreatedVaribles
    $stats = $masterserver
    # $masterserver = $masterserver.addr
    New-BackupFolder
    $netinterface = Get-NetAdapter
    $netip = (Get-NetIPConfiguration | ? InterfaceAlias -like "$($netinterface.Name[0])").IPv4Address.IPAddress


    
    $uptime = "uptime:    " + $Uptime.Days + " days, " + $Uptime.Hours + " hours, " + $Uptime.Minutes + " minutes" 
    $totalfree = "{0:N2} GB" -f ($windows32.FreePhysicalMemory / 1MB)
    $totalmem = "{0:N2} GB" -f ($windows32.TotalVisibleMemorySize / 1MB)
    $totalusedmem = "{0:N2} GB" -f ( ( $windows32.TotalVisibleMemorySize - $windows32.FreePhysicalMemory) / 1MB)
    $backups = ((Get-Childitem  $backupdir -recurse | Measure-Object).Count) 
    $backupssize = "{0:N2} GB" -f ((Get-Childitem $backupdir  -recurse | Measure-Object Length -Sum -ea silentlycontinue ).Sum / 1GB) 
    $serverfilesdir = "{0:N2} GB" -f ((Get-Childitem $serverfiles  -recurse | Measure-Object Length -Sum -ea silentlycontinue ).Sum / 1GB) 
    $ssmdir = "{0:N2} GB" -f ((Get-Childitem $currentdir  -recurse  | Measure-Object Length -Sum -ea silentlycontinue ).Sum / 1GB) 

    If ((Get-Process "$process" -ea SilentlyContinue)) {
        $gameservermem = "{0:N2} GB" -f ((Get-Process $process).WS / 1GB) 
    }
    $gamecpucooked = [math]::Truncate(((Get-Counter '\Process(*)\% Processor Time' -ea SilentlyContinue).CounterSamples | Where-Object InstanceName -like $process).CookedValue)

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
    Write-Host "SSM Total:         $ssmdir"
    Write-Host "Serverfiles:       $serverfilesdir"
    Write-Host "Backups:           $backups"
    Write-Host "Backups Size:      $backupssize"
    Write-Host " "
    Write-Host "Server details"
    Write-Host ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:."
    Write-Host "Server Name     : $hostname"
    If ($($portarrayname[0])) {Write-Host "$($portarrayname[0])" -n} 
    If ($($portarrayname[0])) {Write-host "`     `t: $($portarrayvalue[0])" -n}
    If ($($portarrayname[0])) {Write-host "`     `tTCP: $($portarraytcpstatus[0])" -n}
    If ($($portarrayname[0])) {Write-host "`     UDP: $($portarrayudpstatus[0])" }
    If ($($portarrayname[1])) {Write-Host "$($portarrayname[1])" -n} 
    If ($($portarrayname[1])) {Write-host "`    `t: $($portarrayvalue[1])" -n }
    If ($($portarrayname[1])) {Write-host "`    `tTCP: $($portarraytcpstatus[1])" -n}
    If ($($portarrayname[1])) {Write-host "`    `tUDP: $($portarrayudpstatus[1])" }
    If ($($portarrayname[2])) {Write-Host "$($portarrayname[2])" -n}
    If ($($portarrayname[2])) { Write-host "`   `t: $($portarrayvalue[2])" -n }
    If ($($portarrayname[2])) { Write-host "`   `tTCP: $($portarraytcpstatus[2])" -n}
    If ($($portarrayname[2])) { Write-host "`   `tUDP: $($portarrayudpstatus[2])" }
    If ($($portarrayname[3])) {Write-Host "$($portarrayname[3])" -n}
    If ($($portarrayname[3])) { Write-host "`   `t: $($portarrayvalue[3])" -n}
    If ($($portarrayname[3])) { Write-host "`   `tTCP: $($portarraytcpstatus[3])" -n}
    If ($($portarrayname[3])) { Write-host "`   `tUDP: $($portarrayudpstatus[3])" }
    If ($($portarrayname[4])) {Write-Host "$($portarrayname[4])" -n} 
    If ($($portarrayname[4])) {Write-host "`    `t: $($portarrayvalue[4])" -n}
    If ($($portarrayname[4])) {Write-host "`    `tTCP: $($portarraytcpstatus[4])" -n}
    If ($($portarrayname[4])) {Write-host "`    `tUDP: $($portarrayudpstatus[4])" }
    # Write-Host "Port              : $port"
    # Write-Host "Query Port        : $queryport"
    # Write-Host "Rcon Port         : $rconport"
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
    Get-DriveSpace
    Write-Host " "
    Write-Host "Host Storage"
    Write-Host ".:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:."
    $diskresults

}


Function Get-Details_old {
    Write-log "Function: Get-Details"
    If ($psSeven) { 
        $Cpu = (Get-CimInstance win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object Average ).Average
        $CpuCores = (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors
        $avmem = (Get-CimInstance Win32_OperatingSystem | Foreach-Object { "{0:N2} GB" -f ($_.totalvisiblememorysize / 1MB) })
        $os = (Get-CimInstance win32_operatingsystem).caption
        $computername = (Get-CimInstance Win32_OperatingSystem).CSName

    }
    Else {
        $Cpu = (Get-WMIObject win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object Average ).Average
        $CpuCores = (Get-WMIObject Win32_ComputerSystem).NumberOfLogicalProcessors
        $avmem = (Get-WMIObject Win32_OperatingSystem | Foreach-Object { "{0:N2} GB" -f ($_.totalvisiblememorysize / 1MB) })
        $os = (Get-WMIObject win32_operatingsystem).caption
        $computername = (Get-WMIObject Win32_OperatingSystem).CSName
    }
    $host.UI.RawUI.ForegroundColor = "Cyan"
    #$host.UI.RawUI.BackgroundColor = "Black"
    $totalmem = "{0:N2} GB" -f ((Get-Process | Measure-Object Workingset -sum).Sum / 1GB)
    If ((Get-Process "$process" -ea SilentlyContinue)) {
        $mem = "{0:N2} GB" -f ((Get-Process $process | Measure-Object Workingset -sum).Sum / 1GB) 
    }
    Get-ChecktaskDetails
    Get-ChecktaskautorestartDetails
    Test-SteamMaster
    Get-CreatedVaribles
    $stats = $masterserver
    # $masterserver = $masterserver.addr
    New-BackupFolder
    $backups = (Get-Childitem  $backupdir -recurse | Measure-Object) 
    $backups = $backups.count 
    $backupssize = "{0:N2} GB" -f ((Get-Childitem $backupdir | Measure-Object Length -Sum -ea silentlycontinue ).Sum / 1GB) 
    #Get-WMIObject -Class Win32_Product -Filter "Name LIKE '%Visual C++ 2010%'"
    Write-Host "                                "
    Write-Host "    Server Name       : $hostname"
    Write-Host "    Public IP         : $extip"
    Write-Host "    IP                : $ip"
    Write-Host "    Port              : $port"
    Write-Host "    Query Port        : $queryport"
    Write-Host "    Rcon Port         : $rconport"
    Write-Host "    App ID            : $appid"
    Write-Host "    Game Dig          : $querytype"
    Write-Host "    Process           : $process"
    Write-Host "    Process status    : "-NoNewline; ; If ($Null -eq (Get-Process "$process" -ea SilentlyContinue)) { $status = " ----NOT RUNNING----"; ; Write-Host $status -F R }Else { $status = " **** RUNNING ****"; ; Write-Host $status -F Green }
    Write-Host "    CPU Cores         : $CpuCores"
    Write-Host "    CPU %             : $cpu"
    Write-Host "    Total RAM         : $avmem    "
    Write-Host "    Total RAM Usage   : $totalmem"
    Write-Host "    Process RAM Usage : $mem"
    Write-Host "    Backups           : $backups"
    Write-Host "    Backups size GB   : $backupssize"
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
    Write-Host "         -secport     : $($masterserver.secport)"}
    Write-Host "    Monitor Job       : $monitorjob"
    Write-Host "    Autorestart       : $restartjob"
    Write-Host "    OS                : $os"
    Write-Host "    hostname          : $computername"
    Set-Location $currentdir
}