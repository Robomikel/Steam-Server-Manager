
#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Install-ServerFiles {

    Set-Location $steamdirectory
    If ($ANON -eq "yes") {
        .\steamCMD +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir $serverdir +app_update $APPID $Branch +Exit
    }
    Else {
        Write-Host "Enter Username for Steam install" -F Cyan -B Black
        $global:username = Read-host
        .\steamCMD +@ShutdownOnFailedCommand 1 +login $username +force_install_dir $serverdir +app_update $APPID $Branch +Exit
    }
    If (($?) -or ($LASTEXITCODE -eq 7)) {
        Write-Host "****   Downloading  Install server succeeded   ****" -F Y
    }
    ElseIf (!$?) {
        Write-Host "****   Downloading  Install server Failed   ****" -F R
        New-TryagainNew 
    }

    Set-Location $currentdir
}
Function Install-ServerFiles {
    Set-Location $steamdirectory
    If ($ANON -eq "yes") {
        Write-Host "Please Wait: Writing Steam output to $steamdirectory\logs\steamcmd.log" -F Y
        #  .\steamcmd +login anonymous +force_install_dir $serverdir +app_update $APPID $Branch +Exit
        .\steamCMD +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir $serverdir +app_update $APPID $Branch +Exit | Tee-Object -FilePath $steamdirectory\logs\steamcmd.log
        # $appinstalllog = Get-Content $steamdirectory\logs\steamcmd.log -last 10 | Where-Object {$_ -like "* Failed *"}
        $appinstalllog = [IO.File]::ReadAllText("$steamdirectory\logs\steamcmd.log")
        Write-Host "checking log $steamdirectory\logs\steamcmd.log" -F Y
        If ($appinstalllog -Like "*No subscription*") {
            Write-Host "****  No subscription, Requires steamcmd login   ****" -F R
            New-TryagainNew 
        }
        ElseIf ($appinstalllog -Like "* Failed *") {
            Write-Host "****   Downloading  Install server Failed   ****" -F R
            New-TryagainNew 
        }
        ElseIf ($appinstalllog -Like "*Success*") {
            Write-Host "****   Downloading  Install server succeeded   ****" -F Y
        }           
        Else {
            New-TryagainSteam
        }
    }
    Else {
        Write-Host "Enter Username for Steam install" -F Cyan -B Black
        $global:username = Read-host
        Write-Host "Enter steam password" -F Cyan -B Black
        $SecurePassword = Read-Host -AsSecureString
        Write-Host "Please Wait: Writing Steam output to $steamdirectory\logs\steamcmd.log" -F Y
        # .\steamcmd +login $username +force_install_dir $serverdir +app_update $APPID $Branch +Exit
        # Success! App '1110390' fully installed.
        .\steamCMD +@ShutdownOnFailedCommand 1 +login $username $SecurePassword +force_install_dir $serverdir +app_update $APPID $Branch +Exit | Tee-Object -FilePath $steamdirectory\logs\steamcmd.log 
        # appinstalllog = Get-Content $steamdirectory\logs\steamcmd.log -last 10 | Where-Object {$_ -like "* Failed *"}
        Write-Host "checking log $steamdirectory\logs\steamcmd.log" -F Y
        $appinstalllog = [IO.File]::ReadAllText("$steamdirectory\logs\steamcmd.log")
        If ($appinstalllog -Like "*Invalid Password*") {
            Write-Host "****   Failed Password   ****" -F R
            New-TryagainNew 
        }
        ElseIf ($appinstalllog -Like "* Failed *") {
            Write-Host "****   Downloading  Install server Failed   ****" -F R
            New-TryagainNew 
        }
        ElseIf ($appinstalllog -Like "*Success*") {
            Write-Host "****   Downloading  Install server succeeded   ****" -F Y
        }    
        Else {
            New-TryagainSteam
        }
    }
    Set-Location $currentdir
}
