# LE_TABELLE_COLLEGATE:
	Solo le tabelle 
		queste sono le tabelle che vengono collegate nella form servizi DA @IMPORTARE.
			@TABELLE@COLLEGATE_(DA @IMPORTARE PER IL FUNZIONAMENTO DEL PROGETTO IMPEGNI)

		 
             '//@IMPEGNI@TABELLE@UTILITA_(LA @collection DELLE @TABELLE relative agli impegni)
            Case "IMPORTA_OGGETTI_IMPEGNI"
                
                objectTables.Add "LLPP_ATTI_Tb01_{@=============================================@}"
                objectTables.Add "LLPP_ATTI_Tb01_Gestione"
                objectTables.Add "LLPP_ATTI_Tb02_{@====================================@}_ALLEGATI"
                objectTables.Add "LLPP_ATTI_Tb02_Allegati"
                objectTables.Add "LLPP_IMPEGNI_DF02_{@===============================@}_VOCE_ATTI"
                objectTables.Add "LLPP_IMPEGNI_DF02_{@==========================================@}"
                objectTables.Add "LLPP_IMPEGNI_DF02_}--------------------------------------------@"
                objectTables.Add "LLPP_IMPEGNI_DF02_VOCE_ATTI_IMPEGNO"
                objectTables.Add "LLPP_IMPEGNI_DF02_VOCE_ATTI_IMPEGNO_TMP"
                objectTables.Add "LLPP_IMPEGNI_TB01_{@==========================================@}"
                objectTables.Add "LLPP_IMPEGNI_TB01_}--------------------------------------------@"
                objectTables.Add "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO"
                objectTables.Add "LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO_TMP"
                objectTables.Add "LLPP_IMPEGNI_Tb02_{@==========================================@}"
                objectTables.Add "LLPP_IMPEGNI_Tb02_}--------------------------------------------@"
                objectTables.Add "LLPP_IMPEGNI_Tb02_ELENCO_DI_SPESA"
                objectTables.Add "MSys_DF02_}----------------------------------------------------@"
                objectTables.Add "MSys_DF02_TIPO_OGGETTO"
                objectTables.Add "MSys_DF11_}----------------------------------------------------@"
                objectTables.Add "Msys_DF11_PROGETTI"
                objectTables.Add "MSys_T_}-------------------------------------------------------@"
                objectTables.Add "MSys_TABELLE"
                objectTables.Add "PROGETTI_MSYS_{@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@}_Tab"
                objectTables.Add "PROGETTI_Msys_TB01_}-------------------------------------------@"
                objectTables.Add "PROGETTI_Msys_TB01_PROJECT"
                objectTables.Add "PROGETTI_Msys_TB01_PROJECT_TMP"
                objectTables.Add "PROGETTI_Msys_TB02_}-------------------------------------------@"
                objectTables.Add "PROGETTI_Msys_TB02_TIPO_OGGETTI"
                objectTables.Add "PROGETTI_Msys_TB03_}-------------------------------------------@"
                objectTables.Add "PROGETTI_Msys_TB03_ELENCO_ObjProgetti"
                
              

## TabelleCollegate+PATH
	Le Tabelle Collegate e le path:
			Queste le sono le tabelle collegate unitamente alla path di collegamento per quanto riguarda gli impegni.

		LLPP_ATTI_Tb01_{@=============================================@}
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\LLPP_ATTI_Tb01_GESTIONE.mdb
		LLPP_ATTI_Tb01_Gestione
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\LLPP_ATTI_Tb01_GESTIONE.mdb
		LLPP_ATTI_Tb02_{@====================================@}_ALLEGATI
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\LLPP_ATTI_Tb02_ALLEGATI.mdb
		LLPP_ATTI_Tb02_Allegati
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\LLPP_ATTI_Tb02_ALLEGATI.mdb
		LLPP_IMPEGNI_DF02_{@===============================@}_VOCE_ATTI
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI_DI_SPESA\MDB\LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.mdb
		LLPP_IMPEGNI_DF02_{@==========================================@}
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI_DI_SPESA\MDB\LLPP_IMPEGNI_DF02_ATTI_DI_IMPEGNO.mdb
		LLPP_IMPEGNI_DF02_}--------------------------------------------@
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI_DI_SPESA\MDB\LLPP_IMPEGNI_DF02_ATTI_DI_IMPEGNO.mdb
		LLPP_IMPEGNI_DF02_VOCE_ATTI_IMPEGNO
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI_DI_SPESA\MDB\LLPP_IMPEGNI_DF02_ATTI_DI_IMPEGNO.mdb
		LLPP_IMPEGNI_DF02_VOCE_ATTI_IMPEGNO_TMP
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI_DI_SPESA\MDB\LLPP_IMPEGNI_DF02_ATTI_DI_IMPEGNO.mdb
		LLPP_IMPEGNI_TB01_{@==========================================@}
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI_DI_SPESA\MDB\LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.mdb
		LLPP_IMPEGNI_TB01_}--------------------------------------------@
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI_DI_SPESA\MDB\LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.mdb
		LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI_DI_SPESA\MDB\LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.mdb
		LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO_TMP
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI_DI_SPESA\MDB\LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.mdb
		LLPP_IMPEGNI_Tb02_{@==========================================@}
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI_DI_SPESA\MDB\LLPP_IMPEGNI_Tb02_ELENCO_DI_SPESA.mdb
		LLPP_IMPEGNI_Tb02_}--------------------------------------------@
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI_DI_SPESA\MDB\LLPP_IMPEGNI_Tb02_ELENCO_DI_SPESA.mdb
		LLPP_IMPEGNI_Tb02_ELENCO_DI_SPESA
	                	--> ;DATABASE=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI_DI_SPESA\MDB\LLPP_IMPEGNI_Tb02_ELENCO_DI_SPESA.mdb
		MSys_DF02_}----------------------------------------------------@
	                	--> ;DATABASE=c:\CASA\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_DF02.mdb
		MSys_DF02_TIPO_OGGETTO
	                	--> ;DATABASE=c:\CASA\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_DF02.mdb
		MSys_DF11_}----------------------------------------------------@
	                	--> ;DATABASE=c:\Casa\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_DF11.mdb
		Msys_DF11_PROGETTI
	                	--> ;DATABASE=c:\Casa\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_DF11.mdb
		MSys_T_}-------------------------------------------------------@
	                	--> ;DATABASE=c:\CASA\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_TABELLE.mdb
		MSys_TABELLE
	                	--> ;DATABASE=c:\CASA\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_TABELLE.mdb
		PROGETTI_MSYS_{@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@}_Tab
	                	--> ;DATABASE=C:\CASA\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_PROGETTI.mdb
		PROGETTI_Msys_TB01_}-------------------------------------------@
	                	--> ;DATABASE=C:\CASA\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_PROGETTI.mdb
		PROGETTI_Msys_TB01_PROJECT
	                	--> ;DATABASE=C:\CASA\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_PROGETTI.mdb
		PROGETTI_Msys_TB01_PROJECT_TMP
	                	--> ;DATABASE=C:\CASA\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_PROGETTI.mdb
		PROGETTI_Msys_TB02_}-------------------------------------------@
	                	--> ;DATABASE=C:\CASA\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_PROGETTI.mdb
		PROGETTI_Msys_TB02_TIPO_OGGETTI
	                	--> ;DATABASE=C:\CASA\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_PROGETTI.mdb
		PROGETTI_Msys_TB03_}-------------------------------------------@
	                	--> ;DATABASE=C:\CASA\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_PROGETTI.mdb
		PROGETTI_Msys_TB03_ELENCO_ObjProgetti
	                	--> ;DATABASE=C:\CASA\LINGUAGGI\ACCESS\PROGETTI_MDB\MSYS_OGGETTI\MSYS\MDB\MSys_PROGETTI.mdb
