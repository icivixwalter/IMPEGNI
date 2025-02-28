AA_PROVA.MD

' --------------------------------
' ROUTINE PER AUMENTARE LE DIMENSIONI
' --------------------------------
Public Sub AumentaDimensioni()
    Dim frm As Form
    Dim errMsg As String

    ' Chiudi la form se è aperta
    If SysCmd(acSysCmdGetObjectState, acForm, "AA_PROVA") <> 0 Then
        DoCmd.Close acForm, "AA_PROVA", acSaveYes
    End If

    ' Apri la form in modalità DESIGN
    DoCmd.OpenForm "AA_PROVA", acDesign
    Set frm = Forms("AA_PROVA")
    
    '//FORM PRINCIPALE
    '//..........................L  , H
    ' **Ordine corretto per AUMENTARE: FORM ? CORPO ? TAB CONTROL ? SOTTOFORM**
    Call ModificaFormPrincipale(frm, 36)      ' Form principale a 36 cm : larghezza
    
    
    '//CORPO MASCHERA
    '//..........................L  , H
    
    Call ModificaCorpoMaschera(frm, 30)       ' Corpo maschera a 27 cm  : altezza
    
    '//TAB CONTROLL
    '//..........................L  , H
    Call ModificaTabControl(frm, 32, 23)      ' Tab Control a 20x17 cm  : larghezza, altezza
    
    '//SOTTOFORM
    '//..........................H , L
    Call ModificaSottoform(frm, 15, 31)       ' Sottoform a 17x15 cm    : larghezza, altezza

    ' Salva e chiudi la form
   
    DoCmd.Close acForm, "AA_PROVA", acSaveYes
    Set frm = Nothing
    MsgBox "? Dimensioni aumentate con successo!", vbInformation, "Operazione Completata"
End Sub

' --------------------------------
' ROUTINE PER RIDURRE LE DIMENSIONI
' --------------------------------
Public Sub RiduciDimensioni()
    Dim frm As Form
    Dim errMsg As String

    ' Chiudi la form se è aperta
    If SysCmd(acSysCmdGetObjectState, acForm, "AA_PROVA") <> 0 Then
        DoCmd.Close acForm, "AA_PROVA", acSaveYes
    End If

    ' Apri la form in modalità DESIGN
    DoCmd.OpenForm "AA_PROVA", acDesign
    Set frm = Forms("AA_PROVA")

    ' **Ordine corretto per RIDURRE: SOTTOFORM ? TAB CONTROL ? CORPO ? FORM**
    Call ModificaSottoform(frm, 13, 15)       ' Sottoform a 13x15 cm
    Call ModificaTabControl(frm, 17, 17)      ' Tab Control a 17x17 cm
    Call ModificaCorpoMaschera(frm, 17.101)   ' Corpo maschera a 17.101 cm
    Call ModificaFormPrincipale(frm, 27)      ' Form principale a 27 cm

    ' Salva e chiudi la form
 
    DoCmd.Close acForm, "AA_PROVA", acSaveYes
    Set frm = Nothing
    MsgBox "? Dimensioni ridotte con successo!", vbInformation, "Operazione Completata"
End Sub

' -------------------------------
' **FUNZIONI DI SUPPORTO**
' -------------------------------

' Modifica la larghezza della Form principale
Private Sub ModificaFormPrincipale(frm As Form, larghezza As Double)
    frm.Width = cmToTwips(larghezza)
    DoEvents
End Sub

' Modifica l'altezza del Corpo Maschera
Private Sub ModificaCorpoMaschera(frm As Form, altezza As Double)
    frm.Section(acDetail).Height = cmToTwips(altezza)
    DoEvents
End Sub

' Modifica le dimensioni del Tab Control
Private Sub ModificaTabControl(frm As Form, larghezza As Double, altezza As Double)
    Dim tabCtl As Control
    On Error Resume Next
    Set tabCtl = frm("TabCtl1")
    On Error GoTo 0
    If Not tabCtl Is Nothing Then
        tabCtl.Width = cmToTwips(larghezza)
        tabCtl.Height = cmToTwips(altezza)
        DoEvents
    End If
    Set tabCtl = Nothing
End Sub

' Modifica le dimensioni di tutti i sottoform
Private Sub ModificaSottoform(frm As Form, altezza As Double, larghezza As Double)
    Dim i As Integer, ctl As Control
    For i = 1 To 12
        On Error Resume Next
        Set ctl = frm("sottoform_" & Format(i, "00"))
        On Error GoTo 0
        If Not ctl Is Nothing Then
            ctl.Width = cmToTwips(larghezza)
            ctl.Height = cmToTwips(altezza)
            DoEvents
        End If
        Set ctl = Nothing
    Next i
End Sub

' Funzione per convertire cm in twips
Private Function cmToTwips(cm As Double) As Long
    cmToTwips = cm * 567
End Function

