using Module ..\PSOctoPrint.Types.psm1

function  Get-OctoPrintApiVersion {

    [CmdletBinding()]
    [OutputType(
        [OctoPrintServer]
    )]

    param ()
    
    [OctoPrintServer]::new((
        Invoke-OctoPrintApi -Path 'version'
    ))
}
