#tag Module
Protected Module SettingsHandler
	#tag Method, Flags = &h0
		Sub CheckSettings()
		  Var settingsContent As String= ReadFile(App.settingsFile.NativePath)
		  Var settings() As String= settingsContent.Split(EndOfLine)
		  Var line() As String
		  Var item As String
		  Var value As String
		  
		  For i As Integer= settings.FirstIndex To settings.LastIndex-1
		    if (settings(i)<>"") then
		      line= settings(i).Split("=")
		      item= line(0)
		      
		      If(item="Settings") Then
		        Continue
		      Else
		        value= line(1)
		      End
		      
		      If(item="dbFile") Then
		        System.DebugLog(App.settingsFile.URLPath.Replace("file://",""))
		        App.dbfile= New FolderItem(value)
		      End
		    end
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateFolderStructure(root as folderitem, path as string) As FolderItem
		  Var splitDirString() As String
		  
		  // remove any leading/trailing slashes
		  If(Right(path,1)="/") Then 
		    path=Left(path,Len(path)-1) // cannot have / on the end
		  End
		  
		  If(Left(path,1)="/") Then 
		    path=Mid(path,2)
		  End 
		  
		  // split on remaining /
		  splitDirString= Split(path,"/")
		  Var i As Integer
		  For i= 0 To splitDirString.ubound
		    root= root.child(splitDirString(i))
		    If(Not root.exists) Then 
		      root.CreateAsFolder()
		    End
		  Next i
		  
		  Return root
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InitSettingsFile() As folderItem
		  Var file As New FolderItem(App.ResourcesFolder.Child("settings.txt"))
		  Var dbLoc As New FolderItem(App.dataFolder.Child("Kanban.sqlite"))
		  
		  If(file<>Nil) Then
		    Var output As TextOutputStream
		    output = TextOutputStream.Create(file)
		    output.WriteLine("Settings=>")
		    output.WriteLine("dbFile=" + dbLoc.URLPath.Replace("file://",""))
		    output.WriteLine("lang=" + "english")
		    output.Close
		    Return file
		  Else
		    Return file
		  End If
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSettings(option as string, value as string)
		  Var settingsContent As String= ReadFile(App.settingsFile.NativePath)
		  Var newSettingsContent As String
		  Var settings() As String= settingsContent.Split(EndOfLine)
		  Var line() As String
		  Var item As String
		  Var current As String
		  
		  For i As Integer= settings.FirstIndex To settings.LastIndex-1
		    if (settings(i)<>"") then
		      line= settings(i).Split("=")
		      item= line(0)
		      
		      If(item="Settings") Then
		        newSettingsContent= "Settings=>" + EndOfLine
		        Continue
		      End
		      
		      If(item=option) Then
		        newSettingsContent= newSettingsContent + item + "=" + value + EndOfLine
		      Else
		        newSettingsContent= newSettingsContent + item + "=" + current + EndOfLine
		      End
		    end
		  Next i
		  
		  WriteFile(App.settingsFile,newSettingsContent,True)
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
