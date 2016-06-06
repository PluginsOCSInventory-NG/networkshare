'Author: Valentin DEVILLE


Set WshNetwork = WScript.CreateObject("WScript.Network")
Set oDrives = WshNetwork.EnumNetworkDrives


For i = 0 to oDrives.Count - 1 Step 2   
    Wscript.Echo "<NETWORKSHARE>"
        Wscript.Echo "<DRIVE>" & oDrives.Item(i) & "</DRIVE>"
        Wscript.Echo "<PATH>" & oDrives.Item(i+1) & "</PATH>"
    Wscript.Echo "</NETWORKSHARE>"
Next
