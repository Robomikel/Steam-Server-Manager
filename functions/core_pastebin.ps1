<#
.SYNOPSIS
    Authenticates to PasteBin.com, and uploads text data directly to the website
.DESCRIPTION
    Uses the PasteBin API to take content from a file and create a new paste from it, including expiration, format, visibility, and title.
.PARAMETER InputObject
    Content to paste to Pastebin
.PARAMETER Visibility
    Public, Private, or Unlisted visibility for the new paste
.PARAMETER Format
    The format of the paste for syntax highlighting
.PARAMETER ExpiresIn
    Never: N, 10 Minutes: 10M, 1 Hour: 1H, 1 Day: 1D, 1 Week: 1W, 2 Weeks: 2W, 1 Month: 1M
.PARAMETER PasteTitle
    Title text for the paste
.PARAMETER OpenInBrowser
    Open the paste URL in the default browser
.EXAMPLE
    Out-Pastebin  -InputObject $(Get-Content "somefile.txt") -PasteTitle "My Pastebin Note" -ExpiresIn 10M -Visibility Unlisted -OpenInBrowser
.NOTES
    Original code is located here: http://poshcode.org/4982
    Now requires Powershell 3.0+ (Invoke-WebRequest)
    Added authentication snipets from here: http://www.altitudeintegration.com/PowerShellPasteBinLog.aspx
    Fixed the OpenInBrowser switch to open with the default browser and clipboard option
    I think parts of this are outdated now with newer versions of Powershell, but I'll update those in time.
#>
 
 
# $PastebinDeveloperKey = ''
$PastebinPasteURI = 'https://pastebin.com/api/api_post.php'
$PastebinLoginUri = "https://pastebin.com/api/api_login.php"
# $PastebinUsername = ""
# $PastebinPassword = ""
 
$Authenticate = "api_dev_key=$PastebinDeveloperKey&api_user_name=$PastebinUsername&api_user_password=$PastebinPassword"
 
Function global:EncodeForPost ( [Hashtable]$KeyValues )
{
    @(  
        ForEach ( $KV in $KeyValues.GetEnumerator() )
        {
            "{0}={1}" -f @(
            $KV.Key, $KV.Value |
            #ForEach-Object { $_ -replace ' ', '+' } | # Pastebin's server doesn't correctly decode these, so don't bother.
            ForEach-Object { [System.Web.HttpUtility]::UrlEncode( $_, [System.Text.Encoding]::UTF8 ) }
            )
        }
    ) -join '&'
}
 
Function Out-Pastebin
{
    [CmdletBinding()]
   
    Param
    (
        [Parameter(Mandatory=$True, ValueFromPipeline=$True)]
        [AllowEmptyString()]
        [String[]]
        $InputObject,
       
        [ValidateSet('Public', 'Unlisted', 'Private')]
        [String]
        $Visibility = 'Unlisted',
       
        # Specifies paste language
        [String]
        $Format,
       
        [ValidateSet('N', '10M', '1H', '1D', '1W', '2W', '1M')]
        [String]
        $ExpiresIn = '1D',
 
        [Parameter(Mandatory=$True)]
        [String]
        $PasteTitle,
       
        [Switch]
        $OpenInBrowser,
       
        [Switch]
        $PassThru
    )
   
    Begin
    {
        Add-Type -AssemblyName System.Web
 
        $script:s = Invoke-RestMethod -Uri $PastebinLoginUri -Body $Authenticate -Method Post
       
        $Post = [System.Net.HttpWebRequest]::Create( $PastebinPasteURI )
        $Post.Method = "POST"
        $Post.ContentType = "application/x-www-form-urlencoded"
       
        [String[]]$InputText = @()
    }
   
    Process
    {
        ForEach ( $Line in $InputObject )
        {
            $InputText += $Line
        }
    }
   
    End
    {
        $Parameters = @{
            api_user_key   = $script:s;
            api_dev_key    = $PastebinDeveloperKey;
            api_option     = 'paste';
            api_paste_code  = $InputText -join "`r`n";
            api_paste_name = $PasteTitle;
           
            api_paste_private = Switch($Visibility) { Public { '0' }; Unlisted { '1' }; Private { '2' }; };
            api_paste_expire_date = $ExpiresIn.ToUpper();
        }
       
        If ( $Format ) { $Parameters[ 'api_paste_format' ] = $Format.ToLower() }
       
        $Content = EncodeForPost $Parameters
       
        $Post.ContentLength = [System.Text.Encoding]::ASCII.GetByteCount( $Content )
       
        $WriteStream = New-Object System.IO.StreamWriter ( $Post.GetRequestStream( ), [System.Text.Encoding]::ASCII )
        $WriteStream.Write( $Content )
        $WriteStream.Close( )
       
        # Send request, get response
        $Response = $Post.GetResponse( )
        $ReadEncoding = [System.Text.Encoding]::GetEncoding( $Response.CharacterSet )
        $ReadStream = New-Object System.IO.StreamReader ( $Response.GetResponseStream( ), $ReadEncoding )
       
        $Result = $ReadStream.ReadToEnd().TrimEnd( )
       
        $ReadStream.Close( )
        $Response.Close( )
       
        If ( $Result.StartsWith( "http" ) ) {
            If ( $OpenInBrowser ) {
                Try { Start-Process -FilePath $Result } Catch { }
            } Else {
                $Result | clip.exe
            }
           
            $Result | Write-Output
            Write-Log "Pastebin: $Result "
        } Else {
            Throw "Error when uploading to pastebin: {0} : {1}" -f $Result, $Response
        }
    }
}
 
#$list = Get-Content "C:\Temp\Telemarketing_RoboCall_Weekly_Data_Deltas-20160222.csv"
#Out-Pastebin -InputObject $list -PasteTitle "Deltas List" -ExpiresIn 10M -Visibility Unlisted -OpenInBrowser -OutVariable PastedURI
#Write-Host "Pasted URI: $PastedURI"
