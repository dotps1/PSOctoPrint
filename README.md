# PSOctoPrint
### PowerShell Module to interface with the OctoPrint API.

To get started, you will need to get the [API KEY](http://docs.octoprint.org/en/master/api/general.html) from the `Settings` > `API` dialog in OctoPrint and use the `Set-OctoPrintApiKey` to add the authenticaion info to the Windows Credential Manager:

```PowerShell
Set-OctoPrintApiKey -HostName octopi -ApiKey FF6C89F7E64742D497858C9C311F3A8F
```

After that is done, you can start using the other cmdlets:

```PowerShell
Get-OctoPrintApiVersion

Api Server
--- ------
0.1 1.3.9
```

This is still very much a work in progress, so there isn't very many cmdlets yet, but there will be more to come.
