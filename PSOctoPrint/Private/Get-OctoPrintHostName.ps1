function Get-OctoPrintHostName {

    param (
        [Parameter(
            Mandatory = $true
        )]
        [String]
        $UserName
    )

    [Void][Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
    $vault = New-Object -TypeName Windows.Security.Credentials.PasswordVault

    try {
        $entry = $vault.FindAllByUserName(
            $UserName
        )

        return $entry.Resource
    } catch {
        Set-OctoPrintApiKey
    }
}
