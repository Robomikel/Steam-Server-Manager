Function New-DiscordAlert {
    If ($global:DisableDiscordBackup -eq "1") {    
        If ( "" -eq $global:WEBHOOK) {
            Write-Host "$global:DIAMOND $global:DIAMOND Missing WEBHOOK ! $global:DIAMOND $global:DIAMOND"-F R -B Black
            Write-Host "****   Add Discord  WEBHOOK to $global:currentdir\$global:server\Variables-$global:server.ps1   ****" -F Y -B Black    
        }
        Else {
            If ($global:command -eq "Backup") {
                # BACKUP
                $global:ALERT = ' Server Backed UP'
                # GREEN
                $global:ALERTCOLOR = '3334680'
            }
            ElseIf ($global:command -eq "update") {
                # UDPATE
                $global:ALERT = ' Server Updated '
                # BLUE
                $global:ALERTCOLOR = '385734'
            }
            Else {
                # RESTART
                $global:ALERT = " Server not Running, Starting Server "
                # R
                $global:ALERTCOLOR = '16711680'
            }
            Write-Host '****   Sending Discord Alert   ****' -F M -B Black
            $webHookUrl = "$global:WEBHOOK"
            [System.Collections.ArrayList]$embedArray = @()
            $title = "$global:HOSTNAME"
            $description = "$global:ALERT"
            $color = "$global:ALERTCOLOR"
            $embedObject = [PSCustomObject]@{
                title       = $title       
                description = $description  
                color       = $color
            }                              
            $embedArray.Add($embedObject) | Out-Null
            $payload = [PSCustomObject]@{
                embeds = $embedArray
            }                              
            Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
        }
    }
}