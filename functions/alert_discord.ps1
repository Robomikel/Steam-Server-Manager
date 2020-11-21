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
                            $script:alerttype = 'Backup'
                            # BACKUP
                            $script:alertmessage = ' New Server Backup'
                            # GREEN
                            $script:alertmessagecolor = 'ForestGreen'
                            # Backup Count
                            $script:backups = ((Get-Childitem  $backupdir -recurse | Measure-Object).Count) 
                        }
                    }
                }
                ElseIf ($alert -eq "update") {
                    If ($DiscordUpdateAlert) {
                        If ($DiscordUpdateAlert -eq "on") { 
                            # UDPATE
                            $script:alertmessage = ' Server Updated '
                            $script:alerttype = 'Update'
                            # BLUE
                            $script:alertmessagecolor = 'DarkBlue'
                        }
                    }
                }
                ElseIf ($alert -eq "restart") {
                    If ($DiscordRestartAlert) {
                        If ($DiscordRestartAlert -eq "on") { 
                            # RESTART
                            $script:alertmessage = " Server not Running, Starting Server "
                            $script:alerttype = 'Restarted'
                            # RED
                            $script:alertmessagecolor = 'FireBrick'
                        }
                    }
                }
                ElseIf ($command -eq "discord") {
                    # BACKUP
                    $script:alertmessage = ' Test Alert'
                    $script:alerttype = 'test'
                    # Cyan
                    $script:alertmessagecolor = 'RoyalBlue'
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
        $script:InfoMessage = "discord"
        Get-Infomessage 
    }
}
Function Send-DiscordAlert {
    $game = Import-Csv $currentdir\data\serverlist.csv | where-object appid -like $appid | Select-Object -ExpandProperty Game
    Write-log "Function: Send-DiscordAlert"
    If ($alertmessage -and $alertmessagecolor) {
        # https://github.com/EvotecIT/PSDiscord
        $Uri = "$discordwebhook"
        If ($discorddisplayip) {
            $displayip = $discorddisplayip
            #$Fact = New-DiscordFact -Name "Server IP: " -Value "$discorddisplayip`:$port" -Inline $true
        }
        Else {
            $displayip = $extip
            
        }
        $details =  [PSCustomObject]@{
            Game = $game
            ServerIP = "$displayip`:$port"
            LocalBuild = $localbuild
            RemoteBuild = $remotebuild
        }        
        $detailss = @()
        $detailss += "Game:  $($details.Game)"
        $detailss += "`nServer IP: $($details.ServerIP)"
        If ($alert -eq "Backup") {
        $detailss += "`nbackups: $backups"
        }
        If ($alert -eq "update") {
        $detailss += "`nLocal: $($details.LocalBuild)"
        $detailss += "`nSteamDB: $($details.RemoteBuild)"
        }
        $detailss += "`nsteam://connect/$displayip`:$port"
        #                               Discord Author Name 
        $script:AuthorName              = "Notice - $hostname - $alerttype "
        #                               Discord Avatar Name 
        $script:AavatarName              = "Steam-Server-Manager"
        $Fact = New-DiscordFact -Name "Info:" -Value "$detailss" -Inline $true
        $Author = New-DiscordAuthor -Name $AuthorName -IconUrl $AuthorIconURL
        $Thumbnail = New-DiscordThumbnail -Url $ThumbnailURL
        $Section = New-DiscordSection -Title "$hostname" -Description "$alertmessage" -Facts $Fact -Color $alertmessagecolor -Author $Author -Thumbnail $Thumbnail # -Image $Thumbnail
        # $script:Section = New-DiscordSection -Title 'Everybody panic!' -Description '' -Facts $Fact, $Fact, $Fact -Color DeepSkyBlue -Author $Author -Thumbnail $Thumbnail -Image $Thumbnail
        Send-DiscordMessage -WebHookUrl $Uri -Sections $Section -AvatarName $AavatarName -AvatarUrl $AvatarUrl
        If (!$?) {
            Get-warnmessage "AlertFailed"
        }
        Else {
            $script:InfoMessage = 
            Get-Infomessage "discord" 
        }    
    }
}