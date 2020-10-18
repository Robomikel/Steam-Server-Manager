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

Function Install-VisualCPlusPlus {
    $chunk = {
        Function Install-AllVcRedists([string]$location)
        {
            [console]::ForegroundColor = "Cyan"
            [console]::BackgroundColor = "Black"
            If (!(Test-Path $location\VcRedist)){
                Write-Information " - - - > creating VcRedist Folder - - - > " -InformationAction Continue
                mkdir $location\VcRedist
            }
            Write-Information " - - - > Install Module VcRedist - - - > " -InformationAction Continue
            Pause
            Install-Module VcRedist
            If ($?) { Write-Information " - - - Installling Module VcRedist Succeeded- - - " -InformationAction Continue }Else{ Write-Warning " - - - Installing Module VcRedist Failed- - - " -WarningAction Stop ; Exit}
            
            Write-Information " - - - > Import Module VcRedist - - - > " -InformationAction Continue
            Pause
            Import-Module VcRedist
            If ($?) { Write-Information " - - - Importing Module VcRedist Succeeded- - - " -InformationAction Continue }Else{ Write-Warning " - - - Importing Module VcRedist Failed- - - " -WarningAction Stop ; Exit}
            
            Write-Information " - - - > Get VcRedist Download List- - - > " -InformationAction Continue
            Pause
            Get-VcList -OutVariable vclist
            If ($?) { Write-Information " - - - Getting VcRedist List Download Succeeded- - - " -InformationAction Continue }Else{ Write-Warning " - - - Getting VcRedist List Download Failed- - - " -WarningAction Stop ; Exit}


            Write-Information " - - - > Download VcRedist to $location\VcRedist - - - > " -InformationAction Continue
            Pause
            Get-VcRedist -Path $location\VcRedist -vclist $vclist
            If ($?) { Write-Information " - - - Downloading VcRedist Succeeded- - - " -InformationAction Continue }Else{ Write-Warning " - - - Downloading VcRedist Failed- - - " -WarningAction Stop ; Exit}

            Write-Information " - - - > Install All VcRedist - - - > " -InformationAction Continue
            Pause
            $vclist | Install-VcRedist  -Path $location\VcRedist
            If ($?) { Write-Information " - - - Installing VcRedist Succeeded- - - " -InformationAction Continue }Else{ Write-Warning " - - - Installing VcRedist Failed- - - " -WarningAction Stop ; Exit}

            Write-Information " - - - > List All Installed VcRedist - - - > " -InformationAction Continue
            Pause
            Get-InstalledVcRedist
            pause
        }
    }
    $currentdirectory = $(gl)
    Start-Process -FilePath PowerShell -verb runas -ArgumentList "-Command & {$chunk Install-AllVcRedists('$currentdirectory')}"
}