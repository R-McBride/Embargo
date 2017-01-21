connections[global.NUM_PLANETS] = 0
numConnections = 0
group = 0

type = floor(random(global.NUM_NODE_TYPES)) 

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



    if(type<NODE_TYPES.PLANET){
            resources[0] += 2
            resources[1] += 1
            population[0] += resources[0]*3 
            }
    else if(type<NODE_TYPES.ASTEROID_BELT){
            resources[1] += 2
            resources[2] += 1
            }
    else if(type<NODE_TYPES.OCEAN){
            resources[0] += 3
            }
    else if(type<NODE_TYPES.NEBULA){
            resources[4] += 2
            }  
    else if(type<NODE_TYPES.BLACK_HOLE){
            resources[3] += 1
            resources[4] += 1
            }      


