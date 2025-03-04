LLPP_IMPEGNI_Tb01FrmS01_14_00_GE_GE_ELENCO_IMPEGNI.MD 

### NOTE
    CLASSE della form MASTER per la gestione dell'elenco impegni; contiene la casella
    di testo per il filtro che opera sulla sottoform collegata.
    



### CLASSE_FORM
'//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//
'//                   ATTIVITA DI GESTIONE
'// CLASSE_MODULO_FORM :      LLPP_IMPEGNI_Tb01FrmS01_14_00_GE_GE_ELENCO_IMPEGNI
'//                           classe della @form @GE_ELENCO_IMPEGNI@MASTER
'//
'// NOTE: classe legata alla gestione degli impengni in particolare questa FORM MASTER gestisce la casella di _
          testo FILTRO_ELENCO_INPEGNI_TXT con la quale si puo attivare il filtro sulla sottoform collegata _
          alla sottoform_01 ELENCO IMPEGNI (LLPP_IMPEGNI_Tb01FrmS01_14_ELENCO_IMPEGNI)  in cui attivando _
          il filtro della casella di testo vengono esposti solo i record relativi ai campi di ricerca _
          tra cui: CUP + CIG + NRO PRATICA + ID PRATICA ECC..   @FORM@MASTER_(GESTIONE FILTRO ED ELENCO IMPEGNI). _
          Per individuare lo schema sql attivo per il filtro individuare questo codice ----> @QUERY@CASELLA@DI@TESTO@FILTRO_ _
          su sublimetext.


'// MODULI COLLEGATI _
'// CLASSI COLLEGATE _
'// LIBRERIA DI FUNZIONAMENTO _
'//
'// @ATTIVITA@GESTITE_(TUTTE LE @ROUTINE E LE @FUNZIONI)
'//
'// 01.@MASTER@GE_ELENCO_IMPEGNI=DEFINIZIONI DELLE VARIABILI
'// 02.@FILTRO_ELENCO_IMPEGNI= FILTRO SULLA FORM ELENCO IMPEGNI
'//
'//
'//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//

'// MODIFICHE_ALLA_CLASSE: _
'//* 2025.02.17= CREATO IL FILTRO PER LA ESTRAZIONE DELL'ELENCO DEGLI IMPEGNI
'//* 2025.02.18= CREATO ALTRI 2 EVENTI PER L'ATTIVAZIONE DELLA CASELLA FILTRO

 







'// 01.@MASTER@GE_ELENCO_IMPEGNI=DEFINIZIONI DELLE VARIABILI

'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
'Option
      
    Option Compare Database
    Option Explicit


'Variabili di database
'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
'DAO
    Dim DaoDB As DAO.Database
    Dim DaoWks As DAO.Workspace
    Dim DaoRs As DAO.Recordset
    
    'ADO
    Dim ADODB As Database
    Dim AdodaoRs As Recordset
    
    'Contatori
    Dim icount As Integer
    Dim dbl_count As Double
    
    'Le variabili generiche
    Dim sSql As String                                          ' Stringa di estrazione
    
    'Variabili generali
    Dim Str1 As String, Str2 As String, Str3 As String
    Dim Int1 As Integer
    Dim Date1 As Date
    Dim Lng1 As Long
    Dim Dbl1 As Double
    Dim Bool1 As Boolean
    Dim Vv1 As Variant, vV2 As Variant, vV3 As Variant
    Dim obj1 As Object



'Gestione parametri comandi
    Dim sxParamCmd_03 As String


'Larghezza e numero di colonna
    Dim sLarg_Col As String
    Dim iNum_Col As Integer



'Variabili DELLA FORM
'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


'//**************************************************************************************************************//
'//*
'//*              EVENTI FILTRO           *** INIZIO ***
'//*
'//**************************************************************************************************************//
'//* 1) FILTRO_ELENCO_INPEGNI_TXT_Enter           = EVENTO ENTER
'//* 2) FILTRO_ELENCO_INPEGNI_TXT_DblClick        = EVENTO DOPPIO CLICK
'//* 3) FILTRO_ELENCO_INPEGNI_TXT_AfterUpdate     = EVENTO DOPO AGGIORNAMENTO
'//*
'//*
'//* MODIFICHE:
'//*
'//* 2025.02.17= CREATO IL FILTRO PER LA ESTRAZIONE DELL'ELENCO DEGLI IMPEGNI
'//* 2025.02.18= CREATO ALTRI 2 EVENTI PER L'ATTIVAZIONE DELLA CASELLA FILTRO


      
      

'//* 1) FILTRO_ELENCO_INPEGNI_TXT_Enter           = EVENTO ENTER

Private Sub FILTRO_ELENCO_INPEGNI_TXT_Enter()
    Call FILTRO_ELENCO_INPEGNI_TXT_AfterUpdate
    Me.Recalc
     Me.FILTRO_ELENCO_INPEGNI_TXT.SetFocus
End Sub

'//* 2) FILTRO_ELENCO_INPEGNI_TXT_DblClick        = EVENTO DOPPIO CLICK
Private Sub FILTRO_ELENCO_INPEGNI_TXT_DblClick(Cancel As Integer)
  Call FILTRO_ELENCO_INPEGNI_TXT_AfterUpdate
  Me.Recalc
   Me.FILTRO_ELENCO_INPEGNI_TXT.SetFocus
End Sub

'//* 3) FILTRO_ELENCO_INPEGNI_TXT_AfterUpdate     = EVENTO DOPO AGGIORNAMENTO
'//....................................................................................//
'//NOTE: questo è il filtro creato per gestire l'elenco degli impegni, SE LA CASELLA _
        di testo è valorizzata sostituisce il recordo source con la query sql altrimenti _
        reinserisce la query base
'//2025.02.17= CREATO IL FILTRO PER LA ESTRAZIONE DELL'ELENCO DEGLI IMPEGNI

'//ATTIVITA: _
      01_FILTRO_TXT_>""=COSTRUISCO LA QUERY SSQL _
      02_FILTRO_TXT_=""=SE LA TXT E' NULL REIMPOSTO LA QUERY BASE
Private Sub FILTRO_ELENCO_INPEGNI_TXT_AfterUpdate()

    
    On Error GoTo ErrHandler ' Imposta il gestore degli errori
    '//01_FILTRO_TXT_>""=COSTRUISCO LA QUERY SSQL
    If FILTRO_ELENCO_INPEGNI_TXT > "" Then
        '//01 = creo la query sql
          sSql = ""
          sSql = sSql & "SELECT "
          sSql = sSql & "'Tutti gli impegni-> LLPP_IMPEGNI_Qry01_19_ELENCO_IMPEGNI_COD_PRAT'" & "   AS TXTQuery, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.* ," & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.AnnoAtto_i                       AS ANNO, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.CodPratica_s                     AS CODICE_PRAT, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NroPratica_i                     AS NRO_PRAT, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.TipoAtto_s                       AS TIPO_ATTO, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NroAtto_lng                      AS NRO_ATTO, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.DataAtto_d                       AS DATA, " & vbCrLf
          sSql = sSql & "Len([OggettoAtto_m])                                               AS LUNGHEZZA_m, " & vbCrLf
          sSql = sSql & "Len([OggettoAtto_s])                                               AS LUNGHEZZA_255, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.OggettoAtto_m                    AS OGGETTO_ATTO, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NoteAtto_s                       AS NOTE_ATTO, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.FileAtto_s                       AS FILE_ATTO, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.PathFileAtto_s                   AS PATH, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.Lavorato_s                       AS LAVORATO, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NoteBrevi_ATTI_DI_IMPEGNO_s          AS NOTE_BREVI_IMP, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.CLASS_ATTI_DI_IMPEGNO_s            AS CLASS_ATTI, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.CIG_CODICE_s                     AS CIG, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.CUP_CODICE_s                     AS CUP, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NoteCIG_s                        AS NOTE_CIG, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.ALB_b                            AS ALB, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.TRASP_b                          AS TRASP, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.CF_s                             AS CF, " & vbCrLf
          sSql = sSql & "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.PIVA_s                           AS PIVA, " & vbCrLf
          sSql = sSql & "[CLASS_ATTI] & '-' & [FILE_ATTO] & '- ' & [CODICE_PRAT] & ' - ' & [NRO_PRAT] & ' -> ' & [NoteAtto_s] & ' - ' & [NoteEx_m] AS TXTSTAMPA_ELENCO " & vbCrLf
          sSql = sSql & "FROM LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO " & vbCrLf
          sSql = sSql & "WHERE ((([NroAtto_lng] & '|' & [NroPratica_i] & '|' & [AnnoAtto_i]  & '|' & [FileAtto_s]  & '|' &  [CIG_CODICE_s] & '|' &  [CUP_CODICE_s] & '|' &  [IDGestione]) " & vbCrLf
          sSql = sSql & "Like '*" & Trim(Me.FILTRO_ELENCO_INPEGNI_TXT) & "*' ));" & vbCrLf
            
          '//01_FILTRO_TXT_>"".02=CON EVENTO MODIFICA DELLA CASELLA DI TESTO ATTRIBUISCO LA QUERY CREATA COME RECORDSOUCE
          '//Controllo query
          Debug.Print sSql
            '//sostituisco la query LLPP_IMPEGNI_Tb01Qry01_14_ELENCO_IMPEGNI_COD_PRAT con quella costruita in ssql
            Me.SottoForm_01.Form.RecordSource = sSql
            
      
      Else
            '//02_FILTRO_TXT_=""=SE LA TXT E' NULL REIMPOSTO LA QUERY BASE
            Me.SottoForm_01.Form.RecordSource = "LLPP_IMPEGNI_Tb01Qry01_14_ELENCO_IMPEGNI_COD_PRAT"
            
      End If
      
            Me.FILTRO_ELENCO_INPEGNI_TXT.SetFocus

    

ExitSub:
    Exit Sub ' Esce dalla subroutine per evitare l'esecuzione del gestore errori

ErrHandler:
    MsgBox "Si è verificato un errore: " & Err.Description, vbCritical, "Errore " & Err.Number
    Resume ExitSub ' Torna all'uscita della routine

End Sub




'//**************************************************************************************************************//
'//*
'//*              EVENTI FILTRO           *** FINE ***
'//*
'//**************************************************************************************************************//

