#tag Module
Protected Module CardObjectHandler
	#tag Method, Flags = &h0
		Function AddNewCard(target as DesktopWindow, title as string, description as string, status as integer, priority as integer, type as integer, posY as integer) As integer
		  Var newCard As KanbanCardv2 // this is the control class
		  newCard = New KanbanCardv2 // create clone of the control on the layout
		  
		  newCard.cardStatus=status
		  newCard.cardName= title
		  newCard.cardDescription= description
		  newCard.cardPriority=priority
		  newCard.cardType=type
		  newCard.cardStatus=status
		  newCard.cardPosY=posY
		  
		  newCard.cardName= title
		  newCard.card.cardName= title
		  newCard.Tooltip= description
		  
		  If(status=0) Then
		    newCard.EmbedWithin(target, 35, 75)
		  ElseIf(status=1) Then
		    newCard.EmbedWithin(target, MainScreen.CanvasLine1.Left+40, 75)
		  Else
		    newCard.EmbedWithin(target, MainScreen.CanvasLine2.Left+40, 75)
		  End
		  
		  CardDesign(newCard)
		  
		  newCard.cardID= GenerateUniqueID()
		  cardPopulation.Add(newCard)
		  // System.DebugLog("Added: " + newCard.cardID.ToString)
		  
		  ButtonRefresh(MainScreen.width-110, mainscreen.Height-80)
		  BannerRefresh(0, 0)
		  
		  Var bcounter As Integer= 0
		  Var pcounter As Integer= 0
		  Var ccounter As Integer= 0
		  Var countUp As Integer= 85
		  
		  For Each card As KanbanCardv2 In cardPopulation
		    If(newCard.cardStatus=0 AND card.cardStatus=0) Then
		      card.Left=0+((MainScreen.CanvasLine1.Left-0-card.width)/2)
		      card.Top= 60 + bcounter
		      bcounter=bcounter+countUp
		    ElseIf(newCard.cardStatus=1 AND card.cardStatus=1) Then
		      card.Left=MainScreen.CanvasLine1.Left+((MainScreen.CanvasLine2.Left-MainScreen.CanvasLine1.Left-card.width)/2)
		      card.Top= 60 + pcounter
		      pcounter=pcounter+countUp
		    ElseIf(newCard.cardStatus=2 AND card.cardStatus=2) Then
		      card.Left=MainScreen.CanvasLine2.Left+((MainScreen.width-MainScreen.CanvasLine2.Left-card.width)/2)
		      card.Top= 60 + ccounter
		      ccounter=ccounter+countUp
		    End
		  Next
		  
		  Return newCard.cardID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddOldCard(target as DesktopWindow, id as integer, title as string, description as string, status as integer, priority as integer, type as integer, posY as integer)
		  Var oldCard As KanbanCardv2 // this is the control class
		  oldCard = New KanbanCardv2 // create clone of the control on the layout
		  
		  oldCard.cardStatus=status
		  oldCard.cardName= title
		  oldCard.cardDescription= description
		  oldCard.cardPriority=priority
		  oldCard.cardType=type
		  oldCard.cardStatus=status
		  oldCard.cardPosY=posY
		  
		  oldCard.cardName= title
		  oldCard.card.cardName= title
		  oldCard.Tooltip= description
		  
		  If(status=0) Then
		    oldCard.EmbedWithin(target, 35, 75)
		  ElseIf(status=1) Then
		    oldCard.EmbedWithin(target, MainScreen.CanvasLine1.Left+40, 75)
		  Else
		    oldCard.EmbedWithin(target, MainScreen.CanvasLine2.Left+40, 75)
		  End
		  
		  CardDesign(oldCard)
		  
		  oldCard.cardID= id
		  cardPopulation.Add(oldCard)
		  // System.DebugLog(newCard.cardID.ToString)
		  
		  ButtonRefresh(MainScreen.width-110, mainscreen.Height-80)
		  BannerRefresh(0, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AdjustCardsToScreen()
		  // Used to dynamically space cards
		  Var bcounter As Integer= 0
		  Var pcounter As Integer= 0
		  Var ccounter As Integer= 0
		  Var countUp As Integer= 85
		  Var sep1 As Integer= MainScreen.CanvasLine1.Left
		  Var sep2 As Integer= MainScreen.CanvasLine2.Left
		  Var cardWidth As Integer
		  
		  For Each card As KanbanCardv2 In cardPopulation
		    cardWidth= card.width
		    If(card.cardStatus=0) Then
		      card.Left=0+((sep1-0-cardWidth)/2)
		      card.Top= 60 + bcounter
		      bcounter=bcounter+countUp
		      
		    ElseIf(card.cardStatus=1) Then
		      card.Left=sep1+((sep2-sep1-cardWidth)/2)
		      card.Top= 60 + pcounter
		      pcounter=pcounter+countUp
		      
		    ElseIf(card.cardStatus=2) Then
		      card.Left=sep2+((MainScreen.width-sep2-cardWidth)/2)
		      card.Top= 60 + ccounter
		      ccounter=ccounter+countUp
		    End
		    
		    If(card.top<20) Then
		      card.Top= 60
		    End
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CardDesign(inCard as kanbancardv2)
		  If(inCard.cardType=0) Then
		    inCard.card.cardTypeText= "Feature"
		  ElseIf(inCard.cardType=1) Then
		    inCard.card.cardTypeText= "Design"
		  ElseIf(inCard.cardType=2) Then
		    inCard.card.cardTypeText= "Documentation"
		  ElseIf(inCard.cardType=3) Then
		    inCard.card.cardTypeText= "Issue"
		  ElseIf(inCard.cardType=4) Then
		    inCard.card.cardTypeText= "Research"
		  ElseIf(inCard.cardType=5) Then
		    inCard.card.cardTypeText= "Activity"
		  Else //Catch-all
		    inCard.card.cardTypeText= "ERROR"
		  End
		  
		  If(inCard.cardPriority=0) Then //Low
		    inCard.handle.handleColor= Color.RGB(0,255,0,0)
		  ElseIf(inCard.cardPriority=1) Then //Medium
		    inCard.handle.handleColor= Color.RGB(255,255,0,0)
		  ElseIf(inCard.cardPriority=2) Then //High
		    inCard.handle.handleColor= Color.RGB(255,0,0,0)
		  ElseIf(inCard.cardPriority=3) Then //Wishlist
		    inCard.handle.handleColor= Color.RGB(255,255,255,0)
		  Else //Catch-all
		    inCard.handle.handleColor= Color.RGB(0,0,0,0)
		  End
		  
		  If(IsDarkMode=False) Then
		    inCard.card.cardColor= Color.RGB(229,233,238,0)
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CardWriteTitle(titleStr as String) As String
		  Var maxChars As Integer= 14
		  var charCount as integer= 0
		  var maxLines as Boolean= False
		  
		  Var lastSpaceLoc as Integer= 0
		  Var preSpaceString as String
		  Var postSpaceString as String
		  
		  Var formattedString as String
		  Var titleArray() as string= titleStr.Split("")
		  
		  For i as integer = 0 to titleArray.LastIndex
		    If(titleArray(i)= " ") Then
		      LastSpaceLoc= i
		      preSpaceString= formattedString
		      postSpaceString= ""
		    end
		    
		    if(charCount<maxChars) Then
		      formattedString = formattedString + titleArray(i)
		      if(lastSpaceLoc>0) then
		        postSpaceString= postSpaceString + titleArray(i)
		      end
		    else
		      formattedString = preSpaceString + EndOfLine + postSpaceString + titleArray(i)
		      charCount= postSpaceString.Length
		      maxLines=True
		    End
		    charCount= charCount+1
		    
		    If(maxLines And charCount=14) Then
		      formattedString= formattedString + "..."
		      return formattedString
		    end
		  next i
		  
		  return formattedString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearAllCards()
		  For Each card As KanbanCardv2 In cardPopulation
		    card.Close
		  Next
		  cardPopulation.RemoveAll
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitCardsFromDB(projectName as string)
		  Var loadedRecs As RowSet= refreshRecords(projectName)
		  Var rec_id As Integer
		  Var rec_project As String
		  Var rec_name As String
		  Var rec_details As String
		  Var rec_priority As Integer
		  Var rec_status As Integer
		  Var rec_type As Integer
		  Var bcounter As Integer= 0
		  Var pcounter As Integer= 0
		  Var ccounter As Integer= 0
		  Var countUp As Integer= 85
		  
		  loadedRecs.MoveToFirstRow
		  If(loadedRecs.RowCount>0) Then
		    For Each row As DatabaseRow In loadedRecs
		      rec_id= row.Column("id").Value
		      rec_project= row.Column("project").Value
		      rec_name= row.Column("name").Value
		      rec_details= row.Column("details").Value
		      rec_priority= row.Column("priority").Value
		      rec_status= row.Column("status").Value
		      rec_type= row.Column("type").Value
		      
		      AddOldCard(MainScreen,rec_id,rec_name,rec_details,rec_status,rec_priority,rec_type,75)
		      For Each card As KanbanCardv2 In cardPopulation
		        If(card.cardID= rec_id) Then
		          // System.DebugLog(card.cardID.ToString + ": " + card.cardStatus.ToString)
		          If(card.cardStatus=0) Then
		            card.Top= 60 + bcounter
		            bcounter=bcounter+countUp
		          ElseIf(card.cardStatus=1) Then
		            card.Top= 60 + pcounter
		            pcounter=pcounter+countUp
		          ElseIf(card.cardStatus=2) Then
		            card.Top= 60 + ccounter
		            ccounter=ccounter+countUp
		          End
		          Exit
		        End
		      Next
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveCard(cid as integer, posX as integer, posY as integer)
		  For Each card As KanbanCardv2 In cardPopulation
		    If(card.cardID=cid) Then
		      card.Left=posX
		      card.Top=PosY
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OrganizeCards()
		  Var bcounter As Integer= 0
		  Var pcounter As Integer= 0
		  Var ccounter As Integer= 0
		  Var countUp As Integer= 85
		  
		  For Each card As KanbanCardv2 In cardPopulation
		    If(card.cardStatus=0) Then
		      card.Left=0+((MainScreen.CanvasLine1.Left-0-card.width)/2)
		      card.Top= 60 + bcounter
		      bcounter=bcounter+countUp
		    ElseIf(card.cardStatus=1) Then
		      card.Left=MainScreen.CanvasLine1.Left+((MainScreen.CanvasLine2.Left-MainScreen.CanvasLine1.Left-card.width)/2)
		      card.Top= 60 + pcounter
		      pcounter=pcounter+countUp
		    ElseIf(card.cardStatus=2) Then
		      card.Left=MainScreen.CanvasLine2.Left+((MainScreen.width-MainScreen.CanvasLine2.Left-card.width)/2)
		      card.Top= 60 + ccounter
		      ccounter=ccounter+countUp
		    End
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveCard(cid as Integer)
		  // Var pathToDB As FolderItem= app.ExecutableFile.Parent.Parent.Child("Kanban.sqlite")
		  
		  For i As Integer = 0 To cardPopulation.Count()
		    If(cardPopulation(i).cardID= cid) Then
		      // System.DebugLog("Closed:" + cid.ToString)
		      cardPopulation(i).Close
		      cardPopulation.RemoveAt(i)
		      Exit
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RepositionCards(movingCard as kanbancardv2, increment as integer)
		  // Allows cards to push each other out of the way
		  For Each card As KanbanCardv2 In cardPopulation
		    If(movingCard.cardID<>card.cardID) Then 
		      If(movingCard.Left+movingCard.Width>=card.Left And movingCard.Left<=card.Left+card.width) Then
		        If(movingCard.Top<card.Top And (movingCard.Top+movingCard.Height)>card.Top) Then
		          // System.DebugLog("push down")
		          card.top= card.top+increment
		        ElseIf((movingCard.Top+movingCard.Height)>card.Top+card.Height And movingCard.Top<card.Top+card.Height) Then
		          // System.DebugLog("push up")
		          card.top= card.top-increment
		        End
		      End
		      If(card.Top<40 And MainScreen.scr_mainViewBar.Value<=10) Then
		        card.Top= 40
		      ElseIf((card.top+card.Height)>MainScreen.Height And MainScreen.scr_mainViewBar.Value>=90) Then
		        card.Top= MainScreen.Height-card.Height+2
		      End
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCard(id as integer, title as string, description as string, status as integer, priority as integer, type as integer, posY as integer)
		  For Each card As KanbanCardv2 In cardPopulation
		    If(id=card.cardID) Then 
		      card.cardName= title
		      card.cardDescription= description
		      card.cardStatus= status
		      card.cardType= type
		      card.cardPriority= priority
		      card.cardPosY= PosY
		      
		      card.cardName= title
		      card.card.cardName= title
		      card.Tooltip= description
		      
		      CardDesign(card)
		      card.Refresh(True)
		    End
		  Next
		  
		  OrganizeCards
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		cardPopulation() As KanbanCardv2
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
