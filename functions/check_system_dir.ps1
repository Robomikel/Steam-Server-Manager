Function Get-FolderNames {
    Write-Host "****   Checking Folder Names   ****" -F Y -B Black
    If (Test-Path "$global:currentdir\$global:server\") {
    }
    Else {
        New-ServerFolderq
    }
}
Function New-ServerFolderq {
    $title = 'Server Folder Name does not exist!'
    $question = 'Would you like to to create new Server Folder Name?'
    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    If ($decision -eq 0) {
        Write-Host 'Entered Y'
        $global:command = "install"
        Select-Steamer $global:command $global:server
    }
    Else {
        Write-Host 'Entered N'
        Exit
    }
}