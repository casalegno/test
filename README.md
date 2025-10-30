# Test per SH

Questa cartella ed il relativo repository "test" è stata utilizzata per 
provare lo script sh `./tomaster.sh` che server per aggiornare i vari branch 
dei vari applicativi aggiornando il file `config.php` o `pfconfig.php` con la versione attuale del programma.

## Variabili
Inizialmente nello script dichiaro le variabili da utilizzare, partendo dai colori per evidenziare il testo
```sh
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
# Messaggio di avviso/interazione in giallo
echo -e "${YELLOW}Sto per eseguire git checkout master...${NC}"
# Messaggio di successo in verde
echo -e "${GREEN}Checkout master completato con successo.${NC}"
# Messaggio di errore in rosso
echo -e "${RED}Errore durante il merge!${NC}"
```
per arrivare al branch di default ed al server da utilizzare
```sh
DEFAULT_BRANCH="sviluppo"
DEFAULT_SERVER="192.168.30.9"
```

## GIT
Il programma si appoggia a GIT ed è pensato per funzionare solo sulla macchina 
192.168.30.9 ovvero portaletest.sigesgroup.it
Questo perchè la macchina deve essere una copia della macchina su emisfera.

### Checkout e Merge
La batch esegue un checkout al branch _'Master'_ e dopo averlo aggiornato
Esegue infatti due comandi in sequenza:
```sh
git fetch
git pull origin master
```
viene richiesto il nome del branch dal quale aggiornare
e lancia un merge dal branch selezionato: se non indicato utilizza _'sviluppo'_


### La versione
La versione di ogni applicazione viene registrata come valore
ANNO.MESE.GIORNO  con il comando 
```sh
VERSION="$(date +'%y.%m.%d')"
```
e stampata all'interno del file in una voce dell'array 
```php
[
	"version"=>"XX.XX.XX",
]
```

### Committo la config
E' necessario alla fine dell'aggiornamento della config eseguire una commit ed un push del file.
