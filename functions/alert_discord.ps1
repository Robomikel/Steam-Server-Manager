#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-DiscordAlert {
    param ($alert)
    Write-log "Function: New-DiscordAlert"
    If ($DiscordAlert) {
        If ($DiscordAlert -eq "on") { 
            If (($discordwebhook)) {
                If ($alert -eq "Backup") {
                    If ($DiscordBackupAlert) {
                        If ($DiscordBackupAlert -eq "on") { 
                            # BACKUP
                            $global:alertmessage = ' New Server Backup'
                            # GREEN
                            $global:alertmessagecolor = 'ForestGreen'
                        }
                    }
                }
                ElseIf ($alert -eq "update") {
                    If ($DiscordUpdateAlert) {
                        If ($DiscordUpdateAlert -eq "on") { 
                            # UDPATE
                            $global:alertmessage = ' Server Updated '
                            # BLUE
                            $global:alertmessagecolor = 'DarkBlue'
                        }
                    }
                }
                ElseIf ($alert -eq "restart") {
                    If ($DiscordRestartAlert) {
                        If ($DiscordRestartAlert -eq "on") { 
                            # RESTART
                            $global:alertmessage = " Server not Running, Starting Server "
                            # RED
                            $global:alertmessagecolor = 'FireBrick'
                        }
                    }
                }
                ElseIf ($command -eq "discord") {
                    # BACKUP
                    $global:alertmessage = ' Test Alert'
                    # Cyan
                    $global:alertmessagecolor = 'RoyalBlue'
                }
                Send-DiscordAlert                              
                # Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'  
            }
            ElseIf (!$discordwebhook) {
                Get-warnmessage "missingwebhook"
            }
        }
        ElseIf ($DiscordAlert -eq "off") {
            Get-warnmessage "discordnotenabled"
        }
    }
}
Function Send-DiscordAlert_old {
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
        Get-warnmessage "AlertFailed"
    } 
    Else {
        $global:InfoMessage = "discord"
        Get-Infomessage $true
    }
}


Function Send-DiscordAlert {
    Write-log "Function: Send-DiscordAlert"
    If ($alertmessage -and $alertmessagecolor) {
        # https://github.com/EvotecIT/PSDiscord
        $global:Uri = "$discordwebhook"
        $global:Author = New-DiscordAuthor -Name 'Alert' -IconUrl "https://i.imgur.com/tTrtYMe.png"
        If ($discorddisplayip) {
            $global:Fact = New-DiscordFact -Name "Server IP: " -Value "$discorddisplayip`:$port" -Inline $true
        }
        Else {
            $global:Fact = New-DiscordFact -Name "Server IP: " -Value "$extip`:$port" -Inline $true
        }
        $global:Thumbnail = New-DiscordThumbnail -Url "https://i.imgur.com/t3WKCW1.png"
        $global:Section = New-DiscordSection -Title "$hostname" -Description "$alertmessage" -Facts $Fact -Color $alertmessagecolor -Author $Author -Thumbnail $Thumbnail # -Image $Thumbnail
        # $global:Section = New-DiscordSection -Title 'Everybody panic!' -Description '' -Facts $Fact, $Fact, $Fact -Color DeepSkyBlue -Author $Author -Thumbnail $Thumbnail -Image $Thumbnail
        Send-DiscordMessage -WebHookUrl $Uri -Sections $Section -AvatarName 'Steam-Server-Manager' -AvatarUrl "https://i.imgur.com/tTrtYMe.png"
        If (!$?) {
            Get-warnmessage "AlertFailed"
        }
        Else {
            $global:InfoMessage = 
            Get-Infomessage "discord" $true
        }    
    }
}
