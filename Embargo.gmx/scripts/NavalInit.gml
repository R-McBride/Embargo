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
spaceHealth = 1
image = 0
break
case 1: //Ability


break
case 2: //Tooltip


break
case 3: //Production
cost = 2
type = 'scout'
break
}

#define shipFrigate
switch (argument0){
case 0: //Initialize
unitSpeed = 2
canBlockade = true
spacePower = 3
spaceHealth = 3
image = 0
break
case 1: //Ability


break
case 2: //Tooltip


break
case 3: //Tooltip
cost = 3
type = 'frigate'
break
}

#define shipCruiser
switch (argument0){
case 0: //Initialize
unitSpeed = 2
canBlockade = true
spacePower = 8
spaceHealth = 8
image = 1
break
case 1: //Ability


break
case 2: //Tooltip


break
case 3: //Tooltip
cost = 5
type = 'cruiser'
break
}

#define shipBattleship
switch (argument0){
case 0: //Initialize
unitSpeed = 2
canBlockade = true
spacePower = 20
spacePower = 20
image = 2
break
case 1: //Ability


break
case 2: //Tooltip


break
case 3: //Tooltip
cost = 9
type = 'battleship'
break
}
