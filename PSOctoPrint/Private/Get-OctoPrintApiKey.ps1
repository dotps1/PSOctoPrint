function Get-OctoPrintApiKey {

    param (
        [Parameter(
            Mandatory = $true
        )]
        [String]
        $UserName,

        [Parameter(
            Mandatory = $true
        )]
        [String]
        $Resource
    )

    [Void][Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
    $vault = New-Object -TypeName Windows.Security.Credentials.PasswordVault

    try {
        $entry = $vault.Retrieve(
            $Resource, $UserName
        )

        return $entry.Password
    } catch {
        Set-OctoPrintApiKey
    }
}
