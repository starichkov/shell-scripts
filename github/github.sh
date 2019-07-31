#!/bin/bash

function usage() {
    echo "Usage: github.sh [GitHub user login]"
}

echo "Welcome to my GitHub user repositories cloning script!"
usage

GITHUB_USER=$1
GITHUB_LIST='github.list'
GITHUB_JSON='github.json'

if [ ! -f "$GITHUB_LIST" ]; then

    touch $GITHUB_LIST
    PAGE=1
    PER_PAGE=100

    while :
    do
      echo "Loading $PER_PAGE repositories from page #$PAGE..."

      curl -i "https://api.github.com/users/$GITHUB_USER/repos?page=$PAGE&per_page=$PER_PAGE" > $GITHUB_JSON

      DATA="$(grep \"clone_url\" $GITHUB_JSON | cut -c 19- | sed 's/.\{2\}$//')"

      if [ -z "$DATA" ]
        then
          break
        else
          echo $DATA | tr " " "\n" >> $GITHUB_LIST
          PAGE=$((PAGE+1))
      fi
    done
    echo "$FILE does not exist"
fi

while read rep; do
    echo "Clonning $rep"
    #git clone $rep
done <$GITHUB_LIST

if [ -f "$GITHUB_JSON" ]; then
    rm $GITHUB_JSON
fi

