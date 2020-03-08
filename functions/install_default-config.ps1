Function Get-defaultconfig {
    If ($Appid) {
        $defaultcfg = Import-Csv $currentdir\data\serverlist.csv | where-object appid -like $appid | Select-Object -ExpandProperty Default-config
        Add-Content $ssmlog "[$loggingdate]  $defaultcfg"
        If ($defaultcfg) {
            Install-defaultconfig
            Write-Information "<--# Downloaded \config-default\$defaultcfg. Edit before continue #-->" -InformationAction Continue
            Pause
        }
    }
}

Function Install-defaultconfig {
    Add-Content $ssmlog "[$loggingdate] Retrieve default config "
    $cfgWebResponse = Invoke-WebRequest "$defaultconfigurl/$defaultcfg" -UseBasicParsing
    If (!$? -or !$cfgWebResponse) { 
        Add-Content $ssmlog "[$loggingdate]  Did NOT Retrieve default config"
        Add-Content $ssmlog "[$loggingdate]  $defaultconfigurl/$defaultcfg"
        Exit 
    }
    ElseIf ($?) { 
        Add-Content $ssmlog "[$loggingdate] Retrieved default config " 
    }
    New-Item $defaultconfigdirectory\$defaultcfg -Force >$null 2>&1
    If (!$?) { 
        Add-Content $ssmlog "[$loggingdate]   $defaultconfigdirectory\$defaultcfg"
        Exit 
    }
    Add-Content  $defaultconfigdirectory\$defaultcfg $cfgWebResponse >$null 2>&1
    If (!$?) { 
        Add-Content $ssmlog "[$loggingdate]Failed: Add-Content default config "
        Exit 
    }
    Start-Sleep .3
    If (Test-Path $defaultconfigdirectory\$defaultcfg ) {
        . { 
            Invoke-Expression $defaultconfigdirectory\$defaultcfg
            Add-Content $ssmlog "[$loggingdate] dotsource $defaultconfigdirectory\$defaultcfg "
        } 
    }Else{
        Add-Content $ssmlog "[$loggingdate]Failed: Dot source Install-defaultconfig "
        Exit 
    }
    # Get-ChildItem -Path $currentdir\config-default -Filter *.ps1 | ForEach-Object { . $_.FullName }
    # https://raw.githubusercontent.com/Robomikel/config-default/master/Miscreated_default.ps1
}