



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

    FORM_SECONDARIE ***
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






    

    

                    
