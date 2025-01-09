
PROGETTO_IMPENGI_MDB
        Note
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



    FORM_MASTER
        Note
            la form principale per la gestione degli impegni è la LLPP_IMPEGNI_Frm_M00_GESTIONE_IMPEGNI

        LLPP_IMPEGNI_Frm_M00_GESTIONE_IMPEGNI  
            Note
                Form master non ha query sottostanti ma solo sottoform.

            TAB_CONTROLL
                Note nel tab controll vengono visualizzate le seguenti form NELLE SEGUENTI
                PAGINE: GRUPPO_IMPEGNI_ANNO (01), GRUPPO IMPEGNI CLASSIFICAZIONE 02
                
                    pag_01: LLPP_IMPEGNI_Frm_S01_12_GRUPPO_IMPEGNI_ANNO
                    pag_02: LLPP_IMPEGNI_Frm_S01_13_GRUPPO_IMPEGNI_CLASSIFICAZIONE

    FORM_SECONDARIE
                !   
                    QUERY
                !
                !

        XMsys_DF11_PROGETTI_Frm02_S01_GROUPObj 
            Note
                2° sottoform che elenca gli oggetti appartenenti al progetto, QUERY, FORM, TABELLE ECC...
                Query_base  = Msys_DF11_PROGETTI_Qry01_11_GROUP_OGGETTI 
        
        XMSys_ELENCO_ObjProgetti_Frm_S01_Tutti 
            Note
                3° sottoform che elenca tutti gli oggetti che appartengono al progetto della form master
                Query_base  = MSys_ELENCO_ObjProgetti_Qry01_01_TUTTI





    QUERY
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

    

    
    TABELLE
            Msys_DF11_PROGETTI

                 Note
                    Tabella base che serve a gestire tutti i PROGETTI MDB insieme a quello principale degli OGGETTI SI SISTEMA 
                    identificati dal codice MSys.
                    Questa tabella funge da master per altre due sottotabelle:
                        
                        Msys_DF11_PROGETTI  --> Msys_DF12_GE_ObjProgetti --> MSys_ELENCO_ObjProgetti

                        @tutte.le.tabelle.db.@MSys
                        @MSys.tabelle

                    
