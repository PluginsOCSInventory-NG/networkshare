strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

Set colItems = objWMIService.ExecQuery("Select * from Win32_MappedLogicalDisk")

For Each objItem in colItems
        Wscript.Echo _
        "<NETWORKSHARE>" & VbCrLf &_
        "<DRIVE>" & objItem.Name & "</DRIVE>" & VbCrLf &_
        "<PATH>" & objItem.ProviderName & "</PATH>" & VbCrLf &_
        "</NETWORKSHARE>"
Next
