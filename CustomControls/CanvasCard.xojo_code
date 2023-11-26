#tag Class
Protected Class CanvasCard
Inherits DesktopCanvas
	#tag CompatibilityFlags = ( TargetDesktop and ( Target32Bit or Target64Bit ) )
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  If(IsDarkMode) Then
		    g.ForeColor= RGB(75, 75, 75)
		  Else
		    g.ForeColor= RGB(0,0,0)
		  End
		  
		  // card fill
		  g.FillRoundRectangle(0,0,cardWidth-20,cardHeight,0,0)
		  
		  // card border
		  g.ForeColor=RGB(0,0,0)
		  g.PenSize=2
		  g.DrawRoundRect(0,0,cardWidth-20,cardHeight,0,0)
		  
		  g.PenSize=1.5
		  g.DrawLine(0,58,cardWidth,58)
		  
		  If(IsDarkMode) Then
		    g.ForeColor= RGB(255,255,255)
		  Else
		    g.ForeColor= RGB(0,0,0)
		  End
		  
		  // title text
		  g.TextFont="Liberation Sans"
		  g.TextUnit=FontUnits.Point
		  g.TextSize= 16
		  g.DrawText(CardTitleHandler(cardName),(cardTypeText.Length),22)
		  
		  // type text
		  g.TextSize= 14
		  if(cardTypeText="Activity") then
		    g.DrawText(cardTypeText,cardWidth-(cardTypeText.Length*8)-8,cardHeight-8)
		  else
		    g.DrawText(cardTypeText,cardWidth-(cardTypeText.Length*8)-20,cardHeight-8)
		  end
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		cardColor As Color = &c383838
	#tag EndProperty

	#tag Property, Flags = &h0
		cardHeight As Integer = 82
	#tag EndProperty

	#tag Property, Flags = &h0
		cardName As string = "Card Name"
	#tag EndProperty

	#tag Property, Flags = &h0
		cardTypeText As String = "Feature"
	#tag EndProperty

	#tag Property, Flags = &h0
		cardWidth As Integer = 176
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
			InitialValue=""
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
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="cardHeight"
			Visible=false
			Group="Behavior"
			InitialValue="82"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="cardWidth"
			Visible=false
			Group="Behavior"
			InitialValue="176"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="cardColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c282D38"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="cardName"
			Visible=false
			Group="Behavior"
			InitialValue="Card Name"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cardTypeText"
			Visible=false
			Group="Behavior"
			InitialValue="Feature"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
