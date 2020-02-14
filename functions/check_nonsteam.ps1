Function Get-CheckNonSteam {
    If (($global:APPID -eq 11421000 ) -or ($global:APPID -eq 11500000 )){
        If ($global:command -eq "install" ) {
            Read-AppID
            New-CreateVariables
            Get-Finished
            Exit
        }ElseIf($global:command -eq "Update" ){
            If ($global:APPID -eq 11500000 ){
                Get-MCversion
                Exit
            }Else{
            Get-MCbrversion
            Exit
            }
        }ElseIf($global:command -eq "ForceUpdate" ){
            Write-Host "ForceUpdate not available for this server" -F Y
            Write-Host "Try Install Command to download and overwrite files" -F Y
            Pause
            Exit
        }ElseIf($global:command -eq "validate" ){
            Write-Host "validate not available for this server" -F Y
            Write-Host "Try Install Command to download and overwrite files" -F Y
            Pause
            Exit
        }
    }
}