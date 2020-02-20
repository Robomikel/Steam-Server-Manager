#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-DiscordAlert { 
    Get-DiscordSetting
    Find-DiscordWebhook
    If ($alert -eq "Backup") {
        Get-AlertBackup
    }
    ElseIf ($alert -eq "update") {
        Get-AlertUpdate
    }
    ElseIf ($alert -eq "restart") {
        Get-AlertRestart
    }
    Else{
        Get-AlertTest
    }
    Send-DiscordAlert                              
    # Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'  
}   
Function Send-DiscordAlert {
    $global:InfoMessage = "discord"
    Get-Infomessage
    # Write-Host '****   Sending Discord Alert   ****' -F M -B Black
    $thumbnailObject = [PSCustomObject]@{
        url = "https://i.imgur.com/tTrtYMe.png"
    }
    $webHookUrl = "$discordwebhook"
    [System.Collections.ArrayList]$embedArray = @()
    $title = "$HOSTNAME"
    $description = "$MESSAGE"
    $color = "$MESSAGECOLOR"
    $embedObject = [PSCustomObject]@{
        title       = $title       
        description = $description  
        color       = $color
        thumbnail = $thumbnailObject
    }                              
    $embedArray.Add($embedObject) | Out-Null
    $payload = [PSCustomObject]@{
        embeds = $embedArray
    }
    Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
}
Function Find-DiscordWebhook {
    If ( "" -eq $discordwebhook) {
        Write-Host "$DIAMOND $DIAMOND Missing WEBHOOK ! $DIAMOND $DIAMOND"-F R -B Black
        Write-Host "****   Add Discord  WEBHOOK to $currentdir\$serverfiles\Variables-$serverfiles.ps1   ****" -F Y -B Black  
        Get-ClearVariables
        Break  
    }
}

Function Get-DiscordSetting {
    If ($DiscordBackupAlert -eq "off") {    
        Write-Host "Discord alerts not enabled" -F Y
    }
}

Function Get-AlertUpdate {
    # UDPATE
    $global:MESSAGE = ' Server Updated '
    # BLUE
    $global:MESSAGECOLOR = '385734'
}

Function Get-AlertBackup {
    # BACKUP
    $global:MESSAGE = ' Server Backed UP'
    # GREEN
    $global:MESSAGECOLOR = '3334680'
}

Function Get-AlertRestart {
    # RESTART
    $global:MESSAGE = " Server not Running, Starting Server "
    # RED
    $global:MESSAGECOLOR = '16711680'
}

Function Get-AlertTest {
    # BACKUP
    $global:MESSAGE = ' Test Alert'
    # Cyan
    $global:MESSAGECOLOR = '026255'
}