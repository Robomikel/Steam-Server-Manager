#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-DiscordAlert { 
    If ($DiscordBackupAlert) {
        If ($DiscordBackupAlert -eq "on") { 
            If (($discordwebhook)) {
                If ($alert -eq "Backup") {
                    # BACKUP
                    $global:alertmessage = ' New Server Backup'
                    # GREEN
                    $global:alertmessagecolor = '3334680'
                    
                }
                ElseIf ($alert -eq "update") {
                    # UDPATE
                    $global:alertmessage = ' Server Updated '
                    # BLUE
                    $global:alertmessagecolor = '385734'
                }
                ElseIf ($alert -eq "restart") {
                    # RESTART
                    $global:alertmessage = " Server not Running, Starting Server "
                    # RED
                    $global:alertmessagecolor = '16711680'
                }
                ElseIf ($command -eq "discord") {
                    # BACKUP
                    $global:alertmessage = ' Test Alert'
                    # Cyan
                    $global:alertmessagecolor = '026255'
                }
                Send-DiscordAlert                              
                # Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'  
            }
            ElseIf (!$discordwebhook) {
                $global:warnmessage = "missingwebhook"
                Get-warnmessage
            }
        }
        ElseIf ($DiscordBackupAlert -eq "off") {
            $global:warnmessage = "discordnotenabled"
            Get-warnmessage
        }
    }
}
Function Send-DiscordAlert {
    $global:InfoMessage = "discord"
    Get-Infomessage
    $thumbnailObject = [PSCustomObject]@{
        url = "https://i.imgur.com/tTrtYMe.png"
    }
    $webHookUrl = "$discordwebhook"
    [System.Collections.ArrayList]$embedArray = @()
    $title = "Server Name:  $HOSTNAME   "
    $description = "Alert:  $alertmessage    "
    $color = "$alertmessagecolor"
    $embedObject = [PSCustomObject]@{
        title       = $title       
        description = $description  
        color       = $color
        thumbnail   = $thumbnailObject
    }                              
    $embedArray.Add($embedObject) | Out-Null
    $payload = [PSCustomObject]@{
        embeds = $embedArray
    }
    Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
    If (!$?) {
        $global:warnmessage = "AlertFailed"
        Get-warnmessage
    }
}
