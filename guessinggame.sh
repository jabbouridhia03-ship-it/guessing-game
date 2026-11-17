#!/usr/bin/env bash
# File: guessinggame.sh

function get_file_count {
    local count
    count=$(find . -maxdepth 1 -type f | wc -l)
    echo "$count"
}

function play_game {
    local target
    target=$(get_file_count)
    local guess=-1

    echo "Veuillez deviner le nombre de fichiers dans le répertoire actuel :"

    while [[ $guess -ne $target ]]; do
        read -p "Entrez votre estimation : " guess
        
        if [[ ! $guess =~ ^[0-9]+$ ]]; then
            echo "Veuillez entrer un nombre valide."
            continue
        fi

        if [[ $guess -lt $target ]]; then
            echo "Votre estimation est trop basse. Essayez à nouveau."
        elif [[ $guess -gt $target ]]; then
            echo "Votre estimation est trop haute. Essayez à nouveau."
        else
            echo "Félicitations ! Vous avez deviné le nombre correct de fichiers ($target)."
        fi
    done
}

play_game

