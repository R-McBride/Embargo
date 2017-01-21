connections[global.NUM_PLANETS] = 0
numConnections = 0
group = 0

sunColour = floor(random(4.5))

for (var i = 0; i < global.NUM_RESOURCE_TYPES; i++){
    if (random(global.RESOURCE_RARITY) > global.RESOURCE_RARITY - 1){
        resources[i] = true
    }
    else{
        resources[i] = false
    }
}

type = floor(random(global.NUM_NODE_TYPES)) 

population[0] = random(100000000)
