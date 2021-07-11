#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-AdminCheck {
    Write-log "Function: Get-AdminCheck"
    $user = "$env:COMPUTERNAME\$env:USERNAME"
    $group = 'Administrators'
    $isInGroup = (Get-LocalGroupMember $group).Name -contains $user
    If ($isInGroup -eq $true) {
        Get-adminMessage
    }
}

$chunk = {
    Function Install-AllVC([string]$installdirectory) {
        [console]::ForegroundColor = 'Cyan'
        [console]::BackgroundColor = 'Black'
        If (!(Test-Path $installdirectory\VcRedist)) {
            Write-Information ' - - - > creating VcRedist Folder - - - > ' -InformationAction Continue
            mkdir $installdirectory\VcRedist
        }
        Write-Information ' - - - > Install Module VcRedist - - - > ' -InformationAction Continue
        Pause
        Install-Module VcRedist
        
        Write-Information ' - - - > Import Module VcRedist - - - > ' -InformationAction Continue
        Pause
        Import-Module VcRedist
        
        Write-Information ' - - - > Get VcRedist Download List- - - > ' -InformationAction Continue
        Pause
        Get-VcList -OutVariable vclist


        Write-Information ' - - - > Download VcRedist to Steam-Server-Manager\VcRedist - - - > ' -InformationAction Continue
        Pause
        Get-VcRedist -Path $installdirectory\VcRedist -vclist $vclist

        Write-Information ' - - - > Install All VcRedist - - - > ' -InformationAction Continue
        Pause
        $vclist | Install-VcRedist  -Path $installdirectory\VcRedist

        Write-Information ' - - - > List All Installed VcRedist - - - > ' -InformationAction Continue
        Pause
        Get-InstalledVcRedist
        pause
    }
}
Function Install-VisualCPlusPlus {
    # Run the script block and pass in parameters.
    $installdirectory = "$currentdir"
    Start-Process -FilePath PowerShell -verb runas -ArgumentList "-Command & {$chunk Install-AllVC('$installdirectory')}"
}
