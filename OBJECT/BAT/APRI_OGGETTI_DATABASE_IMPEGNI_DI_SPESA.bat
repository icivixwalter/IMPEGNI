




@REM directory di salvataggio:
@SET PATH_s=..\IMPEGNI_DI_SPESA_LATEX_ANALISI\
@SET FILE_s=IMPEGNI_DI_SPESA_ANALISI_TEX.tex





:------------------------------------APRO LA CARTELLA PRINCIPALE 
start "Apro la cartella MODELLO" /B "%PATH_s%"



:------------------------------------APRO FILE TEX DI ANALISI
start "Apro file tex" /B "%PATH_s%%FILE_s%"&^exit





:________________________APRO LA CARTELLA PRINCIPALE 
start "Apro la cartella cup" /B "c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHVI_MDB\LLPP_GESTIONE\LPP_ANALISI\AA_MODELLO\" ^exit


:________________________APRO IL DB + LATEX
start "Apro IL DB" /B CALL "c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHVI_MDB\LLPP_GESTIONE\LPP_ANALISI\AA_MODELLO\MODELLO_GEST.mdb - collegamento.lnk" 

start "Apro IL DB" /B CALL "c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHVI_MDB\LLPP_GESTIONE\LPP_ANALISI\AA_MODELLO\MODELLO_N01_(Analisi).tex" 


EXIT









