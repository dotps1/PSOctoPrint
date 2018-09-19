function Invoke-OctoPrintApi {

    [CmdletBinding(
        ConfirmImpact = "Low"
    )]
    [OutputType()]

    param (
        [Parameter(
            Mandatory = $false
        )]
        [HashTable] 
        $Headers = @{},
        
        [Parameter(
            Mandatory = $true
        )]
        [String] 
        $Path,

        [Parameter()]
        [String] 
        $Method = 'Get'
    )

    $hostName = Get-OctoPrintHostName -UserName 'PSOctoPrint'
    $apiKey = Get-OctoPrintApiKey -UserName 'PSOctoPrint' -Resource  $hostName

    $Headers.Add(
        'X-Api-Key', $apiKey
    )
    $Headers.Add(
        'Content-Type', 'application/json'
    )

    $request = @{
        Headers = $Headers
        Uri = 'http://{0}/api/{1}' -f $hostName, $Path
        Method = $Method
        ErrorAction = 'Stop'
    }
    
    try {
        Invoke-RestMethod @request
    } catch {
        $PSCmdlet.ThrowTerminatingError(
            $_
        )
    }
}
