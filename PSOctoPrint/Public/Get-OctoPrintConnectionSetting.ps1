using Module ..\PSOctoPrint.Types.psm1

function Get-OctoPrintConnectionSetting {

    [CmdletBinding()]
    [OutputType()]

    param ()

    [ConnectionSetting]::new((
        Invoke-OctoPrintApi -Path 'connection'
    ))

}
