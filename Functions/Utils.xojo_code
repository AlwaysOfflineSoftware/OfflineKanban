#tag Module
Protected Module Utils
	#tag Method, Flags = &h0
		Sub BannerRefresh(posX as integer, posY as integer)
		  Var newBanner As KanbanBanner= New KanbanBanner // create clone of the control on the layout
		  
		  If(currentBanner<>Nil) Then
		    currentBanner.close
		  End
		  
		  newBanner.EmbedWithin(MainScreen,posX,posY,(MainScreen.Width-20),50)
		  
		  currentBanner=newBanner
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ButtonRefresh(posX as integer, posY as integer)
		  Var newAddBtn As KanbanButton= New KanbanButton // create clone of the control on the layout
		  
		  If(currentAddButton<>Nil) Then
		    currentAddButton.close
		  End
		  
		  newAddBtn.EmbedWithin(MainScreen,posX,posY)
		  currentAddButton=newAddBtn
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ErrorHandler(typeCode as integer, message as String, explain as String)
		  Var diag As New MessageDialog                  // declare the MessageDialog object
		  Var clickItem As MessageDialogButton                // for handling the result
		  
		  Select Case typeCode
		  Case 1
		    diag.IconType = MessageDialog.IconTypes.None
		  Case 2
		    diag.IconType = MessageDialog.IconTypes.Caution
		  Case 3
		    diag.IconType = MessageDialog.IconTypes.Stop
		  Else
		    diag.IconType = MessageDialog.IconTypes.Question
		  End Select
		  
		  diag.ActionButton.Visible=false
		  diag.CancelButton.Visible = True
		  diag.Message = message
		  diag.Explanation = explain
		  
		  clickItem = diag.ShowModal
		  Select Case clickItem
		  Case diag.CancelButton
		    clickItem.Cancel= true
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadBinData(readFile As FolderItem) As memoryBlock
		  If(readFile <> Nil And readFile.Exists) Then
		    Var Binstream As BinaryStream= BinaryStream.Open(readFile, False)
		    Var memblock As MemoryBlock= Binstream.Read(Binstream.Length)
		    Binstream.Close
		    Return memblock
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadFile(filePath as string) As String
		  Var f As FolderItem= New FolderItem(filePath)
		  Var t As TextInputStream
		  Var contents As String
		  
		  If f <> Nil Then
		    t = TextInputStream.Open(f)
		    t.Encoding = Encodings.UTF8 //specify encoding of input stream
		    contents = t.ReadAll
		    t.Close
		    Return contents
		  End If
		  
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteBinData(filename as string, data as memoryBlock)
		  Var WriteFile As FolderItem = SpecialFolder.Documents.Child("OfflineKanban").child(filename)
		  Var Binstream As BinaryStream = BinaryStream.Create(writeFile, True)
		  
		  Binstream.Write(data)
		  Binstream.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteFile(folder as folderitem, data as string, overwrite as boolean)
		  Var fullFilePath As FolderItem= folder
		  Var output As TextOutputStream
		  
		  Try
		    If(overwrite) Then // Write or Overwrite
		      output= TextOutputStream.Create(fullFilePath)
		      output.Encoding = Encodings.SystemDefault
		      output.WriteLine(data)
		      output.Close
		    Else // Write New
		      If(fullFilePath= Nil) Then
		        output= TextOutputStream.Create(fullFilePath)
		        output.Encoding = Encodings.SystemDefault
		        output.WriteLine(data)
		        output.Close
		      Else // Append
		        output= TextOutputStream.Open(fullFilePath)
		        output.Encoding = Encodings.SystemDefault
		        output.Write(data)
		        output.Close
		      End If
		    End
		  Catch e As IOException
		    ErrorHandler(2,"IO Issue writing file '", "There was an issue writting a file to: '" + folder.URLPath + "'")
		  End Try
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		currentAddButton As KanbanButton
	#tag EndProperty

	#tag Property, Flags = &h0
		currentBanner As KanbanBanner
	#tag EndProperty


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
