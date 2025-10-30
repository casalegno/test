#!/bin/bash

YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Merge branch
echo -e "${YELLOW}Inserisci il nome del branch da unire in master: (${DEFAULT_BRANCH}) ${NC}"
read MERGE_BRANCH
# Se l'utente preme invio senza digitare, usa il valore di default
MERGE_BRANCH=${MERGE_BRANCH:-$DEFAULT_BRANCH}

#echo -e "${YELLOW}il risultato di git rev-parse"
#git rev-parse --verify $MERGE_BRANCH 2>/dev/null


if ! git rev-parse --verify $MERGE_BRANCH; then
    echo -e "${YELLOW}Il branch '$MERGE_BRANCH' non esiste${NC}"
    exit 1
fi




# Cerco il file config in uso nell'applicazione
[ -f config.php ] && CONFIG="config.php"
[ -f pfconfig.php ] && CONFIG="pfconfig.php"
echo -e "${YELLOW}Aggiorno il file ${CONFIG} con la versione $VERSION...${NC}"

sed -i "s/'version'[[:space:]]*=>[[:space:]]*'[^']*'/'version' => '24.01'/g" $CONFIG
