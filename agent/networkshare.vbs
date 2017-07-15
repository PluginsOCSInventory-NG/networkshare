'----------------------------------------------------------
' Date : Le 14/07/2017
' Auteur : PAUTREL Stéphane
' Retrieve network shares
' Version : 2.0
'----------------------------------------------------------
On Error Resume Next

strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

Set colItems = objWMIService.ExecQuery("Select * from Win32_MappedLogicalDisk")

For Each objItem in colItems
    Wscript.Echo _
        "<NETWORKSHARE>" & VbCrLf &_
        "<DRIVE>" & objItem.Name & "</DRIVE>" & VbCrLf &_
        "<PATH>" & objItem.ProviderName & "</PATH>" & VbCrLf &_
        "<SIZE>" & objItem.Size & "</SIZE>" & VbCrLf &_
        "<FREESPACE>" & objItem.FreeSpace & "</FREESPACE>" & VbCrLf &_
        "<QUOTAS>" & objItem.SupportsDiskQuotas & "</QUOTAS>" & VbCrLf &_
        "</NETWORKSHARE>"
Next
