"# IMPEGNI" 

	ALLINEO LA DIRECTORY LOCALE CON LA REPOSITORY DI GIT 

			Cosa fanno questi comandi:
				git fetch origin
			Aggiorna il repository locale con le ultime informazioni dal remoto (senza modificare i file locali).
			
				git reset --hard origin/calcolo
			Sovrascrive completamente i file locali con quelli della branch remota calcolo, portando la tua directory locale allo stato esatto del repository su GitHub.


				Per allinare gli archivi di GitHub con la repository locale applicare
				i due comandi:

					@REM Aggiorna le informazioni dal remoto
					git fetch origin	
					
					@REM Sovrascrive completamente i file locali con quella dalla branch remota
					git reset --hard origin/calcolo

					@REM Verifica che la directory locale sia ora identica al repository remoto 
					git status

