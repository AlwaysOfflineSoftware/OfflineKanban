#tag Module
Protected Module WindowHandler
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
