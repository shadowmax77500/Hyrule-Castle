
#!/bin/bash

interface (){
    clear
echo "=================================================================="
echo "========================== FLOOR $floor =============================="
echo "$NAMEm"
echo "HP = $HPm / $HPMAXm "
echo
echo " $NAME"
echo "HP = $HP / $HPMAX "
echo
echo "-------Option---------"
echo "1. Attack     2. Heal"
echo
}

start () {

interface
echo "$NAMEm viens d'apparaitre "
read
while [[ $HP -gt 0 ]] && [[ $HPm -gt 0 ]]; do
    conf=0
    interface
    read act
    act=${act,,}
    while [[ $conf == 0 ]]; do
	if [[ $act == "attack" ]] || [[ $act == 1 ]]; then
	    HPm=$(($HPm-$STR))
	    conf=1
	    interface
	    echo "vous attaquez et infliger $STR point de domages."
	    echo 
	    echo "====Press enter to continue====="
	    read
	elif [[ $act == "heal" ]] || [[ $act == 2 ]]; then
	    echo "hp : $HP sg: $SG"
	    HP=$(($HP+$SG))
	    echo "hp: $HP"
	    conf=1
	    if [[ $HP -gt $HPMAX ]]; then
		HP=$HPMAX
		
	    fi
	    interface
	    echo "vous recuperer la moitier de votre vie"
	    echo
	    echo "====Press enter to continue====="
	    read
	else
	    interface
	    echo "entré un instruction corecte ..."
	    read act
	    act=${act,,}

	fi
    done
    if [[ $HPm -gt 0 ]]; then
	interface
	echo "$NAMEm vous attaques"
	echo
	HP=$(($HP-$STRm))
	echo "Vous perdé $STRm HP"
	echo
	echo "====Press enter to continue====="
	read
    fi
done

if [[ $HPm -le 0 ]]; then
    interface
    floor=$(($floor+1))
    echo "Vous avez vaincu $NAMEm"
    echo
    echo "Vous monté a l'etage $floor."
    echo
    echo "====Press enter to continue====="
    read
elif [[ $HP -le 0 ]]; then
    floor=0
fi
}
start
