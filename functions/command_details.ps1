#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Details {
    $Cpu = (Get-WMIObject win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object Average ).Average
    $host.UI.RawUI.ForegroundColor = "Cyan"
    #$host.UI.RawUI.BackgroundColor = "Black"
    $CpuCores = (Get-WMIObject Win32_ComputerSystem).NumberOfLogicalProcessors
    $avmem = (Get-WMIObject Win32_OperatingSystem | Foreach-Object { "{0:N2} GB" -f ($_.totalvisiblememorysize / 1MB) })
    $totalmem = "{0:N2} GB" -f ((Get-Process | Measure-Object Workingset -sum).Sum / 1GB)
    If ($Null -ne (Get-Process "$PROCESS" -ea SilentlyContinue)) {
        $mem = "{0:N2} GB" -f ((Get-Process $PROCESS | Measure-Object Workingset -sum).Sum / 1GB) 
    }
    $os = (Get-WMIObject win32_operatingsystem).caption
    $computername = (Get-WMIObject Win32_OperatingSystem).CSName
    Set-Location $currentdir\node-v$nodeversion-win-x64\node-v$nodeversion-win-x64
    If ($null -ne ${QUERYPORT}) { 
        ${PORT} = ${QUERYPORT} 
    }
    If ($Useprivate -eq "0") {
        $gameresponse = (.\gamedig --type $GAME ${EXTIP}:${PORT} --pretty | Select-String -Pattern 'game' -CaseSensitive -SimpleMatch)
        $stats = (.\gamedig --type $GAME ${EXTIP}:${PORT} --pretty | Select-String -Pattern 'ping' -CaseSensitive -SimpleMatch)
    }
    Else {
        $gameresponse = (.\gamedig --type $GAME ${IP}:${PORT} --pretty | Select-String -Pattern 'game' -CaseSensitive -SimpleMatch)
        $stats = (.\gamedig --type $GAME ${IP}:${PORT} --pretty | Select-String -Pattern 'ping' -CaseSensitive -SimpleMatch)    
    }
    
    Get-CreatedVaribles
    New-BackupFolder
    $backups = (Get-Childitem  $currentdir\backups -recurse | Measure-Object) 
    $backups = $backups.count 
    $backupssize = "{0:N2} GB" -f ((Get-Childitem $currentdir\backups | Measure-Object Length -s -ea silentlycontinue ).Sum / 1GB) 
    If (($AppID -eq 302200)) { 
        $gameresponse = "Not supported" 
    }
    #Get-WMIObject -Class Win32_Product -Filter "Name LIKE '%Visual C++ 2010%'"
    Write-Host "                                "
    Write-Host "    Server Name       : $HOSTNAME"
    Write-Host "    Public IP         : $EXTIP"
    Write-Host "    IP                : $IP"
    Write-Host "    Port              : $PORT"
    Write-Host "    Query Port        : $QUERYPORT"
    Write-Host "    Rcon Port         : $RCONPORT"
    Write-Host "    App ID            : $APPID"
    Write-Host "    Game Dig          : $GAME"
    #    Write-Host "    Webhook           : $WEBHOOK"
    Write-Host "    Process           : $PROCESS"
    Write-Host "    Process status    : "-NoNewline; ; If ($Null -eq (Get-Process "$PROCESS" -ea SilentlyContinue)) { $status = " ----NOT RUNNING----"; ; Write-Host $status -F R }Else { $status = " **** RUNNING ****"; ; Write-Host $status -F Green }
    Write-Host "    CPU Cores         : $CpuCores"
    Write-Host "    CPU %             : $cpu"
    Write-Host "    Total RAM         : $avmem    "
    Write-Host "    Total RAM Usage   : $totalmem"
    Write-Host "    Process RAM Usage : $mem"
    Write-Host "    Backups           : $backups"
    Write-Host "    Backups size GB   : $backupssize"
    Write-Host "    Status            : "-NoNewline; ; If ($Null -eq $stats) { $stats = "----Offline----"; ; Write-Host $stats -F R }Else { $stats = "**** Online ***"; ; Write-Host $stats -F Green }
    Write-Host "    game replied      : $gameresponse"
    Write-Host "    OS                : $os"
    Write-Host "    hostname          : $computername"
    Set-Location $currentdir
}
Function Get-DriveSpace {
    $disks = Get-WMIObject -class "Win32_LogicalDisk" -namespace "root\CIMV2" -computername $env:COMPUTERNAME
    $results = Foreach ($disk in $disks) {
        If ($disk.Size -gt 0) {
            $size = [math]::round($disk.Size / 1GB, 0)
            $free = [math]::round($disk.FreeSpace / 1GB, 0)
            [PSCustomObject]@{
                Drive           = $disk.Name
                Name            = $disk.VolumeName
                "Total Disk GB" = $size
                "Free Disk GB"  = "{0:N0} ({1:P0})" -f $free, ($free / $size)
            }
        }
    }
    #$results | Out-GridView
    $results | Format-Table -AutoSize
    #$results | Export-Csv  .\disks.csv -NoTypeInformation -Encoding ASCII
}
