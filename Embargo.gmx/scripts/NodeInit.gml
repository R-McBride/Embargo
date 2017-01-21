connections[global.NUM_PLANETS] = 0
numConnections = 0
group = 0

type = irandom(11)

population[0] = 0

sunColour = floor(random(4.5))

for (var i = 0; i < global.NUM_RESOURCE_TYPES; i++){
    if (random(global.RESOURCE_RARITY) > global.RESOURCE_RARITY - 1){
        resources[i] = 1
    }
    else{
        resources[i] = 0
    }
}

    if(type<5){
            resources[0] += 2
            resources[1] += 1
            population[0] += resources[0]*3
            type = NODE_TYPES.PLANET
            }
    else if(type<7){
            resources[1] += 2
            resources[2] += 1
            type = NODE_TYPES.ASTEROID_BELT
            }
    else if(type<9){
            resources[0] += 3
            type = NODE_TYPES.OCEAN
            }
    else if(type<10){
            resources[4] += 2
            type = NODE_TYPES.NEBULA
            }  
    else if(type<11){
            resources[3] += 1
            resources[4] += 1
            sunColour = 5
            type = NODE_TYPES.BLACK_HOLE
            }      


