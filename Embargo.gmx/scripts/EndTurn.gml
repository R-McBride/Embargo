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
    
    //APPLY INCOMES
    global.CAPITAL[i] += global.ICAPITAL[i]
    global.POWER[i] += global.IPOWER[i]
}

//Influence Spread
InfluenceSpread()