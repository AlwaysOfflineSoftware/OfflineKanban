#tag DesktopWindow
Begin DesktopContainer KanbanCardv2
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   82
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   176
   Begin CanvasCard card
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      cardColor       =   &c282D3800
      cardHeight      =   82
      cardName        =   "Card Name"
      cardTypeText    =   "Feature"
      cardWidth       =   176
      Enabled         =   True
      Height          =   82
      Index           =   -2147483648
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   156
   End
   Begin CanvasHandle handle
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      handleColor     =   &c00FF0000
      Height          =   82
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   21
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Property, Flags = &h0
		cardDescription As String
	#tag EndProperty

	#tag Property, Flags = &h0
		cardID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		cardName As string = "Card Name"
	#tag EndProperty

	#tag Property, Flags = &h0
		cardPosY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		cardPriority As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		cardStatus As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		cardType As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events card
	#tag Event
		Sub DoublePressed(x As Integer, y As Integer)
		  EditCardScreen.Show
		  EditCardScreen.createMode= False
		  EditCardScreen.cardID= Self.cardID
		  EditCardScreen.txt_CardTitle.Text=Self.cardName
		  EditCardScreen.txa_Details.Text=Self.cardDescription
		  EditCardScreen.pop_Priority.SelectedRowIndex=Self.cardPriority
		  EditCardScreen.pop_Status.SelectedRowIndex=Self.cardStatus
		  EditCardScreen.pop_Type.SelectedRowIndex=Self.cardType
		  EditCardScreen.btn_Delete.Enabled= True
		  EditCardScreen.btn_Delete.Visible= True
		  EditCardScreen.SetFocus()
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  If(IsContextualClick) Then
		    EditCardScreen.Show
		    EditCardScreen.createMode= False
		    EditCardScreen.cardID= Self.cardID
		    EditCardScreen.txt_CardTitle.Text=Self.cardName
		    EditCardScreen.txa_Details.Text=Self.cardDescription
		    EditCardScreen.pop_Priority.SelectedRowIndex=Self.cardPriority
		    EditCardScreen.pop_Status.SelectedRowIndex=Self.cardStatus
		    EditCardScreen.pop_Type.SelectedRowIndex=Self.cardType
		    EditCardScreen.btn_Delete.Enabled= True
		    EditCardScreen.btn_Delete.Visible= True
		    EditCardScreen.SetFocus()
		  End
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events handle
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  Self.cardPosY= Self.Top
		  Var sep1 As Integer= MainScreen.CanvasLine1.Left
		  Var sep2 As Integer= MainScreen.CanvasLine2.Left
		  Var cardX As Integer= Self.Left
		  Var cardWidth As Integer= Self.width
		  
		  ////// Column 1 //////
		  If(cardX< 5) Then
		    Self.Left= 6
		    Self.cardStatus= 0
		    RepositionCards(Self,40)
		    GoTo skipped
		  ElseIf(cardX>sep1-Self.width And cardX<sep1-5) Then
		    Self.Left= sep1-Self.width-2
		    Self.cardStatus= 0
		    RepositionCards(Self,40)
		    GoTo skipped
		    ////// Column 2 //////
		  ElseIf((cardX>=sep1-5 And cardX<=sep1+10)) Then
		    Self.Left= sep1+10
		    Self.cardStatus= 1
		    RepositionCards(Self,40)
		    GoTo skipped
		  ElseIf((cardX>sep2-Self.width And cardX<sep2)) Then
		    Self.Left=sep2-Self.width-2
		    Self.cardStatus= 1
		    RepositionCards(Self,40)
		    GoTo skipped
		    ////// Column 3 //////
		  ElseIf(cardX>=sep2-5 And cardX<=sep2+10) Then
		    Self.Left=sep2+10
		    Self.cardStatus= 2
		    RepositionCards(Self,40)
		    GoTo skipped
		  ElseIf(cardX>=MainScreen.width-cardWidth) Then
		    Self.Left=MainScreen.width-Self.width-20
		    Self.cardStatus= 2
		    RepositionCards(Self,40)
		    GoTo skipped
		  Else
		    ////// DeadZones //////
		    If(cardX>0 And cardX<sep1) Then
		      Self.cardStatus= 0
		      GoTo skipped
		    ElseIf(cardX>sep1 And cardX<sep2) Then
		      Self.cardStatus= 1
		      GoTo skipped
		    ElseIf(cardX>sep2 And cardX<MainScreen.width) Then
		      Self.cardStatus= 2
		      GoTo skipped
		    End
		  End
		  
		  skipped: //Used to break from the if logic
		  If(Self.top<45) Then
		    Self.Top= 55
		  ElseIf((Self.top+Self.Height)>MainScreen.Height And MainScreen.scr_mainViewBar.Value>=90) Then
		    Self.Top= MainScreen.Height-Self.Height+2
		  End
		  
		  updateCardRecord("id",self.cardID.ToString,"status",Self.cardStatus.ToString)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseDrag(x As Integer, y As Integer)
		  Self.Left=  MouseX-9
		  Self.Top=  MouseY-8
		  Var delta As Integer= 0
		  
		  If(Self.top+Self.Height>=MainScreen.Height And MainScreen.scr_mainViewBar.Value<100) Then
		    MainScreen.scr_mainViewBar.Value=MainScreen.scr_mainViewBar.Value+3
		    
		    If(MainScreen.scr_mainViewBar.Value > MainScreen.scrollbarLastValue) Then
		      delta= 20
		      MainScreen.scrollbarLastValue= MainScreen.scr_mainViewBar.Value
		      
		      For Each card As KanbanCardv2 In cardPopulation
		        If(Self.cardID<>card.cardID) Then
		          card.Top= card.Top - delta
		        End
		      Next
		    End
		    
		  ElseIf(Self.top<=30 And MainScreen.scr_mainViewBar.Value>0) Then
		    MainScreen.scr_mainViewBar.Value=MainScreen.scr_mainViewBar.Value-3
		    
		    If(MainScreen.scr_mainViewBar.Value < MainScreen.scrollbarLastValue) Then
		      delta= 20
		      MainScreen.scrollbarLastValue= MainScreen.scr_mainViewBar.Value
		      
		      For Each card As KanbanCardv2 In cardPopulation
		        If(Self.cardID<>card.cardID) Then
		          card.Top= card.Top + delta
		        End
		      Next
		    End
		  Else
		    RepositionCards(Self,5)
		  End
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
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
		Name="cardType"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="cardStatus"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="cardPriority"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="cardPosY"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
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
		Name="cardDescription"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="cardID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
