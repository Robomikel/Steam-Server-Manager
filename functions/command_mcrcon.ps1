Function Set-ConnectMCRcon {
    If ($global:Useprivate -eq "0") {
        set-location $global:currentdir\mcrcon\mcrcon-0.7.1-windows-x86-32
        .\mcrcon.exe -t -H $global:EXTIP -P $global:RCONPORT -p $global:RCONPASSWORD
        set-location $global:currentdir
    }
    Else {
        set-location $global:currentdir\mcrcon\mcrcon-0.7.1-windows-x86-32
        .\mcrcon.exe -t -H $global:IP -P $global:RCONPORT -p $global:RCONPASSWORD
        set-location $global:currentdir
    }
}