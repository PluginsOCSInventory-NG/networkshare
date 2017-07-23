'----------------------------------------------------------
' Script : Retrieve network shares
' Version : 2.0
' Date : 23/07/2017
' Author : Stéphane PAUTREL
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
        "<SIZE>" & round(objItem.Size/1099511627776,2) & "</SIZE>" & VbCrLf &_
        "<FREESPACE>" & round(objItem.FreeSpace/1099511627776,2) & "</FREESPACE>" & VbCrLf &_
        "<QUOTA>" & objItem.SupportsDiskQuotas & "</QUOTA>" & VbCrLf &_
        "</NETWORKSHARE>"
Next
