Function GetFileNamesbyExt(ByVal FolderPath As String, FileExt As String) As Variant
Dim Result As Variant
Dim i As Integer
Dim MyFile As Object
Dim MyFSO As Object
Dim MyFolder As Object
Dim MyFiles As Object
Set MyFSO = CreateObject("Scripting.FileSystemObject")
Set MyFolder = MyFSO.GetFolder(FolderPath)
Set MyFiles = MyFolder.Files
ReDim Result(1 To MyFiles.Count)
For Each MyFile In MyFiles
If InStr(1, MyFile.Name, FileExt) 
Result(i) = MyFile.Name
End If
Next MyFile
ReDim Preserve Result(1 To i - 1)
GetFileNamesbyExt = Result
End Function