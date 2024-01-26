#tag DesktopWindow
Begin DesktopContainer KanbanButton
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   45
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   True
   LockLeft        =   False
   LockRight       =   True
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   45
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  Me.cbtnState="down"
		  Me.Width= Me.Width-1
		  Me.Height= Me.Height-1
		  Me.Refresh(True)
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  Self.cbtnState="hover"
		  self.Refresh(true)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  Self.cbtnState="idle"
		  self.Refresh(true)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  
		  Me.cbtnState="idle"
		  Me.Width= Me.cbtnWidth
		  Me.Height= Me.cbtnHeight
		  Me.Refresh(True)
		  EditCardScreen.Show
		  EditCardScreen.createMode= True
		  EditCardScreen.btn_Delete.Enabled= False
		  EditCardScreen.btn_Delete.Visible= False
		  EditCardScreen.txa_Details.Text=""
		  EditCardScreen.txt_CardTitle.Text=""
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  cbtnWidth= Self.Width
		  cbtnHeight= Self.Height
		  cbtnText="+"
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  g.TextFont="Liberation Sans"
		  g.TextUnit=FontUnits.Point
		  g.TextSize=cbtnFontSize //default 24
		  g.PenSize=3
		  
		  Select Case(cbtnState)
		  Case("Idle")
		    // fill
		    g.ForeColor= RGB(135,200,135)
		    g.FillRoundRectangle(0,0,Self.width,Self.Height,20,20)
		    
		    // Border
		    g.ForeColor=RGB(40,40,40)
		    g.DrawRoundRect(0,0,Self.width,Self.Height,20,20)
		    
		    //text
		    g.ForeColor= RGB(0,0,0)
		    g.DrawText(cbtnText,(Self.Width/2)+30-(cbtnFontSize*1.58),(Self.Height/2)+(cbtnFontSize*0.33))
		  Case("hover")
		    // fill
		    g.ForeColor= RGB(155,220,155)
		    g.FillRoundRectangle(0,0,Self.width,Self.Height,20,20)
		    
		    // Border
		    g.ForeColor=RGB(40,40,40)
		    g.DrawRoundRect(0,0,Self.width,Self.Height,20,20)
		    
		    //text
		    g.ForeColor= RGB(0,0,0)
		    g.DrawText(cbtnText,(Self.Width/2)+30-(cbtnFontSize*1.58),(Self.Height/2)+(cbtnFontSize*0.33))
		  Case("down")
		    // fill
		    g.ForeColor= RGB(188,240,188)
		    g.FillRoundRectangle(0,0,Self.width,Self.Height,20,20)
		    
		    // Border
		    g.ForeColor=RGB(30,30,30)
		    g.DrawRoundRect(0,0,Self.width,Self.Height,20,20)
		    
		    //text
		    g.ForeColor= RGB(0,0,0)
		    g.DrawText(cbtnText,(Self.Width/2)+30-(cbtnFontSize*1.58),(Self.Height/2)+(cbtnFontSize*0.33))
		  End
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		cbtnFontSize As Integer = 24
	#tag EndProperty

	#tag Property, Flags = &h0
		cbtnHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		cbtnState As String = "idle"
	#tag EndProperty

	#tag Property, Flags = &h0
		cbtnText As String = "+"
	#tag EndProperty

	#tag Property, Flags = &h0
		cbtnWidth As Integer = 0
	#tag EndProperty


#tag EndWindowCode

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
		Name="Super"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
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
		InitialValue="False"
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
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
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
		InitialValue="True"
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
		Name="Composited"
		Visible=true
		Group="Window Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="cbtnFontSize"
		Visible=false
		Group="Behavior"
		InitialValue="24"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="cbtnHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="cbtnState"
		Visible=false
		Group="Behavior"
		InitialValue="idle"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="cbtnText"
		Visible=false
		Group="Behavior"
		InitialValue="+"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="cbtnWidth"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
