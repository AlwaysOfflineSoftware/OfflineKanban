#tag Module
Protected Module CardSQLHandler
	#tag Method, Flags = &h0
		Sub createRecord(id as Integer, project as string, name as string, details as string, priority as integer, status as integer, type as integer, posY as integer)
		  Var builtQuery As String= "INSERT INTO USER_CARDS VALUES (" + id.ToString + ",'"_
		  + project + "','" + name + "','" + details + "'," + priority.ToString + ","_
		  + status.ToString + "," + type.ToString + "," + posY.toString + ")"
		  
		  runStatement(builtQuery)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteRecord(id as integer)
		  Var builtQuery As String= "DELETE FROM USER_CARDS WHERE id=" + id.ToString
		  
		  runStatement(builtQuery)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub hardUpdateRecord(id as Integer, project as string, name as string, details as string, priority as integer, status as integer, type as integer, posY as integer)
		  Var deleteQuery As String= "DELETE FROM USER_CARDS WHERE id=" + id.ToString
		  Var insertQuery As String= "INSERT INTO USER_CARDS VALUES (" + id.ToString + ",'" + project _
		  + "','" + name + "','" + details + "'," + priority.ToString + "," + status.ToString + ","_
		  + type.ToString + "," + posY.toString + ")"
		  
		  runStatement(deleteQuery)
		  runStatement(insertQuery)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function refreshRecords(projectName as String) As RowSet
		  Var selectAllQuery As String= "SELECT * FROM USER_CARDS WHERE project='" + projectName + "'"
		  Var results As RowSet
		  
		  results= runQuery(selectAllQuery)
		  
		  Return results
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateCardRecord(identityColumn as string, identityValue as string, editColumn as string, editValue as string)
		  Var updateQuery As String= "UPDATE USER_CARDS SET " + EditColumn + " = " + editValue + " WHERE " + identityColumn + " = " + identityValue
		  // Var pathToDB As FolderItem= app.ExecutableFile.Parent.Parent.Child("Kanban.sqlite")
		  
		  runStatement(updateQuery)
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
