connections[global.NUM_PLANETS] = noone
numConnections = 0
group = 0
fleetSlots[3] = noone
numFleetsPresent = 0
difficult = false
name = choose('Gar','Farr','Hel','Pal','Tek')+
choose('','','','','','','','','','-')+
choose('gon','tal','ala','ian','ah')+' '+
choose('I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII')+
choose('','','','','','','','','','','','','a','a','b','c')
offset = random(2*pi)
type = 1+irandom(99)

planetSize = irandom(3)
currentPop = 0
partialPop = 0
maxPop = 0
population[global.NUM_PLAYERS] = 0
influence[global.NUM_PLAYERS] = 0
resistance = 1

sunColour = floor(random(4.5))

for (var i = 0; i < global.NUM_RESOURCE_TYPES; i++){
    if (random(global.RESOURCE_RARITY) > global.RESOURCE_RARITY - 1){
        resources[i] = choose(1,1,1,2)
    }
    else{
        resources[i] = 0
    }
}

//Type
    if(type<65){
            resources[0] += 2
            resources[1] += 1
            population[0] += irandom(resources[0]*planetSize-1)+1
            currentPop = population[0]
            type = NODE_TYPES.PLANET
            }
    else if(type<80){
            resources[0] = 0
            resources[1] += 2
            resources[2] += 1
            type = NODE_TYPES.ASTEROID_BELT
            }
    else if(type<85){
            resources[0] += 3
            type = NODE_TYPES.OCEAN
            }
    else if(type<95){
            resources[0] = 0
            resources[1] = 0
            resources[4] += 2
            type = NODE_TYPES.NEBULA
            }  
    else{
            resources[0] = 0
            resources[3] += 1
            resources[4] += 1
            sunColour = 5
            type = NODE_TYPES.BLACK_HOLE
            }      

//Planet Size
if type = NODE_TYPES.PLANET{
    resistance = 2  //influence is devided by resistance
    
    if(planetSize == 0){
        planetSize = PLANET_SIZE.SMALL
        resources[0] -= floor(resources[0]*.4)
        resources[1] -= floor(resources[1]*.4)
    }
    else if(planetSize == 1 || planetSize == 2){
        planetSize = PLANET_SIZE.MEDIUM
    }
    else if(planetSize == 3){
        planetSize = PLANET_SIZE.LARGE
        resources[0] += floor(resources[0]*.4)
        resources[1] += floor(resources[1]*.4)
    }
}

maxFleets = 4

if (type = NODE_TYPES.PLANET){
    i = instance_create(x,y,obj_FleetSlot)
    i.space = false
    i.node = id
    fleetSlots[0] = i
    //maxFleets++
}
else{
    fleetSlots[0] = noone
}

i = instance_create(x-20,y,obj_FleetSlot)
i.node = id
fleetSlots[1] = i

i = instance_create(x-15,y+15,obj_FleetSlot)
i.node = id
fleetSlots[2] = i

i = instance_create(x,y+20,obj_FleetSlot)
i.node = id
fleetSlots[3] = i
