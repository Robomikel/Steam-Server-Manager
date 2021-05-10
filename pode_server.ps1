
 Start-PodeServer {
    $config = (gc config.json) | ConvertFrom-Json 
   
    Add-PodeEndpoint -Address localhost -Port $config.server.webport -Protocol Http

    $chunk = {
        param($config)
        SSM monitor $($config.server.serverfile) -Verbose -disableclearvariable
        start-sleep 3
        If ((Get-Process "$process" -ea SilentlyContinue)) {
            Write-PodeJsonResponse -Value @{ status = "started" } -StatusCode 302
        }Else{
            Write-PodeJsonResponse -Value @{ status = 'failed' } -StatusCode 303
        }
    }
    Add-PodeRoute -Method Get -Path "/monitor" -ScriptBlock  $chunk -ArgumentList $config
    
    $chunk2 = {
        param($config)
        SSM stop  $config.server.serverfile -Verbose -disableclearvariable
        start-sleep 3
        If (!($p = (Get-Process "$process" -ea SilentlyContinue))) {
            Write-PodeJsonResponse -Value @{ status = 'stopped' } -StatusCode 304
        }Else{
            Write-PodeJsonResponse -Value @{ status = 'failed' } -StatusCode 305
        }
    }
    Add-PodeRoute -Method Get -Path '/stop' -ScriptBlock $chunk2 -ArgumentList $config
    $chunk2 = {
        param($config)
        SSM query  $config.server.serverfile -Verbose -disableclearvariable
        start-sleep 3
        If ($status) {
            Write-PodeJsonResponse -Value @{  status = "$status" } -StatusCode 304
        }Else{
            Write-PodeJsonResponse -Value @{ status = 'failed' } -StatusCode 305
        }
    }
    Add-PodeRoute -Method Get -Path '/query' -ScriptBlock $chunk2 -ArgumentList $config
    $chunk2 = {
        param($config)
        SSM details  $config.server.serverfile -Verbose -disableclearvariable
        start-sleep 3
        If ($botdetails) {
            Write-PodeJsonResponse -Value @{  
                status = $botdetails
            } -StatusCode 304
        }Else{
            Write-PodeJsonResponse -Value @{ status = 'failed' } -StatusCode 305
        }
    }
    Add-PodeRoute -Method Get -Path '/details' -ScriptBlock $chunk2 -ArgumentList $config
}
#https://discordapp.com/oauth2/authorize?client_id=<bot id here>&scope=bot