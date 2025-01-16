ECHO OFF

@REM  cd.. devi posizionarti su git_desktop
@REM imposto la variabile path:
SET PATH_S=c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI\


@CD %PATH_S%
@dir /W

@ECHO  CANCELLO I DATI
@ECHO  .......................................................
@ECHO  .
@ECHO  .
@ECHO  .

@DIR MDB

 
	@REM  elimina una directory (RMDIR) + le sottodirectory (/S) senza conferma (/Q)
	rmdir /s /q "c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI\MDB"



@DIR OBJECT

	@REM  elimina una directory (RMDIR) + le sottodirectory (/S) senza conferma (/Q)
	rmdir /s /q "c:\GESTIONI\GESTIONE_LLPP\25_GESTIONE_LLPP\LLPP_ARCHIVI_MDB\IMPEGNI\OBJECT"

@REM aggiorno git
	git status
	git add .
	git commit -m "cancellato directory MDB+OBJECT"
	

@ECHO  .
@ECHO  .
@ECHO  .......................................................



@REM 01)
@REM sospensione con crononometro 
@REM ---->	timeout /t 2 /nobreak > NUL
@REM ---->
@ECHO
@ECHO
@ECHO  pausa  per consentire il commit
@ECHO
@TIMEOUT /T 2 /NOBREAK

