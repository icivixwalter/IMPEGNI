

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


# REVISIONI ED AGGIORNAMENTI
### CODICE ---> Tb01FrmS99
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

	FORM MASTER IMPEGNI 
		sulla form master impegni ho centralizzato tutto il tab control principale in 
		quanto si possono creare 12 pagine con il l'automazione della pagina in cui 
        siamo allocati.
            creato la PAGINA 10 
            in cui gestisco l'analisi
            @CREATO@BUTTON = APRI CARTELLA IMPEGNI 
                apro solo la cartella dove sono allocati i progetti impegni
            @CREATO@BUTTON = APRI FILE .MD 
                Apro l'analasi README_IMPGNI.MDB





	

