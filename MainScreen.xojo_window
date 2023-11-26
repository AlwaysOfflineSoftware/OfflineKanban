#tag DesktopWindow
Begin DesktopWindow MainScreen
   Backdrop        =   0
   BackgroundColor =   &c3D3D3D00
   Composite       =   False
   DefaultLocation =   1
   FullScreen      =   False
   HasBackgroundColor=   True
   HasCloseButton  =   True
   HasFullScreenButton=   True
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   420
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   320000
   MaximumWidth    =   320000
   MenuBar         =   886792191
   MenuBarVisible  =   False
   MinimumHeight   =   420
   MinimumWidth    =   750
   Resizeable      =   True
   Title           =   "Offline Kanban (Default)"
   Type            =   0
   Visible         =   True
   Width           =   750
   Begin DesktopScrollbar scr_mainViewBar
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   False
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   420
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   733
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   100
      MinimumValue    =   0
      PageStep        =   20
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   17
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin CanvasLine CanvasLine1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   370
      Index           =   -2147483648
      Left            =   220
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   50
      Transparent     =   True
      Visible         =   True
      Width           =   5
   End
   Begin CanvasLine CanvasLine2
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   370
      Index           =   -2147483648
      Left            =   488
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   50
      Transparent     =   True
      Visible         =   True
      Width           =   5
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  EditCardScreen.Close
		  AboutScreen.Close
		  cardPopulation.RemoveAll
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(x As Integer, y As Integer, deltaX As Integer, deltaY As Integer) As Boolean
		  scr_mainViewBar.Value= scr_mainViewBar.Value + deltaY
		  Var delta As Integer= 0
		  
		  If(scr_mainViewBar.Value > scrollbarLastValue) Then
		    delta= -20
		  ElseIf(scr_mainViewBar.Value < scrollbarLastValue) Then
		    delta= 20
		  End
		  
		  scrollbarLastValue= scr_mainViewBar.Value
		  
		  For Each card As KanbanCardv2 In cardPopulation
		    card.Top= card.Top + delta
		  Next
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  InitCardsFromDB(App.loadedProject)
		  ButtonRefresh(MainScreen.width-110, mainscreen.Height-80)
		  BannerRefresh(0, 0)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  CanvasLine1.Left=MainScreen.Width*0.3333
		  CanvasLine2.Left=MainScreen.Width*0.6667
		  
		  DynamicScreenCard()
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function opt_about() As Boolean Handles opt_about.Action
		  AboutScreen.show
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function opt_Docs() As Boolean Handles opt_Docs.Action
		  HelpScreen.show
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function opt_KanbanSettings() As Boolean Handles opt_KanbanSettings.Action
		  SettingsScreen.Show
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function opt_License() As Boolean Handles opt_License.Action
		  LicenseScreen.show
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function opt_NewCard() As Boolean Handles opt_NewCard.Action
		  
		  EditCardScreen.Show
		  EditCardScreen.createMode= True
		  EditCardScreen.btn_Delete.Enabled= False
		  EditCardScreen.btn_Delete.Visible= False
		  EditCardScreen.txa_Details.Text=""
		  EditCardScreen.txt_CardTitle.Text=""
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function opt_OrgCards(index as Integer) As Boolean Handles opt_OrgCards.Action
		  OrganizeCards
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function opt_Projects() As Boolean Handles opt_Projects.Action
		  ProjectSelectScreen.show
		End Function
	#tag EndMenuHandler


	#tag Property, Flags = &h0
		scrollbarLastValue As Integer = 0
	#tag EndProperty


	#tag Constant, Name = cardSpacing, Type = Double, Dynamic = False, Default = \"30", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ColumnStartPosition, Type = Double, Dynamic = False, Default = \"90", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events scr_mainViewBar
	#tag Event
		Function MouseWheel(x As Integer, y As Integer, deltaX As Integer, deltaY As Integer) As Boolean
		  scr_mainViewBar.Value= scr_mainViewBar.Value + deltaY
		  Var delta As Integer= 0
		  
		  If(scr_mainViewBar.Value > scrollbarLastValue) Then
		    delta= -20
		  ElseIf(scr_mainViewBar.Value < scrollbarLastValue) Then
		    delta= 20
		  End
		  
		  scrollbarLastValue= scr_mainViewBar.Value
		  
		  For Each card As KanbanCardv2 In cardPopulation
		    card.Top= card.Top + delta
		  Next
		  
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  me.Value=me.Value
		  return true
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
		Name="Interfaces"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
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
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
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
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="scrollbarLastValue"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
