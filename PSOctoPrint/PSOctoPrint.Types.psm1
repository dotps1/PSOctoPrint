class OctoPrintServer {
    [Version]$Api
    [Version]$Server

    OctoPrintServer([Object]$response) {
        $this.Api = $response.api
        $this.Server = $response.server
    }
}

class ConnectionSetting {
    [Option]$Option

    ConnectionSetting([Object]$response) {
        $this.Option = $response.options
    }
}

class Option {
    [String[]]$Port
    [Int[]]$Baudrate
    [PrinterProfile[]]$PrinterProfile
    [String]$PortPreference
    [Int]$BaudratePreference
    [String]$PrinterProfilePreference
    [Bool]$Autoconnect

    Option([Object]$response) {
        $this.Port = $response.ports
        $this.Baudrate = $response.baudrates
        $this.PrinterProfile = $response.printerProfiles
        $this.PortPreference = $response.portPreference
        $this.BaudratePreference = $response.baudratePrefernce
        $this.PrinterProfilePreference = $response.printerProfilePreference
        $this.Autoconnect = $response.autoconnect
    }
}

class PrinterProfile {
    [String]$Name
    [String]$Id

    PrinterProfile([Object]$response) {
        $this.Name = $response.name
        $this.Id = $response.id
    }
}
