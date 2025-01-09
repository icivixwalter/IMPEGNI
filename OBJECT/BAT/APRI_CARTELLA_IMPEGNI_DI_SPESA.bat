:________________________APRO LA CARTELLA PRINCIPALE 
GOTO:MEMO
	NOTA PER L'UTILIZZO DI START
		Nel caso di apertura in successione utilizzare START
			es. Start "... nome" path &^exit
				utilizzare il comando * &^exit * intervallato da uno spazio per ogni comando start
				Non è necessario utilizzare l'opzione /B LA QUALE VIENE UTILIZZATA PER NON DUPLICARE IL PROCESSO
				altrimenti il cmd rimane aperto.
				Non è necessario utilizzare il comando CALL
					esempi:
						1) start "Apro IL DB 1" "c:\casa\file.mdb" &^exit 
						2) start "Apro IL DB collegato lnk" "c:\casa\file.lnk" &^exit 
						3) start "Apro la directory" "c:\casa\" &^exit 
:MEMO
::=============================================================================================================================

@ECHO OFF

@REM directory di salvataggio:
@SET PATH_s=..\





:------------------------------------APRO LA CARTELLA PRINCIPALE 
start "Apro la cartella MODELLO" /B "%PATH_s%" &^exit

