
@ECHO OFF



@REM directory di salvataggio:
@SET PATH_s=..\IMPEGNI_DI_SPESA_LATEX_ANALISI\
@SET FILE_s=IMPEGNI_DI_SPESA_ANALISI_TEX.tex





:------------------------------------APRO LA CARTELLA PRINCIPALE 
start "Apro la cartella MODELLO" /B "%PATH_s%"



:------------------------------------APRO FILE TEX DI ANALISI
start "Apro file tex" /B "%PATH_s%%FILE_s%"&^exit

