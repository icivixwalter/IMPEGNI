QUERY_CASELLA_DI_TESTO_FILTRO_IMPEGNI.MD
	
	Note
		Query costruita per il filtro degli impegni attivata sulla casella di 
		testo: FILTRO_ELENCO_INPEGNI_TXT
		CODICE -----> @QUERY@CASELLA@DI@TESTO@FILTRO_(schema di query della casella di testo FILTRO_ELENCO_INPEGNI_TXT)


SELECT 
	'Tutti gli impegni-> LLPP_IMPEGNI_Qry01_19_ELENCO_IMPEGNI_COD_PRAT'   AS TXTQuery, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.* ,
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.AnnoAtto_i                       AS ANNO, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.CodPratica_s                     AS CODICE_PRAT, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NroPratica_i                     AS NRO_PRAT, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.TipoAtto_s                       AS TIPO_ATTO, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NroAtto_lng                      AS NRO_ATTO, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.DataAtto_d                       AS DATA, 
	Len([OggettoAtto_m])                                               AS LUNGHEZZA_m, 
	Len([OggettoAtto_s])                                               AS LUNGHEZZA_255, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.OggettoAtto_m                    AS OGGETTO_ATTO, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NoteAtto_s                       AS NOTE_ATTO, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.FileAtto_s                       AS FILE_ATTO, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.PathFileAtto_s                   AS PATH, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.Lavorato_s                       AS LAVORATO, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NoteBrevi_ATTI_DI_IMPEGNO_s          AS NOTE_BREVI_IMP, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.CLASS_ATTI_DI_IMPEGNO_s            AS CLASS_ATTI, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.CIG_CODICE_s                     AS CIG, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.CUP_CODICE_s                     AS CUP, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.NoteCIG_s                        AS NOTE_CIG, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.ALB_b                            AS ALB, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.TRASP_b                          AS TRASP, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.CF_s                             AS CF, 
	LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO.PIVA_s                           AS PIVA, 
	[CLASS_ATTI] & '-' & [FILE_ATTO] & '- ' & [CODICE_PRAT] & ' - ' & [NRO_PRAT] & ' -> ' & [NoteAtto_s] & ' - ' & [NoteEx_m] AS TXTSTAMPA_ELENCO 
	FROM LLPP_IMPEGNI_Tb01_ATTI_DI_IMPEGNO 
	WHERE ((([NroAtto_lng] & '|' & [NroPratica_i] & '|' & [AnnoAtto_i]  & '|' & [FileAtto_s]  & '|' &  [CIG_CODICE_s] & '|' &  [CUP_CODICE_s] & '|' &  [IDGestione]) 
	Like '*4128*' ));
	
	
