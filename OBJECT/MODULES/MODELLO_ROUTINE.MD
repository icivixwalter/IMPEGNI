MODELLO_ROUTINE.MD


### MODELLO_DI_ROUTINE


Private Sub MODELLO_ROUTINE_TXT_AfterUpdate()

    On Error GoTo ErrHandler ' Imposta il gestore degli errori

    ' Inserisci qui il codice che deve essere eseguito dopo l'aggiornamento del campo di testo
    ' Ad esempio, potresti filtrare un elenco basato sul valore inserito
    MsgBox "Filtro aggiornato con successo!", vbInformation, "Aggiornamento"

ExitSub:
    Exit Sub ' Esce dalla subroutine per evitare l'esecuzione del gestore errori

ErrHandler:
    MsgBox "Si è verificato un errore: " & Err.Description, vbCritical, "Errore " & Err.Number
    Resume ExitSub ' Torna all'uscita della routine

End Sub

