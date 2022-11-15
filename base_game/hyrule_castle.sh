#!/bin/bash



floor=1
act=0

source players.sh
clear
echo "============================================================================================="
echo "$NAME est devant la tours pour le combat final"
echo "============================================================================================="
read
while [[ $floor -gt 0 ]] && [[ $floor -lt 10 ]]; do
    source enemies.sh
    source Fight.sh
done

if [[ $floor == 10 ]]; then
    source bosses.sh
    source FightBoss.sh
else
    echo "vous avez perdu"
fi

