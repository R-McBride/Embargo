#define NavalInit
/*switch (argument0){
    case(NAVAL_TYPE.SCOUT):
        unitSpeed = 3
        canBlockade = false
        spacePower = 1
        break
    case(NAVAL_TYPE.FRIGATE):
        unitSpeed = 2
        canBlockade = true
        spacePower = 2
        break
    case(NAVAL_TYPE.CRUISER):
        unitSpeed = 2
        canBlockade = true
        spacePower = 3
        break
    case(NAVAL_TYPE.BATTLESHIP):
        unitSpeed = 2
        canBlockade = true
        spacePower = 4
        break
}*/



#define shipScout
switch (argument0){
case 0: //Initialize
unitSpeed = 3
canBlockade = false
spacePower = 1
image = 1
break
case 1: //Ability


break
case 2: //Tooltip


break
case 3: //Production
cost = 2

break
}

#define shipFrigate
switch (argument0){
case 0: //Initialize
unitSpeed = 2
canBlockade = true
spacePower = 3
image = 1
break
case 1: //Ability


break
case 2: //Tooltip


break
case 3: //Tooltip
cost = 3

break
}

#define shipCruiser
switch (argument0){
case 0: //Initialize
unitSpeed = 2
canBlockade = true
spacePower = 8
image = 2
break
case 1: //Ability


break
case 2: //Tooltip


break
case 3: //Tooltip
cost = 5

break
}

#define shipBattleship
switch (argument0){
case 0: //Initialize
unitSpeed = 2
canBlockade = true
spacePower = 20
image = 3
break
case 1: //Ability


break
case 2: //Tooltip


break
case 3: //Tooltip
cost = 9

break
}
