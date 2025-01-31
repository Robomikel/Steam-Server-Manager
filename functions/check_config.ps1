#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W"
#
#
Function Get-CheckForVars {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($ssmlog -and $loggingdate) {
        Write-log "info: Checking Server Variables"
        If ($command) {
            If ($command -eq "mcrcon") {
                $missingvars = $port, $rconpassword, ${extip}, ${ip}
            }
            ElseIf ($command -eq "query") {
                $missingvars = $querytype, ${extip}, ${port}, ${ip}
            }
            Else {
                $missingvars = $appid, $process, $anon, $launchParams
            }
            Foreach ($missingvars in $missingvars) {
                If ( !$missingvars) {
                    
                    Get-warnmessage "missingvars"
                }
            }   
        }
    }
    Else {
        Get-warnmessage "chkvarsfailed"
    }
}
Function Get-IniContent {
    <#
    .Synopsis
        Gets the content of an INI file

    .Description
        Gets the content of an INI file and returns it as a hashtable

    .Notes
        Author		: Oliver Lipkau <oliver@lipkau.net>
		Source		: https://github.com/lipkau/PsIni
                      http://gallery.technet.microsoft.com/scriptcenter/ea40c1ef-c856-434b-b8fb-ebd7a76e8d91
        Version		: 1.0.0 - 2010/03/12 - OL - Initial release
                      1.0.1 - 2014/12/11 - OL - Typo (Thx SLDR)
                                              Typo (Thx Dave Stiff)
                      1.0.2 - 2015/06/06 - OL - Improvment to switch (Thx Tallandtree)
                      1.0.3 - 2015/06/18 - OL - Migrate to semantic versioning (GitHub issue#4)
                      1.0.4 - 2015/06/18 - OL - Remove check for .ini extension (GitHub Issue#6)
                      1.1.0 - 2015/07/14 - CB - Improve round-tripping and be a bit more liberal (GitHub Pull #7)
                                           OL - Small Improvments and cleanup
                      1.1.1 - 2015/07/14 - CB - changed .outputs section to be OrderedDictionary
                      1.1.2 - 2016/08/18 - SS - Add some more verbose outputs as the ini is parsed,
                      				            allow non-existent paths for new ini handling,
                      				            test for variable existence using local scope,
                      				            added additional debug output.

        #Requires -Version 2.0

    .Inputs
        System.String

    .Outputs
        System.Collections.Specialized.OrderedDictionary

    .Example
        $FileContent = Get-IniContent "C:\myinifile.ini"
        -----------
        Description
        Saves the content of the c:\myinifile.ini in a hashtable called $FileContent

    .Example
        $inifilepath | $FileContent = Get-IniContent
        -----------
        Description
        Gets the content of the ini file passed through the pipe into a hashtable called $FileContent

    .Example
        C:\PS>$FileContent = Get-IniContent "c:\settings.ini"
        C:\PS>$FileContent["Section"]["Key"]
        -----------
        Description
        Returns the key "Key" of the section "Section" from the C:\settings.ini file

    .Link
        Out-IniFile
    #>

    [CmdletBinding()]
    [OutputType(
        [System.Collections.Specialized.OrderedDictionary]
    )]
    Param(
        # Specifies the path to the input file.
        [ValidateNotNullOrEmpty()]
        [Parameter( Mandatory = $true, ValueFromPipeline = $true )]
        [String]
        $FilePath,

        # Specify what characters should be describe a comment.
        # Lines starting with the characters provided will be rendered as comments.
        # Default: ";"
        [Char[]]
        $CommentChar = @(";"),

        # Remove lines determined to be comments from the resulting dictionary.
        [Switch]
        $IgnoreComments
    )

    Begin {
        Write-Debug "PsBoundParameters:"
        $PSBoundParameters.GetEnumerator() | ForEach-Object { Write-Debug $_ }
        if ($PSBoundParameters['Debug']) {
            $DebugPreference = 'Continue'
        }
        Write-Debug "DebugPreference: $DebugPreference"

        Write-Verbose "$($MyInvocation.MyCommand.Name):: Function started"

        $commentRegex = "^\s*([$($CommentChar -join '')].*)$"
        $sectionRegex = "^\s*\[(.+)\]\s*$"
        $keyRegex = "^\s*(.+?)\s*=\s*(['`"]?)(.*)\2\s*$"

        Write-Debug ("commentRegex is {0}." -f $commentRegex)
    }

    Process {
        Write-Verbose "$($MyInvocation.MyCommand.Name):: Processing file: $Filepath"

        $ini = New-Object System.Collections.Specialized.OrderedDictionary([System.StringComparer]::OrdinalIgnoreCase)
        #$ini = @{}

        if (!(Test-Path $Filepath)) {
            Write-Verbose ("Warning: `"{0}`" was not found." -f $Filepath)
            Write-Output $ini
        }

        $commentCount = 0
        switch -regex -file $FilePath {
            $sectionRegex {
                # Section
                $section = $matches[1]
                Write-Verbose "$($MyInvocation.MyCommand.Name):: Adding section : $section"
                $ini[$section] = New-Object System.Collections.Specialized.OrderedDictionary([System.StringComparer]::OrdinalIgnoreCase)
                $CommentCount = 0
                continue
            }
            $commentRegex {
                # Comment
                if (!$IgnoreComments) {
                    if (!(test-path "variable:local:section")) {
                        $section = $script:NoSection
                        $ini[$section] = New-Object System.Collections.Specialized.OrderedDictionary([System.StringComparer]::OrdinalIgnoreCase)
                    }
                    $value = $matches[1]
                    $CommentCount++
                    Write-Debug ("Incremented CommentCount is now {0}." -f $CommentCount)
                    $name = "Comment" + $CommentCount
                    Write-Verbose "$($MyInvocation.MyCommand.Name):: Adding $name with value: $value"
                    $ini[$section][$name] = $value
                }
                else {
                    Write-Debug ("Ignoring comment {0}." -f $matches[1])
                }

                continue
            }
            $keyRegex {
                # Key
                if (!(test-path "variable:local:section")) {
                    $section = $script:NoSection
                    $ini[$section] = New-Object System.Collections.Specialized.OrderedDictionary([System.StringComparer]::OrdinalIgnoreCase)
                }
                $name, $value = $matches[1, 3]
                Write-Verbose "$($MyInvocation.MyCommand.Name):: Adding key $name with value: $value"
                if (-not $ini[$section][$name]) {
                    $ini[$section][$name] = $value
                }
                else {
                    if ($ini[$section][$name] -is [string]) {
                        $ini[$section][$name] = [System.Collections.ArrayList]::new()
                        $ini[$section][$name].Add($ini[$section][$name]) | Out-Null
                        $ini[$section][$name].Add($value) | Out-Null
                    }
                    else {
                        $ini[$section][$name].Add($value) | Out-Null
                    }
                }
                continue
            }
        }
        Write-Verbose "$($MyInvocation.MyCommand.Name):: Finished Processing file: $FilePath"
        Write-Output $ini
    }

    End {
        Write-Verbose "$($MyInvocation.MyCommand.Name):: Function ended"
    }
}
# Set-Alias gic Get-IniContent
Function Out-IniFile {
    <#
    .Synopsis
        Write hash content to INI file

    .Description
        Write hash content to INI file

    .Notes
        Author      : Oliver Lipkau <oliver@lipkau.net>
        Blog        : http://oliver.lipkau.net/blog/
        Source      : https://github.com/lipkau/PsIni
                      http://gallery.technet.microsoft.com/scriptcenter/ea40c1ef-c856-434b-b8fb-ebd7a76e8d91

        #Requires -Version 2.0

    .Inputs
        System.String
        System.Collections.IDictionary

    .Outputs
        System.IO.FileSystemInfo

    .Example
        Out-IniFile $IniVar "C:\myinifile.ini"
        -----------
        Description
        Saves the content of the $IniVar Hashtable to the INI File c:\myinifile.ini

    .Example
        $IniVar | Out-IniFile "C:\myinifile.ini" -Force
        -----------
        Description
        Saves the content of the $IniVar Hashtable to the INI File c:\myinifile.ini and overwrites the file if it is already present

    .Example
        $file = Out-IniFile $IniVar "C:\myinifile.ini" -PassThru
        -----------
        Description
        Saves the content of the $IniVar Hashtable to the INI File c:\myinifile.ini and saves the file into $file

    .Example
        $Category1 = @{“Key1”=”Value1”;”Key2”=”Value2”}
        $Category2 = @{“Key1”=”Value1”;”Key2”=”Value2”}
        $NewINIContent = @{“Category1”=$Category1;”Category2”=$Category2}
        Out-IniFile -InputObject $NewINIContent -FilePath "C:\MyNewFile.ini"
        -----------
        Description
        Creating a custom Hashtable and saving it to C:\MyNewFile.ini
    .Link
        Get-IniContent
    #>

    [CmdletBinding()]
    [OutputType(
        [System.IO.FileSystemInfo]
    )]
    Param(
        # Adds the output to the end of an existing file, instead of replacing the file contents.
        [switch]
        $Append,

        # Specifies the file encoding. The default is UTF8.
        #
        # Valid values are:
        # -- ASCII:  Uses the encoding for the ASCII (7-bit) character set.
        # -- BigEndianUnicode:  Encodes in UTF-16 format using the big-endian byte order.
        # -- Byte:   Encodes a set of characters into a sequence of bytes.
        # -- String:  Uses the encoding type for a string.
        # -- Unicode:  Encodes in UTF-16 format using the little-endian byte order.
        # -- UTF7:   Encodes in UTF-7 format.
        # -- UTF8:  Encodes in UTF-8 format.
        [ValidateSet("Unicode", "UTF7", "UTF8", "ASCII", "BigEndianUnicode", "Byte", "String")]
        [Parameter()]
        [String]
        $Encoding = "UTF8",

        # Specifies the path to the output file.
        [ValidateNotNullOrEmpty()]
        [ValidateScript( { Test-Path $_ -IsValid } )]
        [Parameter( Position = 0, Mandatory = $true )]
        [String]
        $FilePath,

        # Allows the cmdlet to overwrite an existing read-only file. Even using the Force parameter, the cmdlet cannot override security restrictions.
        [Switch]
        $Force,

        # Specifies the Hashtable to be written to the file. Enter a variable that contains the objects or type a command or expression that gets the objects.
        [Parameter( Mandatory = $true, ValueFromPipeline = $true )]
        [System.Collections.IDictionary]
        $InputObject,

        # Passes an object representing the location to the pipeline. By default, this cmdlet does not generate any output.
        [Switch]
        $Passthru,

        # Adds spaces around the equal sign when writing the key = value
        [Switch]
        $Loose,

        # Writes the file as "pretty" as possible
        #
        # Adds an extra linebreak between Sections
        [Switch]
        $Pretty
    )

    Begin {
        Write-Debug "PsBoundParameters:"
        $PSBoundParameters.GetEnumerator() | ForEach-Object { Write-Debug $_ }
        if ($PSBoundParameters['Debug']) {
            $DebugPreference = 'Continue'
        }
        Write-Debug "DebugPreference: $DebugPreference"

        Write-Verbose "$($MyInvocation.MyCommand.Name):: Function started"

        function Out-Keys {
            param(
                [ValidateNotNullOrEmpty()]
                [Parameter( Mandatory, ValueFromPipeline )]
                [System.Collections.IDictionary]
                $InputObject,

                [ValidateSet("Unicode", "UTF7", "UTF8", "ASCII", "BigEndianUnicode", "Byte", "String")]
                [Parameter( Mandatory )]
                [string]
                $Encoding = "UTF8",

                [ValidateNotNullOrEmpty()]
                [ValidateScript( { Test-Path $_ -IsValid })]
                [Parameter( Mandatory, ValueFromPipelineByPropertyName )]
                [Alias("Path")]
                [string]
                $FilePath,

                [Parameter( Mandatory )]
                $Delimiter,

                [Parameter( Mandatory )]
                $MyInvocation
            )

            Process {
                if (!($InputObject.get_keys())) {
                    Write-Warning ("No data found in '{0}'." -f $FilePath)
                }
                Foreach ($key in $InputObject.get_keys()) {
                    if ($key -match "^Comment\d+") {
                        Write-Verbose "$($MyInvocation.MyCommand.Name):: Writing comment: $key"
                        "$($InputObject[$key])" | Out-File -Encoding $Encoding -FilePath $FilePath -Append
                    }
                    else {
                        Write-Verbose "$($MyInvocation.MyCommand.Name):: Writing key: $key"
                        $InputObject[$key] |
                        ForEach-Object { "$key$delimiter$_" } |
                        Out-File -Encoding $Encoding -FilePath $FilePath -Append
                    }
                }
            }
        }

        $delimiter = '='
        if ($Loose) {
            $delimiter = ' = '
        }

        # Splatting Parameters
        $parameters = @{
            Encoding = $Encoding;
            FilePath = $FilePath
        }

    }

    Process {
        $extraLF = ""

        if ($Append) {
            Write-Debug ("Appending to '{0}'." -f $FilePath)
            $outfile = Get-Item $FilePath
        }
        else {
            Write-Debug ("Creating new file '{0}'." -f $FilePath)
            $outFile = New-Item -ItemType file -Path $Filepath -Force:$Force
        }

        if (!(Test-Path $outFile.FullName)) { Throw "Could not create File" }

        Write-Verbose "$($MyInvocation.MyCommand.Name):: Writing to file: $Filepath"
        foreach ($i in $InputObject.get_keys()) {
            if (!($InputObject[$i].GetType().GetInterface('IDictionary'))) {
                #Key value pair
                Write-Verbose "$($MyInvocation.MyCommand.Name):: Writing key: $i"
                "$i$delimiter$($InputObject[$i])" | Out-File -Append @parameters

            }
            elseif ($i -eq $script:NoSection) {
                #Key value pair of NoSection
                Out-Keys $InputObject[$i] `
                    @parameters `
                    -Delimiter $delimiter `
                    -MyInvocation $MyInvocation
            }
            else {
                #Sections
                Write-Verbose "$($MyInvocation.MyCommand.Name):: Writing Section: [$i]"

                # Only write section, if it is not a dummy ($script:NoSection)
                if ($i -ne $script:NoSection) { "$extraLF[$i]"  | Out-File -Append @parameters }
                if ($Pretty) {
                    $extraLF = "`r`n"
                }

                if ( $InputObject[$i].Count) {
                    Out-Keys $InputObject[$i] `
                        @parameters `
                        -Delimiter $delimiter `
                        -MyInvocation $MyInvocation
                }

            }
        }
        Write-Verbose "$($MyInvocation.MyCommand.Name):: Finished Writing to file: $FilePath"
    }

    End {
        if ($PassThru) {
            Write-Debug ("Returning file due to PassThru argument.")
            Write-Output (Get-Item $outFile)
        }
        Write-Verbose "$($MyInvocation.MyCommand.Name):: Function ended"
    }
}

# Set-Alias oif Out-IniFile
Function Set-IniContent {
    <#
    .Synopsis
        Updates existing values or adds new key-value pairs to an INI file

    .Description
        Updates specified keys to new values in all sections or certain sections.
        Used to add new or change existing values. To comment, uncomment or remove keys use the related functions instead.
        The ini source can be specified by a file or piped in by the result of Get-IniContent.
        The modified content is returned as a ordered dictionary hashtable and can be piped to a file with Out-IniFile.

    .Notes
        Author		: Sean Seymour <seanjseymour@gmail.com> based on work by Oliver Lipkau <oliver@lipkau.net>
		Source		: https://github.com/lipkau/PsIni
                      http://gallery.technet.microsoft.com/scriptcenter/ea40c1ef-c856-434b-b8fb-ebd7a76e8d91
        Version		: 1.0.0 - 2016/08/18 - SS - Initial release
                    : 1.0.1 - 2016/12/29 - SS - Removed need for delimiters by making Sections a string array
                                                and NameValuePairs a hashtable. Thanks Oliver!

        #Requires -Version 2.0

    .Inputs
        System.String
        System.Collections.IDictionary

    .Outputs
        System.Collections.Specialized.OrderedDictionary

    .Example
        $ini = Set-IniContent -FilePath "C:\myinifile.ini" -Sections 'Printers' -NameValuePairs @{'Name With Space' = 'Value1' ; 'AnotherName' = 'Value2'}
        -----------
        Description
        Reads in the INI File c:\myinifile.ini, adds or updates the 'Name With Space' and 'AnotherName' keys in the [Printers] section to the values specified,
        and saves the modified ini to $ini.

    .Example
        Set-IniContent -FilePath "C:\myinifile.ini" -Sections 'Terminals','Monitors' -NameValuePairs @{'Updated=FY17Q2'} | Out-IniFile "C:\myinifile.ini" -Force
        -----------
        Description
        Reads in the INI File c:\myinifile.ini and adds or updates the 'Updated' key in the [Terminals] and [Monitors] sections to the value specified.
        The ini is then piped to Out-IniFile to write the INI File to c:\myinifile.ini. If the file is already present it will be overwritten.

    .Example
        Get-IniContent "C:\myinifile.ini" | Set-IniContent -NameValuePairs @{'Headers' = 'True' ; 'Update' = 'False'} | Out-IniFile "C:\myinifile.ini" -Force
        -----------
        Description
        Reads in the INI File c:\myinifile.ini using Get-IniContent, which is then piped to Set-IniContent to add or update the 'Headers'  and 'Update' keys in all sections
        to the specified values. The ini is then piped to Out-IniFile to write the INI File to c:\myinifile.ini. If the file is already present it will be overwritten.

    .Example
        Get-IniContent "C:\myinifile.ini" | Set-IniContent -NameValuePairs @{'Updated'='FY17Q2'} -Sections '_' | Out-IniFile "C:\myinifile.ini" -Force
        -----------
        Description
        Reads in the INI File c:\myinifile.ini using Get-IniContent, which is then piped to Set-IniContent to add or update the 'Updated' key that
        is orphaned, i.e. not specifically in a section. The ini is then piped to Out-IniFile to write the INI File to c:\myinifile.ini.

    .Link
        Get-IniContent
        Out-IniFile
    #>

    [CmdletBinding(DefaultParameterSetName = "File")]
    [OutputType(
        [System.Collections.IDictionary]
    )]
    Param
    (
        # Specifies the path to the input file.
        [Parameter( Position = 0, Mandatory = $true, ParameterSetName = "File" )]
        [ValidateNotNullOrEmpty()]
        [String]
        $FilePath,

        # Specifies the Hashtable to be modified.
        # Enter a variable that contains the objects or type a command or expression that gets the objects.
        [Parameter( Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = "Object")]
        [ValidateNotNullOrEmpty()]
        [System.Collections.IDictionary]
        $InputObject,

        # Hashtable of one or more key names and values to modify. Required.
        [Parameter( Mandatory = $true, ParameterSetName = "File")]
        [Parameter( Mandatory = $true, ParameterSetName = "Object")]
        [ValidateNotNullOrEmpty()]
        [HashTable]
        $NameValuePairs,

        # String array of one or more sections to limit the changes to, separated by a comma.
        # Surrounding section names with square brackets is not necessary but is supported.
        # Ini keys that do not have a defined section can be modified by specifying '_' (underscore) for the section.
        [Parameter( ParameterSetName = "File" )]
        [Parameter( ParameterSetName = "Object" )]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Sections
    )

    Begin {
        Write-Debug "PsBoundParameters:"
        $PSBoundParameters.GetEnumerator() | ForEach-Object { Write-Debug $_ }
        if ($PSBoundParameters['Debug']) {
            $DebugPreference = 'Continue'
        }
        Write-Debug "DebugPreference: $DebugPreference"
        Write-Verbose "$($MyInvocation.MyCommand.Name):: Function started"

        # Update or add the name/value pairs to the section.
        Function Update-IniEntry {
            param ($content, $section)

            foreach ($pair in $NameValuePairs.GetEnumerator()) {
                if (!($content[$section])) {
                    Write-Verbose ("$($MyInvocation.MyCommand.Name):: '{0}' section does not exist, creating it." -f $section)
                    $content[$section] = New-Object System.Collections.Specialized.OrderedDictionary([System.StringComparer]::OrdinalIgnoreCase)
                }

                Write-Verbose ("$($MyInvocation.MyCommand.Name):: Setting '{0}' key in section {1} to '{2}'." -f $pair.key, $section, $pair.value)
                $content[$section][$pair.key] = $pair.value
            }
        }
    }
    # Update the specified keys in the list, either in the specified section or in all sections.
    Process {
        # Get the ini from either a file or object passed in.
        if ($PSCmdlet.ParameterSetName -eq 'File') { $content = Get-IniContent $FilePath }
        if ($PSCmdlet.ParameterSetName -eq 'Object') { $content = $InputObject }

        # Specific section(s) were requested.
        if ($Sections) {
            foreach ($section in $Sections) {
                # Get rid of whitespace and section brackets.
                $section = $section.Trim() -replace '[][]', ''

                Write-Debug ("Processing '{0}' section." -f $section)

                Update-IniEntry $content $section
            }
        }
        else {
            # No section supplied, go through the entire ini since changes apply to all sections.
            foreach ($item in $content.GetEnumerator()) {
                $section = $item.key

                Write-Debug ("Processing '{0}' section." -f $section)

                Update-IniEntry $content $section
            }
        }
        Write-Output $content
    }
    End {
        Write-Verbose "$($MyInvocation.MyCommand.Name):: Function ended"
    }
}

# Set-Alias sic Set-IniContent

Function Edit-inifile {
    param($inifile)
    $ini = Get-IniContent $inifile
    if ($ini) {
        ForEach ($k in $ini.Keys) {
            #    $inifile.$k.Values
            # Write $k
            # pause
            ForEach ($v in $ini.$k) {
                # Write $v
                # pause
                Foreach ($va in $($ini.$k.Keys)) {
                    if ($va -match "servername") {
                        if ($hostname) {
                            #Write-Host "$va : $($v.$va)"
                            # Write-Log "Enter new Value"
                            # # $ini.$k.$va = Read-Host
                            Write-Log "Info: Updated $servercfg $va : $($v.$va)"
                            $ini.$k.$va = $hostname
                            $ini | out-inifile $inifile -force
                        }
                    }
                    if ($va -match "sessionname") {
                        if ($hostname) {
                            #Write-Host "$va : $($v.$va)"
                            # Write-Log "Enter new Value"
                            # # $ini.$k.$va = Read-Host
                            Write-Log "Info: Updated $servercfg $va : $($v.$va)"
                            $ini.$k.$va = $hostname
                            $ini | out-inifile $inifile -force
                        }
                    }
                    if ($va -match "serverpassword") {
                        if ($serverpassword) {
                            #Write-Host "$va : $($v.$va)"
                            # Write-Log "Enter new Value"
                            # $ini.$k.$va = Read-Host
                            Write-Log "Info: Updated $servercfg $va : $($v.$va)"
                            $ini.$k.$va = $serverpassword
                            $ini | out-inifile $inifile -force
                        }
                    }
                    if ($va -match "serverport") {
                        If ($port) {
                            #Write-Host "$va : $($v.$va)"
                            # Write-Log "Enter new Value"
                            # $ini.$k.$va = Read-Host
                            Write-Log "Info: Updated $servercfg $va : $($v.$va)"
                            $ini.$k.$va = $port
                            $ini | out-inifile $inifile -force
                        }
                    }
                    if ($va -match "queryport") {
                        If ($queryport) {
                            #Write-Host "$va : $($v.$va)"
                            # Write-Log "Enter new Value"
                            # $ini.$k.$va = Read-Host
                            Write-Log "Info: Updated $servercfg $va : $($v.$va)"
                            $ini.$k.$va = $queryport
                            $ini | out-inifile $inifile -force
                        }
                    }
                    if ($va -match "rconport") {
                        If ($rconport) {
                            #Write-Host "$va : $($v.$va)"
                            # Write-Log "Enter new Value"
                            # $ini.$k.$va = Read-Host
                            Write-Log "Info: Updated $servercfg $va : $($v.$va)"
                            $ini.$k.$va = $rconport
                            $ini | out-inifile $inifile -force
                        }
                    }
                    if ($va -match "rconpassword") {
                        If ($RCONPASSWORD) {
                            #Write-Host "$va : $($v.$va)"
                            # Write-Log "Enter new Value"
                            # $ini.$k.$va = Read-Host
                            Write-Log "Info: Updated $servercfg $va : $($v.$va)"
                            $ini.$k.$va = $RCONPASSWORD
                            $ini | out-inifile $inifile -force
                        }
                    }
                    if ($va -match "adminpassword") {
                        If ($adminpassword) {
                            #Write-Host "$va : $($v.$va)"
                            # Write-Log "Enter new Value"
                            # $ini.$k.$va = Read-Host
                            Write-Log "Info: Updated $servercfg $va : $($v.$va)"
                            $ini.$k.$va = $adminpassword
                            $ini | out-inifile $inifile -force
                        }
                    }
                }
            }
        }
    }
}

