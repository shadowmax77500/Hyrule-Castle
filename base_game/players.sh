#!/bin/bash

choose=$((RANDOM % 100))
while IFS=',' read -r id name hp mp str int def res spd luck race class rare; do
     
    echo $chosse
    if [[ $choose -ge 1 ]] && [[ $choose -le 50 ]] && [[ $rare -eq 1 ]]; then 
	rarity=1
	number=$(($number+1))
    elif [[ $choose -ge 51 ]] && [[ $choose -le 80 ]] && [[ $rare -eq 2 ]]; then
        rarity=2
	number=$(($number+1))
    elif [[ $choose -ge 81 ]] && [[ $choose -le 95 ]] && [[ $rare -eq 3 ]]; then
	rarity=3
	number=$(($number+1))
    elif [[ $choose -ge 96 ]] && [[ $choose -le 99 ]] && [[ $rare -eq 4 ]]; then
	rarity=4
	number=$(($number+1))
    elif [[ $choose -eq 100 ]] && [[ $rare -eq 5 ]]; then
	rarity=5
	number=$(($number+1))
    fi
done < players.csv
choose=$((1 + RANDOM % $number))
number=-1
while IFS=',' read -r id name hp mp str int def res spd luck race class rare; do
    if [[ $rare -eq $rarity ]] ; then
	number=$(($number+1))
	if [[ $number -eq $choose ]]; then
	    NAME=$name
	    HPMAX=$hp
	    HP=$hp
	    MP=$mp
	    STR=$str
	    INT=$int
	    DEF=$def
	    RES=$res
	    SPD=$spd
	    LUCK=$luck
	    RACE=$race
	    CLASS=$class
	    SG=$(($HPMAX/2))
	fi
    fi
done < players.csv
