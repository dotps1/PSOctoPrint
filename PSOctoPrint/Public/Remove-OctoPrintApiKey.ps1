function Remove-OctoPrintApiKey {

    [CmdletBinding(
        ConfirmImpact = 'High',
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [Void]
    )]

    param(
        [Parameter()]
        [String]
        $HostName = 'octopi'
    )

    begin {
        [Void][Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
        
        $vault = New-Object -TypeName Windows.Security.Credentials.PasswordVault -ErrorAction Stop

        try {
            $entry = $vault.Retrieve(
                $HostName, 'PSOctoPrint'
            )
        } catch {
            $PSCmdlet.ThrowTerminatingError(
                $_
            )
        }

        if ($PSCmdlet.ShouldProcess( $entry )) {
            $vault.Remove(
                $entry
            )
        }
    }
}
