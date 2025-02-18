LLPP_IMPEGNI_Tb01FrmS01_14_ELENCO_IMPEGNI.MD

### NOTE
		@FORM@ELENCO@IMPEGNI_(questa è la form per la gestione degli impegni)



### AGGIORNAMENTI
		2024_02_17_RECORDSOURCE=CARICO LA QUERY LLPP_IMPEGNI_Tb01Qry01_14_ELENCO_IMPEGNI_COD_PRAT






### CLASSE_ELENCO_IMPEGNI


'//CLASSE FORM -> Form_LLPP_IMPEGNI_Frm_S01_14_ELENCO_IMPEGNI.cls
'//******************************************************************************************************************//
'//MODELLO FORM -> path         -> C:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHVI_MDB\LLPP_GESTIONE\LPP_ANALISI\IMPEGNI_DI_SPESA\ _
                   database     -> TABELLA_Tb01_ATTI_DI_IMPEGNO.mdb - collegamento.lnk

    'form MASTER -> LLPP_IMPEGNI_Frm_S01_14_ELENCO_IMPEGNI      = FileAtto_s
    'form FIGLIA -> LLPP_IMPEGNI_Frm_S02_01_ELENCO_DI_SPESA     = FileAtto_s
    '//@FORM@ELENCO@IMPEGNI
    
'//MODULI - NECESSARI           -> GESTIONE_Mdl10_FILE_APRI_PDF.mdl

'//******************************************************************************************************************//




Option Compare Database
Option Explicit


' Dim Variabili di Modulo
Dim DaoDB As DAO.Database
Dim DaoRs As DAO.Recordset

Dim DaoRs_Ordina_dati As DAO.Recordset
Dim DaoRs_Duplicato As DAO.Recordset

'Contatori
Dim icount As Integer
Dim dbl_count As Double

'Le variabili generiche
Dim sSql As String
Dim sSql_TOT As String
Dim Vv1 As Variant
Dim Int1 As Integer
Dim Str1 As String
Dim Str2 As String
Dim NomeCampo_s As String
Dim NomePagina_s As String
Dim NomeCasellaDiTesto_s As String
Dim Long1 As Long


'//VARIABILI
Dim MyPath_s As String
Dim MyFile_s As String
Dim IDGestione_lng As Long

Dim myNameForm As String                              '//il nome della form corrente







'//ERRORI PROCEDURA_FUNCTION O ROUTINE
Dim ProceduraMessaggioErrore_s As String
Dim ProceduraAttivaEseguita_s As String




'//02_EVENTI_CAMPI_FORM_01
'//=====================================================================================//
'//

    '
'//02_EVENTI_CAMPI_FORM_01      *** FINE ***
'//=====================================================================================//
'//



Private Sub Indirizzo_DblClick(Cancel As Integer)

    '//Aggiorna l'indirizzo esteso
    DoCmd.OpenQuery "A0203_Qry02-42_(IndirizzoEsteso)_(Up)"
    


End Sub

'//AGGIORNAMENTO FLAG ALBO
Private Sub ALB_b_Txt_AfterUpdate()
    Me.DATAAGG_TXT = Date
    Me.TIMEOPER_Txt = Now
End Sub



Private Sub CasellaCombinata83_Click()

End Sub

'//AGGIORNAMENTO CLASSIFICAZIONE
Private Sub CLASS_ATTI_Txt_AfterUpdate()
    '//Aggiorno la data e l'ora dell'operazione.
    
    
    Me.DATAAGG_TXT = Date
    
    Me.TIMEOPER_Txt = Now()
End Sub

Private Sub CLASS_ATTI_Txt_DblClick(Cancel As Integer)
    '//APRO_LA_TABELLA_ATTI_DI_IMPEGNO
    'DoCmd.OpenTable "LLPP_IMPEGNI_DF02_VOCE_ATTI_IMPEGNO" '//OLD
    DoCmd.OpenForm "LLPP_IMPEGNI_Frm_M00_GESTIONE_IMPEGNI"
    
    
    
    
End Sub




'//EVENDO DOPPIO CLICK SUL FILE
Private Sub FileAtto_s_Txt_DblClick(Cancel As Integer)
        
        '//SOSPESO ---> MyPath_s = "c:\GESTIONI\GESTIONE_LLPP\02_SCANNER\ScannerTmp\"     ' Imposta il percorso.
        
        '//SOSPESO ---> TROVA_N01_PATH_pFunct MyPath_s
        
        
        
        
        '//CODICE --->@APRI@FILE@APRI@PATH
        '//APRO FILE PDF SPECIFICO CON IL COMANDO OGGETTO PDF
        '//---------------------------------------------------------------------------------------------------------------//
        '//NOTE                 -> Apro il file di tipo doc, zip o pdf
        '//CODICE               -> Function ApriFilePdf.01.01
         
                      '//chiamo la sub con i parametri (@APRO@SOLO@FILE, @APRO@LA@PATH) : _
                      Path_programma_s        = LA PATH COMPLETA + _
                      MyFile_s                = FILE ACCESS .MDB + _
                      IDGestione_lng          = ID RECORD se necessario + _
                      MyPath_b                = Flag per distinguere il file o la path da aprire, _
                                                TRUE = apro il FILE;  FALSE apro solo la path
        
        
         '//RECUPERO PARAMETRO DA TABELLA OGGETTI
              Dim MyFile_s As String
              Dim MyPath_s As String
              Dim IDGestione_lng As Long
              Dim MyPath_b As Boolean
              
              MyFile_s = ""
              MyPath_s = ""
              IDGestione_lng = 0
              MyPath_b = True
              
    
                If Me.FileAtto_s_Txt.Value > "" Then
                    MyFile_s = Me.FileAtto_s_Txt.Value
                End If
                If Me.PathFileAtto_s_Txt > "" Then
                    MyPath_s = Me.PathFileAtto_s_Txt.Value
                           
                End If
                
                IDGestione_lng = Me.IDGestione_Txt
                IDGestione_lng = 0

                
                
              ApriFilePdf MyPath_s, MyFile_s, IDGestione_lng, MyPath_b
        '//---------------------------------------------------------------------------------------------------------------//

      
            
            '//Imposta le variabili a null
            Str1 = vbNull
            MyFile_s = vbNull
            MyPath_s = vbNull
            IDGestione_lng = vbNull
            
            
        '//CHIAMO LA PROCEDURA ED AGGIORNO LA SOTTOFORM *** FINE ***
        '//........................................................
   

End Sub

'//AGGIORNAMENTO_RECORD
Private Sub Form_BeforeUpdate(Cancel As Integer)


 '//AGGIORNAMENTO RECORD - BLOCCO RECORD + UNDO - REIMPOSTO I VALORI PRECEDENTI
 '//........................................................
    '//Nota = nel caso dell'aggiornamento del record, deve _
      essere evidenziato un avviso con il quale si richiede lo sblocco del record _
      nel caso in cui il campo BLOCC_b = TRUE. Manualmente impostare a false e poi _
      effettuare l'aggiornamento - VIENE UTILIZZATO IL METODO UNDO  che non consente _
      l'aggiornamento del record e ripristina i valori precedenti, solo nel caso di _
      BLOCCO_RECORD = TRUE.

        '::::
                       
     
            If Me.BLOCC_b_TXT = -1 Then
                   
                  
                    
                        MsgBox "PER L'AGGIORNAMENTO TOGLIERE IL BLOCCO RECORD! E RIPETERE L'OPERAZIONE", vbExclamation, "BLOCCO DEL RECORD"
                        '//REIMPOSTA I VALORI ALLO STATO PRECEDENTE + imposta il blocco record
                        Me.Undo
                        '//Imposto il blocco record dopo l'evento unto per consentire l'aggiornamento della _
                           casella combinata altrimenti se viene inserito prima dell'evento Undo, l'aggiornamento _
                           cancella tutte le modifiche del record.
                        Me.BLOCC_b = True
                   
                        
               
                
            End If
    '//........................................................



End Sub


Private Sub Form_Load()

'//SU CARICAMENTO IMPOSTO IL NOME DELLA FORM CORRENTE ED IL REQUERY
'//....................................................................//
'//NOTE:  assegno il nome della form corrente al campo NOME FORM _
        E LA VISUALIZZO.
        
      myNameForm = Me.Name
      Debug.Print Vv1
      '"01) LLPP_IMPEGNI_Frm_S01_12_GRUPPO_IMPEGNI_ANNO - MASTER
      NameForm_s_Txt = "03) " & myNameForm
      
      '//IMPOSTO IL RECORDSOURCE _
        2024_02_17_RECORDSOURCE=CARICO LA QUERY LLPP_IMPEGNI_Tb01Qry01_14_ELENCO_IMPEGNI_COD_PRAT
      Me.RecordSource = "LLPP_IMPEGNI_Tb01Qry01_14_ELENCO_IMPEGNI_COD_PRAT"
      
      Me.Requery
      Me.Recalc

'//....................................................................//

End Sub


Private Sub IDGestione_Txt_AfterUpdate()
    
    '//AGGIORNO I CAMPI IMPEGNO _
    '//---------------------------------------------------------------------------------------//
    '// Dopo l 'inserimento dell'ID atto vengono aggiornati i campi dell'impegno prelevando _
        i dati della determina dalla tabella atti e mediante l'ID DEL RECORD viene aggiornata _
        la posizione della pratica in lavorazione. La qury di aggiornamento collettiva di seguito _
        indicata viene sospesa.
            '// SOSPESA :DoCmd.OpenQuery "LLPP_IMPEGNI_Qry01_15_Aggiorna_Campi_atti_di_impegno"
            
            '//Id della pratica corrente + stringa ssql di aggiornamento record impegni
            IDGestione_lng = 0
            IDGestione_lng = Me.IDGestione_KEY
            
            sSql = ""
            sSql = sSql & "Update "
            sSql = sSql & "LLPP_ATTI_Tb01_Gestione INNER JOIN LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO "
            sSql = sSql & "ON LLPP_ATTI_Tb01_Gestione.IDGestione = LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.IDGestione "
            sSql = sSql & "SET LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.TipoAtto_s = [LLPP_ATTI_Tb01_Gestione].[TipoAtto_s], "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NroAtto_lng = [LLPP_ATTI_Tb01_Gestione].[NroAtto_lng], "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.DataAtto_d = [LLPP_ATTI_Tb01_Gestione].[DataAtto_d], "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.AnnoAtto_i = [LLPP_ATTI_Tb01_Gestione].[AnnoAtto_i], "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.CodPratica_s = [LLPP_ATTI_Tb01_Gestione].[CodPratica_s], "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.AnnoCodPratica_i = [LLPP_ATTI_Tb01_Gestione].[AnnoCodPratica_i], "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NroPratica_i = [LLPP_ATTI_Tb01_Gestione].[NroPratica_i], "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.OggettoAtto_m = [LLPP_ATTI_Tb01_Gestione].[OggettoAtto_m], "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.CodOpera_s = [LLPP_ATTI_Tb01_Gestione].[CodOpera_s], "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NoteAtto_s = [LLPP_ATTI_Tb01_Gestione].[NoteAtto_s], "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NoteEx_m = [LLPP_ATTI_Tb01_Gestione].[NoteEx_m], "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.FileAtto_s = [LLPP_ATTI_Tb01_Gestione].[FileAtto_s], "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.PathFileAtto_s = [LLPP_ATTI_Tb01_Gestione].[PathFileAtto_s], "
            
            
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.[DATAAGG] = DATE (), "
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.[TIMEOPER] = NOW (), "
            
            
            sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.IDGestione = [LLPP_ATTI_Tb01_Gestione].[IDGestione] "
            sSql = sSql & "WHERE (((LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.IDGestione)=" & IDGestione_lng & "));"
                        '//CONTROLLO ED ESECUZIONE
            Debug.Print sSql
            CurrentDb.Execute sSql
            
            
            '//@2024.11.28.01= AGGIORNAMENTO CASELLA DI TESTO OggettoAtto_s_TXT, AL MOMENTO DEL POPOLAMENTO CAMPO NEMO AGGIORNA _
                    IL CAMPO 255 ..... TODO: @DA@FINIRE creare query update ..._
                    
            
            
            Me.Recalc
    '//---------------------------------------------------------------------------------------//

End Sub

Private Sub IDGestione_TXT_DblClick(Cancel As Integer)
    
    '//CONTROLLO_LA_TABELLA_IMPEGNI
    '//=========================================================================================//
    '// NOTE :Su doppio click sull'id Impegni eseguo le due query di seguito indicate _
        di svuotamento + accodamento dati nella tabella di gestione tmp sulla quale recuperare _
        la chiave IdGestione da utilizzare nella query di visualizzazione.
      
        
        '//01_SVUOTO LA TABELLA TMP
        sSql = ""
        sSql = sSql & "DELETE LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO_TMP.* "
        sSql = sSql & "FROM LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO_TMP;"
        
        '//Controllo la stringa ed eseguo
        Debug.Print sSql
        CurrentDb.Execute sSql
    
        
        '//02_RICOSTRUISCO L'IDGESTIONE = ATTI SOLO SE DIFFORME DALLA TABELLA ATTI
        '//....................................................................................//
        '//NOTE :effettuo il controllo con il campo FILE_ATTO tra le due tabelle e recupero _
                 il valore  del campo codice idGestione _
                (LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.FileAtto_s =LLPP_ATTI_Tb01_Gestione.FileAtto_s); _
                 se l'idGestione della tabella IMPEGNO <> dall'IdGestione della _
                tabella Atti, effettuo la sostituzione sulla tabella impegno con quello originale _
                (con LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.idGestione = LLPP_ATTI_Tb01_Gestione.idGestione) _
                Se l'Id di Gestione della tabella impegni NON SI TROVA nella TABELLA atti vuol dire che è _
                id di gestione errato e viene annullata l'operazione.
                
                '//DA SISTEMARE ???
                '//SISTEMARE ALTRIMENTI CAMBIA I DATI QUANDO IL FILE ATTO è NULLO; IL PROBLEMA LO FA PER _
                per i codici che si trovano nella form nro 7 ALTRO, in pratica sostituisce il codice _
                degli LPP NULL O ERRATI con altro codice. Questo è un errore da correggere in seguito.
                If Me.FileAtto_s_Txt > "" Then
                                                
                           '//APERTURA RECOREDSET E CONTROLLO WITH DaoRs
                           '//............................................................................//
                                    '//reset
                                    Long1 = 0
                                    
                                    '//Inserire tabella o stringa ssql
                                    sSql = ""
                                    sSql = sSql & "SELECT LLPP_ATTI_Qry01_01_Gestione.FileAtto_s, LLPP_ATTI_Qry01_01_Gestione.IDGestione "
                                    sSql = sSql & "FROM LLPP_ATTI_Qry01_01_Gestione "
                                    sSql = sSql & "WHERE (((LLPP_ATTI_Qry01_01_Gestione.FileAtto_s)='" & Me.FileAtto_s_Txt & "'));"

                                    '//CONTROLLO ED ESECUZIONE
                                    Debug.Print sSql
                                    
                                    Set DaoRs = CurrentDb.OpenRecordset(sSql)
                        
                        
                                    With DaoRs
                        
                                    'Controllo Rs
                                    If DaoRs.EOF = False And DaoRs.BOF = False Then
                        
                                     .MoveFirst
                        
                                    'ITERAZIONE RS DI LETTURA
                                    '----------------------------------------------------------------------
                                        While Not DaoRs.EOF
                        
                                        'Controllo windows
                                        DoEvents
                        
                                        '// Controllo se idGestione della form è <> dall'Id Gestione _
                                         del recordset attivo la modifica.
                                        '------------------------------------------------
                                            If (Me.IDGestione_Txt <> .Fields("IDGestione")) Then
                                            
                                            'salvo il codice IdGestione old nella variabile di appoggio
                                            Long1 = Me.IDGestione_Txt
                        
                                            Debug.Print
                                            Debug.Print ":::::::::::::::::::::::::::::::::::::::::::::"
                                            Debug.Print "IDGestione old = " & Long1 & " <> Id Gestione Tabella Atti = " & .Fields("IDGestione")
                                
                                        '............................................
                        
                                                '//imposto il campo id gestione con il valore recuperato sul _
                                                recordset e lo salvo sul campo della form, emettendo un messaggio di avviso.
                                                Me.IDGestione_Txt = DaoRs.Fields("IDGestione")
                                                                                                
                                                'msgbox ("SOSTITUZIONE ID GESTIONE OLD = " & Long1 & " CON QUELLO NUOVO" & DaoRs.Fields("IDGestione"), vbExclamation)
                                                MsgBox "SOSTITUZIONE IDGestione OLD del campo form errato = " & Long1 & " sostituito con il NUOVO RECUPERATO DALLA TALLEA ATTI -> " & DaoRs.Fields("IDGestione") & " ", vbExclamation
                                            
                                            
                                            '//SE I CODICI SONO UGUALI SONO CORRETTI - ESCO DALLA ROUTINE
                                            ElseIf (Me.IDGestione_Txt = .Fields("IDGestione")) Then
                                                    '//chiudo il rs ed esco dalla routine
                                                      '//perchè i codici sono uguali e quindi corretti
                                                    DaoRs.Close
                                                    Set DaoRs = Nothing
                                                    Exit Sub
                                                    
                                                    
                                            
                                            Else
                                                '//Se non trova l'idGestione del campo form nella tabella atti vuol dire che non esiste quello corretto _
                                                e l'operazione di sostituzione viene annullata
                                                MsgBox "ID GESTIONE del campo form " & Long1 & " non esiste, operazione di sostituzione ANNULLATA!", vbCritical
                                                             
                                            End If
                                            
                                        '//nw record
                                        DaoRs.MoveNext
                        
                                        Wend
                                    'ITERAZIONE RS DI LETTURA       *** fine ***
                                    '----------------------------------------------------------------------
                                    Else
                                            '??? sistemare
                                            MsgBox "Campo id Gestione : " & Me.IDGestione_Txt & " è uguale FILE_ATTO vuoto operazione Annullata!", vbCritical
                                    End If '//If DaoRs.EOF = False And DaoRs.BOF = False Then
                        
                        
                                    End With
                        
                                    '//Reset oggetti
                                    Set DaoRs = Nothing
                                    
                                    
                           '//APERTURA RECOREDSET E CONTROLLO WITH DaoRs *** fine ***
                           '//............................................................................//
                                
                      End If '//If Me.FileAtto_s_Txt > ""  PROVVISORIO

            
                 
        '//03_INSERISCO_ID_GESTIONE_NELLA_TMP _
        inserisco il codice idGestione nella tabella tmp solo se id > null e dopo il controllo _
        tra gli id delle tabelle Atti e Tabella impegni. Solo alla fine sia arriva a questa funzione _
        per evitare l'aggiornamento ed il cambio di data ed ora anche quando non serve.
        '//....................................................................................//
            
            If Me.IDGestione > 0 Then
                sSql = ""
                sSql = sSql & "INSERT INTO LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO_TMP ( IDKeyArch_lng ) "
                sSql = sSql & "SELECT " & Me.IDGestione & " AS IDGESTIONE;"
                '//Controllo la stringa ed eseguo
                Debug.Print sSql
                CurrentDb.Execute sSql
                Me.Recalc
               '//AGGIORNO I CAMPI D'IMPEGNO
                Call IDGestione_Txt_AfterUpdate

            End If
        '//....................................................................................//
        
       
                
                
                
                
                
        '//....................................................................................//
      
        
        
    '//=========================================================================================//
End Sub

'//todo: @oggi@prova ad aprire il file con la classe
Private Sub PathFileAtto_s_Txt_DblClick(Cancel As Integer)

   '//CLASSE PER L'APERTURA FILE CON IL DOS O CON IL PAWER SHELL
      '//**************************************************************************************************************//
      '//ATTENZIONE: se la path + file è troppo lunga di 255 caratteri la procedura non funziona devi ridurre la path _
          OPPURE UTILIZZI LA POWER SHELL DI WINDOS che gestisce oltre i 255 caratteri.
      '//PARAMETRI      -> passo 3 PARAMETRI 2 stringhe + 1 LONG _
                           par_Path_s           = la path del db _
                           par_NameFile_s       = il nome del file _
                           par_IDGestione_lng   = id del file puo essere anche zero



              
                ' Definisco la classe per gestire i file
                  '--->
                  Dim MyCls_CLASSE_ATTI_Tb01_Gestione As CLASSE_ATTI_Tb01_Gestione
                  '--->
                  Set MyCls_CLASSE_ATTI_Tb01_Gestione = New CLASSE_ATTI_Tb01_Gestione
                
                '// dim e reset dei parametri
                   '--->
                   Dim MyPath_s As String
                   '--->
                   Dim MyFile_s As String
                   '--->
                   Dim MyParam_lng As Long
                   '--->
                   MyPath_s = ""
                   '--->
                   MyFile_s = ""
                   '--->
                   MyParam_lng = 0
                   
                   MyPath_s = Me.PathFileAtto_s_Txt
                   MyFile_s = Me.FileAtto_s_Txt
                   
              ' Chiamo la funzione della classe passando i parametri
              '--->
              MyCls_CLASSE_ATTI_Tb01_Gestione.ApriFilePdf_Interna_s_PFunct_DA_RIORDINARE MyPath_s, MyFile_s, MyParam_lng
              
              
                  ' Rilascio l'oggetto e pulisco la memoria
                  '--->
                  Set MyCls_CLASSE_ATTI_Tb01_Gestione = Nothing
                  '--->
  
      
      '//**************************************************************************************************************//
     


End Sub
