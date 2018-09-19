function Set-OctoPrintApiKey {
    
    [CmdletBinding(
        ConfirmImpact = 'High',
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [Void]
    )]

    param (
        [Parameter()]
        [String]
        $HostName = 'octopi',

        [Parameter(
            HelpMessage = 'The API Key can be found in the OctoPrint Settings page.',
            Mandatory = $true
        )]
        [String]
        $ApiKey
    )

    begin {
        [Void][Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
        
        $vault = New-Object -TypeName Windows.Security.Credentials.PasswordVault -ErrorAction Stop

        try {
            $entry = New-Object -TypeName Windows.Security.Credentials.PasswordCredential -ArgumentList "$HostName", 'PSOctoPrint', $ApiKey
            $entries = $vault.FindAllByUserName( 
                'PSOctoPrint' 
            )
            if ($entries.Count -ne 0) {
                if ($PSCmdlet.ShouldProcess( $vault, 'Setting PSOctoPrint Api Token.  There is already an Api Token present, do you wish to update the value?' )) {
                    $vault.Add(
                        $entry
                    )
                }
            }
        } catch {
            try {
                $vault.Add( 
                    $entry 
                )
            } catch {
                $PSCmdlet.ThrowTerminatingError(
                    $_
                )
            }
        }
    }

    end {
        Remove-Variable -Name ApiKey -Force
        
        [GC]::Collect()
    }
}
