

# PROGETTO_IMPEGNI_MDB
        Note
                    @ANALISI@IMPEGNI_(questa è l'analisi per gli impegni)

            Il progetto di gestione oggetti pemette la gestione di tutti gli oggetti del db e viene classificato con il
            codice oggetto
            
            GESTIRE LE ESPORTAZIONI
            Il tipo di oggetto, si riferisce al progetto di esportazione degli oggetti di gestione delle tabelle, query, form ecc
            del database corrente.
            Per gestire i collegamenti e le esportazioni occorrono i seguenti oggetti:

            Elenco oggetti da esportare

            @MSys.progetto
            @progetto.esporta.@MSys
            @tutte.le.tabelle.db.@MSys
            @db.tutte.le.tabelle.@MSys
            @db.tabelle.tutte.@MSys

    	QUERY ****
        X = todo: da sistemare
            MSys_QUERY**
                 Note
                    Tabella di salvataggio di tutte le query
                    @progetto.esporta.@MSys
                    @tutte.le.query.db
                    @db.tutte.le.query
                    @db.query.tutte
                        faq:
                            dove vengono salvata tutte le tabelle del db?
                            tutte le tabelle del db

    	TABELLE ***
            Msys_DF11_PROGETTI

                 Note
                    Tabella base che serve a gestire tutti i PROGETTI MDB insieme a quello principale degli OGGETTI SI SISTEMA 
                    identificati dal codice MSys.
                    Questa tabella funge da master per altre due sottotabelle:
                        
                        Msys_DF11_PROGETTI  --> Msys_DF12_GE_ObjProgetti --> MSys_ELENCO_ObjProgetti

                        @tutte.le.tabelle.db.@MSys
                        @MSys.tabelle


# REVISIONI ED AGGIORNAMENTI PROGETTO IMPEGNI
### CODICE FORM IMPEGNI ---> Tb01FrmS99
    Note
        con questo codice estraggo tutti gli oggetti per il funzionamento della form master GESTIONE DEGLI IMPEGNI 

        La form ha un tab controll di 12 pagine 

### 2024.12.31_RIDENOMINAZIONE = PROGETTO NUOVO
		Creato un nuovo progetto in cui ho ridenominato tutti gli oggetti
		per la gestione degli impegni in modo che possono essere filtrati
		con il codice generale ---> LLPP_IMPEGNI_Tb01

		TABELLA OGGETTI E SUOI OGGETTI
			Per gestire gli oggetti degli impegni IN MOODO ORDINATO	 e viene creata la tabella oggetti  per gestire le query, le form, i report ecc.. CHE sono estratti in base al codice generale:

				codice---> 01_OGGETTI

			
			1) creo la tabella
				LLPP_IMPEGNI_Tb01_OGGETTI

			2) creo la query
				LLPP_IMPEGNI_Tb01Qry_01_OGGETTI
			3) creo la FORM MASTER E DETAIL
				LLPP_IMPEGNI_Tb01Frm01_M01_GEST_OGGETTI
				LLPP_IMPEGNI_Tb01Frm01_S01_OGGETTI



		FORM MASTER RICREATA
			
			LLPP_IMPEGNI_Tb01FrmS01_12_GRUPPO_IMPEGNI_ANNO *** DA FARE ***

### 2025.01.22_FORM=S99_UTILITA_IMPORTA_OGGETTI + FORM MASTER GESTIONE_IMPEGNI
	   Note
        le modifiche sulla form LLPP_IMPEGNI_Tb01FrmS99_UTILITA_IMPORTA_OGGETTI
            codice form ---> Tb01FrmS99
    FORM S99_UTILITA
		sono stati bloccati nel pagina e nell'evento ora non vengono piu sovrapposti.
		le pagine del tab control hanno l'evento change
        + UTILITA = Impostato pagina 10 con le utilita per gli impegni 

### 2025.01.29= CREATO GLI EVENTI DEL TAB CONTROLL PER SCRIVERE SUL LABEL PRINCIPALE IL NOME DELLE PAGINE

    FORM MASTER IMPEGNI 

                 

        TAB_CONTROL 
            Automazione titolo 
                sulla form master impegni ho centralizzato tutto il tab control principale in quanto si possono creare 12 pagine con il l'automazione della pagina in cui siamo allocati.
                + creato 12 pagine 


            

        PAG_10
            alla pagina 10 gestisco l'analisi, creati questi comandi:
            @CREATO@BUTTON = APRI LATEX WEB  
            @CREATO@BUTTON = APRI REPOSITORY 
            @CREATO@BUTTON = APRI CARTELLA IMPEGNI 
                apro solo la cartella dove sono allocati i progetti impegni
            @CREATO@BUTTON = APRI ANALISI .MD 
                Apro l'analasi README_IMPEGNI.MDB





	






### 2025.02.22_FORM=CODICE_17 CREATO FORM CUP E CIG
LLPP_IMPEGNI_Tb01FrmS01_17_CUP

    CODICE: 17-0

    01_FORM
        LLPP_IMPEGNI_Tb01Frm17_}---------------------------------------@
        LLPP_IMPEGNI_Tb01Frm17-00_M01_GE_CUP
            Note
                questa è la form generale di gestione dei CUP
                non ha query base.

    02_FORM
        LLPP_IMPEGNI_Tb01Frm17-01_S01_GROUPxANNO_CUP
            Note
                Creo la form che visualizza i CUP RAGGRUPPATI PER ANNO

            QUERY 
                LLPP_IMPEGNI_Tb01Qry02_17-01_CUP_GROUPxANNO
                    creo la query CUP PER ANNO solo il campo cup>0
    03_FORM
        LLPP_IMPEGNI_Tb01Frm17-02_S01_CUP
            Note
                questa form estrae tutti i cup o

            QUERY 
                LLPP_IMPEGNI_Tb01Qry02_17-02_CUP
                    creato query di raggruppamento CUP per anno >0
                
    

    DA_CARICARE:
        FORM
            LLPP_IMPEGNI_Tb01Frm17_}---------------------------------------@
            LLPP_IMPEGNI_Tb01Frm17-00_M01_GE_CUP
            LLPP_IMPEGNI_Tb01Frm17-01_S01_GROUPxANNO_CUP
            LLPP_IMPEGNI_Tb01Frm17-02_S01_CUP
        QUERY
            LLPP_IMPEGNI_Tb01Qry02_17-01_CUP_GROUPxANNO
            LLPP_IMPEGNI_Tb01Qry02_17-02_CUP


    FORM_ADATABILE


                ho una form master chiamata AA_PROVA e contiene un oggetto sotto form 
                chiamato Pag_01 per ora la proprieta larghezza fissa è di 35,741cm, vorrei 
                creare procedura in VBA che imposti prima di caricare in modo visibile la form
                master che imposti la larghezza fissa a 20 cm si puo fare?


                La struttura della form AA_PROVA è questa:

                
                        |                   = name: AA_PROVA
                Maschera principale         = larghezza di 36,395cm
                    |
                    | Corpo maschera        = altezza 18,582cm
                        |
                        |                   = name: TabCtl1
                        | Tab controll      = larghezza 17,011cm
                            |               = altezza   17,011cm
                            |
                            |
                            |               = name: Pag_01, ... Pag_12
                            Pagine 1-12     = larghezza 17,011cm
                                |           = altezza   17,011cm
                                |
                                |
                                |           = name: Sottoform_01, ... Sottoform_12
                                Le 12 sottoform
                                    12 pagine del tab control che contengono 
                                    12 sottoform    = larghezza 15cm
                                                    = altezza   13

                RIDUZIONE DAL PIU INTERNO AL PIU ESTERNO
                Quando RIDUCO le dimensione di tutto gli oggetti devo seguire questo schema:
                    01) riduco altezza e larghezza dei 12 oggetti Sottoform_01 ... Sottoform_12;
                    02) riduco altezza e larghezza delle 12 pagine Pag_01... Pag_12 ;
                    03) riduco altezza e larghezza del Tab control denominato TabCtl1
                    04) riduco l'altezza del corpo maschera
                    05) riduco la larghezza della form principale AA_PROVA.


                Queste riduzioni servono per rendere visibile sul video l'intera form e quindi in modo adattabile
                senza utilizzare le barre

    
LLPP_IMPEGNI_Tb01FrmS01_18-01_CIG
    QUERY 
        LLPP_IMPEGNI_Tb01Qry02_17_CIG











Crea una funzione di supporto simile a questa che viene utilizzata per il tab controll oppure
adattala per le pagine del tab control:
...
Call ModificaTabControl(frm, 17, 17)      ' Tab Control a 17x17 cm

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
