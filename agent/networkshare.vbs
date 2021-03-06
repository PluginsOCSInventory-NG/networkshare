'----------------------------------------------------------
' Plugin for OCS Inventory NG 2.x
' Script :		Retrieve network mapped drives
' Version :		2.00
' Date :		23/07/2017
' Author :		Stéphane PAUTREL (acb78.com)
'----------------------------------------------------------
' OS checked [X] on	32b	64b	(Professionnal edition)
'	Windows XP	[X]
'	Windows Vista	[N]	[N]
'	Windows 7	[N]	[X]
'	Windows 8.1	[N]	[X]
'	Windows 10	[N]	[X]
'	Windows 2k8R2		[X]
'	Windows 2k12R2		[N]
'	Windows 2k16		[N]
' ---------------------------------------------------------
' NOTE : No checked on Windows 8
' ---------------------------------------------------------
On Error Resume Next

strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

Set colItems = objWMIService.ExecQuery("Select * from Win32_MappedLogicalDisk")

For Each objItem in colItems
	If objItem.SupportsDiskQuotas = "Vrai" Then
		strQuota = "Actif"
	Else
		strQuota = "Inactif"
	End If
	Wscript.Echo _
	"<NETWORKSHARE>" & VbCrLf &_
	"<DRIVE>" & objItem.Name & "</DRIVE>" & VbCrLf &_
	"<PATH>" & objItem.ProviderName & "</PATH>" & VbCrLf &_
	"<SIZE>" & round(objItem.Size/1099511627776,2) & "</SIZE>" & VbCrLf &_ 
	"<FREESPACE>" & round(objItem.FreeSpace/1099511627776,2) & "</FREESPACE>" & VbCrLf &_ 
	"<QUOTA>" & strQuota & "</QUOTA>" & VbCrLf &_ 
	"</NETWORKSHARE>"
Next
