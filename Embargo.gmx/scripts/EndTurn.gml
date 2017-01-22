#define EndTurn
global.PLAYER += 1
global.selectedNode = noone
global.selectedFleet = noone
global.selectedUnit = noone

if global.PLAYER > global.NUM_PLAYERS 
{
    global.PLAYER = 1
    global.TURN += 1
    
    StartTurn()
}

#define StartTurn
//Player Specifics
for(i = 1; i <= global.NUM_PLAYERS; i++)
{
    //RECALC INCOMES
    Income(i)
    
    //APPLY INCOMES
    global.CAPITAL[i] += global.ICAPITAL[i]
    global.POWER[i] += global.IPOWER[i]
}

//Influence Spread
InfluenceSpread()

//Growth
Growth()

//Refresh all move values
MovementRefresh()

#define Income
var p = argument0

global.ICAPITAL[p] = 0
global.ICAPITAL_NODE[p] = 0
global.ICAPITAL_POP[p] = 0

global.IPOWER[p] = 0
global.IPOWER_NODE[p] = 0
global.IPOWER_POP[p] = 0

with(Node){
    if currentPop != 0{
    if population[p] > 0{
    global.ICAPITAL_POP[p] += population[p]*0.1
    global.IPOWER_POP[p] += population[p]*0.1
    
    global.ICAPITAL_NODE[p] += (population[p]/currentPop)*resources[2]
    global.IPOWER_NODE[p] += (population[p]/currentPop)*resources[3]
    }
    }
}

//Final Incomes
global.ICAPITAL[p] = global.ICAPITAL_NODE[p]+global.ICAPITAL_POP[p]+2
global.IPOWER[p] = global.IPOWER_NODE[p]+global.IPOWER_POP[p]+2
#define MovementRefresh
with (Fleet){
    for (var i = 0; i<ds_list_size(ships);i++){
        temp = ds_list_find_value(ships, i)
        temp.movesLeft = temp.unitSpeed
    }
    canMove = true
}
