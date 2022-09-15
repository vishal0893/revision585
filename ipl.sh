echo "please enter favorite team in IPL 2022"
echo "hint : GT RR CSK"
read teamname
declare -A cskteam

matchesplayed=14
won=0
lost=0
nrr=""
points=0
rcbteam=("maxwell" "siraj" "virat" "Abd")
miteam=("bumrah" "pollard" "ishant" "rohit")
cskteam[bat]="duplessis"
cskteam[bowl]="bravo"
cskteam[allrounder]="jadeja"
cskteam[captain]="dhoni"

if[ $teamname=="rcb"]
then
position=4
elif[ $teamname=="mi"]
then
position=10
elif[ $teamname=="csk"]
then
position=9
else
echo "please check your team, it is invalid format..."
fi

function rolesbyplayer(){
echo "$1 is a $3 of $2"
}

function categoriesbyteam() {

case $1 in
RCB)
      for player in ${rcbteam[@]}
      do
          if [ $player == "Abd"]
           then
             rolesbyplayer $player $1 "batsman"
           elif [ $player == "maxwell"]
            then
             rolesbyplayer $player $1 "allrounder"
           elif [ $player == " virat"]
            then
             rolesbyplayer $player $1 "captain"
            else
             rolesbyplayer $player $1 "bowler"
            fi
       done
;;
MI)
for player in ${miteam[@]}
      do
          if [ $player == "ishant"]
           then
             rolesbyplayer $player $1 "batsman"
           elif [ $player == "pollard"]
            then
             rolesbyplayer $player $1 "allrounder"
           elif [ $player == " rohit"]
            then
             rolesbyplayer $player $1 "captain"
            else
             rolesbyplayer $player $1 "bowler"
            fi
       done
;;
CSK)
for player in ${cskteam[@]}
      do
          if [ $player == "duplessis"]
           then
             rolesbyplayer $player $1 "batsman"
           elif [ $player == "jadeja"]
            then
             rolesbyplayer $player $1 "allrounder"
           elif [ $player == " dhoni"]
            then
             rolesbyplayer $player $1 "captain"
            else
             rolesbyplayer $player $1 "bowler"
            fi
       done
;;
*)
echo "invalid output"

;;
esac
}
function playoffs() {
if [$1 -le 4]
then 
echo "$2 is eligible for playoffs"
else
echo "$2 not eligible for playoffs"
fi
}
function pointscalculator() {
$1 //win
$2 //runrate
$3 //position
lost=$((matchesplayed-$1))
points=$(($1*2))
echo "user selected team is $teamname"
echo "match played : $matchesplayed"
echo "place secured : $3"
echo "won : $1 and lost : $lost"
echo "runrate : $2"
echo "points : $points"
playoffs $3 $teamname
catagoriesbyteam $teamname
}
case $position in
10)
   won=4
   nrr="-0.506"
    ;;
9)
   won=4
   nrr="-0.203"
    ;;
4)
   won=8
   nrr="-0.253"
    ;;
*)
   echo ""
    ;;
esac
