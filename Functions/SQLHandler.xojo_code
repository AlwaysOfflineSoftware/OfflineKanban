#tag Module
Protected Module SQLHandler
	#tag Method, Flags = &h0
		Function GenerateUniqueID() As integer
		  Var now As DateTime= DateTime.Now
		  
		  Var calculatedID As String
		  calculatedID= "91" + now.Year.ToString + now.Month.ToString + now.Day.ToString + now.Hour.ToString + now.Minute.ToString + now.Second.ToString + System.Random.InRange(0, 1000).ToString
		  
		  Return calculatedID.ToInteger
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitDatabase()
		  Var DBSourceDisk As SQLiteDatabase = New SQLiteDatabase
		  Var currentDB As FolderItem = App.dbfile
		  
		  
		  If currentDB <> Nil Then
		    Try
		      System.DebugLog("INIT DB: " + currentDB.NativePath)
		      DBSourceDisk.DatabaseFile = currentDB
		      DBSourceDisk.CreateDatabase
		      // +" image    BLOB,"_
		      runStatement("BEGIN TRANSACTION;"_
		      +" CREATE TABLE If Not EXISTS USER_WORKHIST ("_ // Work History
		      +" id    Integer,"_
		      +" card_id    Integer,"_
		      +" work_desc    Text,"_
		      +" done_date    Date,"_
		      +" PRIMARY KEY(id));"_
		      +" CREATE TABLE If Not EXISTS USER_CARDS ("_ //USER CARDS
		      +" id    Integer,"_
		      +" project    Text NOT NULL,"_
		      +" name    Text NOT NULL,"_
		      +" details    Text,"_
		      +" priority    Integer NOT NULL,"_
		      +" status    Integer NOT NULL,"_
		      +" type    Integer NOT NULL,"_
		      +" posY    Integer NOT NULL,"_
		      +" PRIMARY KEY(id));"_
		      +" CREATE TABLE If Not EXISTS USER_PROJECTS ("_ //USER PROJECTS
		      +" id    Integer,"_
		      +" project    VarChar Not NULL,"_
		      +" description    VarChar,"_
		      +" PRIMARY KEY(id));"_
		      +" INSERT INTO USER_PROJECTS VALUES (0,'Default','The default project for basic kanban use');"_
		      +" COMMIT;")
		    Catch e As DatabaseException
		      MessageBox("Error while creating and connecting to the database file.")
		    End Try
		  Else
		    MessageBox("Error creating the database on disk.")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function runQuery(sqlCode as string) As RowSet
		  // db is a valid connection to a SQLite database
		  Var connected As Boolean= False
		  Var rowsFound As RowSet
		  Var db As SQLiteDatabase= New SQLiteDatabase
		  db.DatabaseFile= App.dbFile
		  
		  Try
		    connected= db.Connect()
		    If(connected And sqlCode.Lowercase.Contains("select")) Then
		      rowsFound= db.SelectSQL(sqlCode)
		    Else
		      System.DebugLog("Failed to connect")
		    End
		    Return rowsFound
		  Catch e As DatabaseException
		    MessageBox(e.Message)
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub runStatement(sqlCode as string)
		  // db is a valid connection to a SQLite database
		  Var connected As Boolean= False
		  Var db As SQLiteDatabase= New SQLiteDatabase
		  db.DatabaseFile= App.dbFile
		  
		  Try
		    connected= db.Connect()
		    If(connected And (sqlCode.Lowercase.Contains("insert") Or sqlCode.Lowercase.Contains("delete") Or sqlCode.Lowercase.Contains("update"))) Then
		      db.SQLExecute(sqlCode)
		    Else
		      System.DebugLog("Failed to connect")
		    End
		  Catch e As DatabaseException
		    MessageBox(e.Message)
		  End Try
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
