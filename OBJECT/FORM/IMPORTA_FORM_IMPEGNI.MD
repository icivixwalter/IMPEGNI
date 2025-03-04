
'//=====================================================================================================================//
'//                     CMD_IMPORTA OGGETTI FORM DEL DB ESTERNO *** INIZIO ***
'//                     @IMPORTA@OGGETTI@FORM@MSYS
'//=====================================================================================================================//



'//IMPORTA TUTTI GLI OGGETTI FORM DEL DB MSYSDBEST
'//----------------------------------------------------------------------------------------//
'//Note:
'//OPERAZIONI:
'//@TABLE@.01 ......
'//@TABLE@.02 ......
'//@TABLE@.03 ......
'//@TABLE@INSERT.24=CICLO FOR PER ANDARE ALL'@ULTIMA@FORM @IMPORTATA E FARE IL DoCmd.SelectObject  DELL'OGGETTO

Private Sub Cmd_Importa_FORM_Click()
    '//DIM della collezione form da importare
    Dim formsCollection As Collection
    Dim formName_v As Variant
    Dim sourceDB As DAO.Database
    Dim db As DAO.Database
    Dim ws As DAO.Workspace
    Dim sourceDBPath As String
    Dim myformName_s As String
    Dim importedCount_i As Integer
    Dim deletedCount_i As Integer
    Dim deletedForms_s As String
    Dim importedForms_s As String
    Dim Bool1 As Boolean
    Dim MyValue As Integer
    
    On Error GoTo ErrorHandler
    
    ' Inizializza i contatori e le stringhe di riepilogo
    importedCount_i = 0
    deletedCount_i = 0
    deletedForms_s = ""
    importedForms_s = ""

    ' RECUPERO LA COLLEZIONE FORM DA IMPORTARE E FACCIO IL CONTROLLO
    Set formsCollection = CollectionForm_PFunct()

    ' SE LA COLLECTION E' VUOTA ESCI DALLA ROUTINE
    If formsCollection.count = 0 Then Exit Sub

    ' Controllo path ed il file.mdb per le importazioni
    sourceDBPath = PathFile_s_pFunct
    If sourceDBPath = "" Then
        MsgBox "ATTENZIONE ERRORE path e file sono null uscita dalla routine", vbCritical, "MSG CONTROLLO PATH E FILE VALORIZZATI"
        Exit Sub
    End If

    ' Primo controllo progetto
    MyValue = CheckAvviso_i_PFunct(Me.ctr_AVVISO_ABILITATO_TXT)
    If MyValue = 0 Then Exit Sub

    ' Secondo controllo progetto
    Bool1 = CheckProjectName_b_PFunct
    If Bool1 = True Then Exit Sub

                ' Se siamo su un progetto esterno (Bool1 = False), procedo con l'importazione
                If Bool1 = False Then
                    ' Apri il database di origine e il database di destinazione
                    Set ws = DBEngine.Workspaces(0)
                    Set sourceDB = ws.OpenDatabase(sourceDBPath)
                    Set db = CurrentDb
            
                    ' Ciclo nella collezione per il controllo delle form precaricate
                    For Each formName_v In formsCollection
                        myformName_s = formName_v
                        
                        ' Controlla se LA FORM esiste nel database di origine
                        If ObjectExists(sourceDB, acForm, myformName_s) Then
                            ' Se esiste nel db esterno, controlla se esiste anche nel db corrente e cancellalo
                            If ObjectExists(db, acForm, myformName_s) Then
                                DoCmd.DeleteObject acForm, myformName_s
                                deletedCount_i = deletedCount_i + 1
                                deletedForms_s = deletedForms_s & myformName_s & vbCrLf
                            End If
                            
                            ' Importa LA FORM dal database di origine
                            DoCmd.TransferDatabase acImport, "Microsoft Access", sourceDBPath, acForm, myformName_s, myformName_s
                            importedCount_i = importedCount_i + 1
                            importedForms_s = importedForms_s & myformName_s & vbCrLf
                        Else
                            MsgBox "La form '" & myformName_s & "' non esiste nel database di origine.", vbExclamation
                        End If
                    Next formName_v
            
                            '
                            
                    ' Chiudi il database di origine
                    sourceDB.Close
                    Set sourceDB = Nothing
                    Set ws = Nothing
            
                    ' Messaggio finale di riepilogo
                    If Me.ctr_AVVISO_ABILITATO_TXT = True Then
                        MsgBox "Importazione completata." & vbCrLf & _
                            "Forms importate: " & importedCount_i & vbCrLf & importedForms_s & _
                            "Forms esistenti cancellate: " & deletedCount_i & vbCrLf & deletedForms_s, vbInformation
                    End If
            
                    ' Rilascia gli oggetti
                    Set db = Nothing
                    Set formsCollection = Nothing
                End If
                
                                
                                
                    '//@TABLE@INSERT.24=CICLO FOR PER ANDARE ALL'@ULTIMA@FORM @IMPORTATA E FARE IL DoCmd.SelectObject  DELL'OGGETTO
                    '//ciclo nella collezione per il controllo delle FORM precaricate per SELEZIONARE LA PRIMA
                    '//--------------------------------------------------------------------------------------//
                    '//CODICE: @SELECT@ULTIMA@QUERY_(@selezione l'ultima FORM @salvata con @Docmd@selectObject)
                                                  
                    Dim lastFormName As String
                    Dim dbCurrent As DAO.Database
                    Dim doc As Object
                    
                    Set dbCurrent = CurrentDb
                    
                    ' Controlla se ci sono form nel database corrente
                    If CurrentProject.AllForms.count = 0 Then
                        MsgBox "Nessun form presente nel database corrente.", vbExclamation, "Attenzione"
                    Else
                        ' Itera sugli oggetti form per trovare l'ultimo
                        For Each doc In CurrentProject.AllForms
                            lastFormName = doc.Name
                        Next doc
                        
                        ' Seleziona e attiva l'ultimo form trovato
                        DoCmd.SelectObject acForm, lastFormName, True
                    End If
                    
                    ' Rilascia gli oggetti
                    Set doc = Nothing
                    Set dbCurrent = Nothing
                                    
                            
                    '//--------------------------------------------------------------------------------------//


    Exit Sub

ErrorHandler:
    MsgBox "Errore durante l'importazione: " & Err.Description, vbCritical
    If Not sourceDB Is Nothing Then
        sourceDB.Close
    End If
    Set sourceDB = Nothing
    Set ws = Nothing
End Sub


'//2024.08.06_EFFICIENTAMENTO_(efficientata la procedura con l'interrogazione sulla tabella MSysObjects per il controllo delle form esterne)
'//FUNZIONE DI CONTROLLO SE ESISTE L'OGGETTO
Function ObjectExists(db As DAO.Database, objType As Integer, objName As String) As Boolean
    Dim rs As DAO.Recordset
    Dim moduleExists As Boolean
    
    moduleExists = False
    On Error Resume Next
    Set rs = db.OpenRecordset("SELECT Name FROM MSysObjects WHERE Type=-32768 AND Name='" & objName & "'")
    If Not rs.EOF Then
        moduleExists = True
    End If
    rs.Close
    Set rs = Nothing
    ObjectExists = moduleExists
    On Error GoTo 0
End Function
'//IMPORTA TUTTI GLI OGGETTI FORM DEL DB MSYSDBEST *** FINE ***
'//----------------------------------------------------------------------------------------//



'//         IMPORTA PROGETTO OGGETTI FORM *** FINE ***
'//=========================================================================================//



'//=====================================================================================================================//
'//                     CMD_IMPORTA OGGETTI FORM DEL DB ESTERNO *** FINE ***
'//                     @IMPORTA@OGGETTI@FORM@MSYS
'//=====================================================================================================================//
