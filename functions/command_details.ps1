Function Get-Details {
    $global:Cpu = (Get-WMIObject win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object Average ).Average
    $host.UI.RawUI.ForegroundColor = "Cyan"
    #$host.UI.RawUI.BackgroundColor = "Black"
    $global:CpuCores = (Get-WMIObject Win32_ComputerSystem).NumberOfLogicalProcessors
    $global:avmem = (Get-WMIObject Win32_OperatingSystem | Foreach-Object { "{0:N2} GB" -f ($_.totalvisiblememorysize / 1MB) })
    $global:totalmem = "{0:N2} GB" -f ((Get-Process | Measure-Object Workingset -sum).Sum / 1GB)
    If ($Null -ne (Get-Process "$global:PROCESS" -ea SilentlyContinue)) {
        $global:mem = "{0:N2} GB" -f ((Get-Process $global:PROCESS | Measure-Object Workingset -sum).Sum / 1GB) 
    }
    $global:os = (Get-WMIObject win32_operatingsystem).caption
    $global:computername = (Get-WMIObject Win32_OperatingSystem).CSName
    Set-Location $global:currentdir\node-v$global:nodeversion-win-x64\node-v$global:nodeversion-win-x64
    If ($null -ne ${global:QUERYPORT}) { 
        ${global:PORT} = ${global:QUERYPORT} 
    }
    If ($global:Useprivate -eq "0") {
        $global:gameresponse = (.\gamedig --type $global:GAME ${global:EXTIP}:${global:PORT} --pretty | Select-String -Pattern 'game' -CaseSensitive -SimpleMatch)
        $global:stats = (.\gamedig --type $global:GAME ${global:EXTIP}:${global:PORT} --pretty | Select-String -Pattern 'ping' -CaseSensitive -SimpleMatch)
    }
    Else {
        $global:gameresponse = (.\gamedig --type $global:GAME ${global:IP}:${global:PORT} --pretty | Select-String -Pattern 'game' -CaseSensitive -SimpleMatch)
        $global:stats = (.\gamedig --type $global:GAME ${global:IP}:${global:PORT} --pretty | Select-String -Pattern 'ping' -CaseSensitive -SimpleMatch)    
    }
    
    Get-CreatedVaribles
    New-BackupFolder
    $global:backups = (Get-Childitem  $global:currentdir\backups -recurse | Measure-Object) 
    $global:backups = $backups.count 
    $global:backupssize = "{0:N2} GB" -f ((Get-Childitem $global:currentdir\backups | Measure-Object Length -s -ea silentlycontinue ).Sum / 1GB) 
    If (($global:AppID -eq 302200)) { 
        $global:gameresponse = "Not supported" 
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
    Write-Host "    Process status    : "-NoNewline; ; If ($Null -eq (Get-Process "$global:PROCESS" -ea SilentlyContinue)) { $global:status = " ----NOT RUNNING----"; ; Write-Host $status -F R }Else { $global:status = " **** RUNNING ****"; ; Write-Host $status -F Green }
    Write-Host "    CPU Cores         : $CpuCores"
    Write-Host "    CPU %             : $cpu"
    Write-Host "    Total RAM         : $avmem    "
    Write-Host "    Total RAM Usage   : $totalmem"
    Write-Host "    Process RAM Usage : $mem"
    Write-Host "    Backups           : $backups"
    Write-Host "    Backups size GB   : $backupssize"
    Write-Host "    Status            : "-NoNewline; ; If ($Null -eq $global:stats) { $global:stats = "----Offline----"; ; Write-Host $stats -F R }Else { $global:stats = "**** Online ***"; ; Write-Host $stats -F Green }
    Write-Host "    game replied      : $gameresponse"
    Write-Host "    OS                : $os"
    Write-Host "    hostname          : $computername"
    Set-Location $global:currentdir
}
Function Get-DriveSpace {
    $global:disks = Get-WMIObject -class "Win32_LogicalDisk" -namespace "root\CIMV2" -computername $env:COMPUTERNAME
    $global:results = Foreach ($disk in $disks) {
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
    $global:results | Format-Table -AutoSize
    #$results | Export-Csv  .\disks.csv -NoTypeInformation -Encoding ASCII
}
