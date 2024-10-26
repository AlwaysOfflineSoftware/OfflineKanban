#tag DesktopWindow
Begin DesktopWindow ProjectSelectScreen
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   3
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   498
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   490
   MaximumWidth    =   400
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   490
   MinimumWidth    =   400
   Resizeable      =   False
   Title           =   "Project Selector"
   Type            =   1
   Visible         =   True
   Width           =   400
   Begin DesktopListBox lst_ProjectList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   True
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   267
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Project List"
      Top             =   152
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   360
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopTextField txt_ProjName
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   27
      Hint            =   "Project Name"
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   1
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   35
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   360
   End
   Begin DesktopButton btn_CreateProj
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Create"
      Default         =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   27
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Creates a new project with the indicated name"
      Top             =   113
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopButton btn_DeleteProj
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Delete"
      Default         =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   200
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Delete the selected project, note that Default cannot be deleted."
      Top             =   422
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   175
   End
   Begin DesktopButton btn_LoadProj
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Load"
      Default         =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   26
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Loads the selected project"
      Top             =   422
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   175
   End
   Begin DesktopTextField txt_CurrentProjDisplay
      AllowAutoDeactivate=   True
      AllowFocusRing  =   False
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   False
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   False
      Height          =   27
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   165
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Default"
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   "The default project for basic kanban use"
      Top             =   460
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   215
   End
   Begin DesktopLabel lbl_CurrentProj
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   25
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Current Project:"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   "Currently loaded project"
      Top             =   462
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   140
   End
   Begin DesktopTextField txt_ProjDesc
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   27
      Hint            =   "Project Description"
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   74
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   360
   End
   Begin DesktopButton btn_UpdateProj
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Update"
      Default         =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   27
      Index           =   -2147483648
      Italic          =   False
      Left            =   108
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Creates a new project with the indicated name"
      Top             =   113
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopLabel lbl_CreateProj
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "Liberation Sans"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Create Or Update A Project:"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   3
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   358
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  Var projectSet As rowset= InitProjects()
		  Var rec_id As Integer
		  Var rec_project As String
		  Var rec_name As String
		  
		  If(projectSet.RowCount>0) Then
		    For Each row As DatabaseRow In projectSet
		      rec_id= row.Column("id").Value
		      rec_project= row.Column("project").Value
		      rec_name= row.Column("description").Value
		      
		      lst_ProjectList.AddRow(rec_project)
		      // System.DebugLog("Loaded Project:" + rec_project)
		    Next
		  End
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events btn_CreateProj
	#tag Event
		Sub Pressed()
		  Var createName As String = txt_ProjName.Text
		  Var createDesc As String = txt_ProjDesc.Text
		  
		  If(createName<>"" And createName.Lowercase<>"default") Then
		    lst_ProjectList.AddRow(createName)
		    CreateProjectRecord(GenerateUniqueID,createName,createDesc)
		    // System.DebugLog("Created Project:" + createName)
		    txt_ProjName.Text=""
		    txt_ProjDesc.Text=""
		  Else
		    Utils.PopupHandler(2,"Name Error","You cannot name a project default or have a blank name")
		  End
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_DeleteProj
	#tag Event
		Sub Pressed()
		  If(lst_ProjectList.SelectedRowValue.Lowercase<>"default") Then
		    If(App.loadedProject<>lst_ProjectList.SelectedRowValue) Then
		      DeleteProjectRecord(lst_ProjectList.SelectedRowValue)
		      lst_ProjectList.RemoveRowAt(lst_ProjectList.SelectedRowIndex)
		    Else
		      Utils.PopupHandler(2,"Blocked Action",_
		      "Error: You cannot delete the currently loaded project. Please load another project then delete.")
		    End
		  Else
		    Utils.PopupHandler(2,"Blocked Action","You cannot delete the Default project")
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_LoadProj
	#tag Event
		Sub Pressed()
		  Var selectedProject As String= lst_ProjectList.SelectedRowValue
		  
		  App.loadedProject= selectedProject
		  MainScreen.Title="Offline Kanban (" + selectedProject + ")"
		  txt_CurrentProjDisplay.Text= selectedProject
		  txt_CurrentProjDisplay.Tooltip= getProjectDescription(selectedProject)
		  ClearAllCards()
		  InitCardsFromDB(App.loadedProject)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btn_UpdateProj
	#tag Event
		Sub Pressed()
		  
		  If(lst_ProjectList.SelectedRowValue.Lowercase<>"default") Then
		    If(txt_ProjName.Text<>"") Then
		      If(App.loadedProject=lst_ProjectList.SelectedRowValue) Then
		        App.loadedProject= txt_ProjName.Text
		      End
		      UpdateProjectRecord(lst_ProjectList.SelectedRowValue,"project",txt_ProjName.Text)
		      updateCardRecord("project",lst_ProjectList.SelectedRowValue,"project",txt_ProjName.Text)
		      lst_ProjectList.SelectedRowValue= txt_ProjName.Text
		    End
		    
		    If(txt_ProjDesc.Text<>"") Then
		      UpdateProjectRecord(lst_ProjectList.SelectedRowValue,"description",txt_ProjDesc.Text)
		      If(App.loadedProject=txt_ProjName.Text) Then
		        txt_CurrentProjDisplay.Tooltip= getProjectDescription(lst_ProjectList.SelectedRowValue)
		      End
		    End
		    
		    txt_ProjName.Text=""
		    txt_ProjDesc.Text=""
		    
		  Else
		    Utils.PopupHandler(2,"Blocked Action","You cannot rename the Default project")
		  End
		  
		End Sub
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
#tag EndViewBehavior
