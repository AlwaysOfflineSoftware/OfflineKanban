#tag Module
Protected Module ProjectSQLHandler
	#tag Method, Flags = &h0
		Sub CreateProjectRecord(projID as integer, projName as string, projDesc as String)
		  Var builtQuery As String= "INSERT INTO USER_PROJECTS VALUES ('" + projId.ToString + "','" + projName + "','" + projDesc + "')"
		  
		  SQLHandler.runStatement(builtQuery)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteProjectRecord(ProjName as String)
		  Var deleteProjectQuery As String= "DELETE FROM USER_PROJECTS WHERE project='" + ProjName + "'"
		  Var deleteCardsQuery As String= "DELETE FROM USER_CARDS WHERE project='" + ProjName + "'"
		  
		  SQLHandler.runStatement(deleteProjectQuery)
		  SQLHandler.runStatement(deleteCardsQuery)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getProjectDescription(projName as string) As String
		  Var selectQuery As String= "SELECT description FROM USER_PROJECTS WHERE project= '" + ProjName + "'"
		  
		  Return SQLHandler.runQuery(selectQuery).Column("description").StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InitProjects() As Rowset
		  Var builtQuery As String= "SELECT * FROM USER_PROJECTS"
		  
		  Return SQLHandler.runQuery(builtQuery)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateProjectRecord(name as string, column as string, newValue as string)
		  Var updateProjectQuery As String= "UPDATE USER_PROJECTS SET " + column + "= '" + newValue + "' Where project= '" + name +"'"
		  
		  SQLHandler.runStatement(updateProjectQuery)
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
