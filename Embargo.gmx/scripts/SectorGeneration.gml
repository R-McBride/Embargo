randomize()

room_width = (1.6*global.MAP_SIZE)+640
room_height = (.9*global.MAP_SIZE)+360

sector = instance_create(0,0,Sector)
for (var i=0;i<global.NUM_PLANETS;i++){
    ix = 320+random(1.6*global.MAP_SIZE)
    iy = 180+random(.9*global.MAP_SIZE)
    
    if i>0
    {
        while(point_distance(ix,iy,instance_nearest(ix,iy,Node).x,instance_nearest(ix,iy,Node).y) < (global.MAP_SIZE/10)){
        ix = 320+random(1.6*global.MAP_SIZE)
        iy = 180+random(.9*global.MAP_SIZE)
        }
    }
       
    sector.nodes[i] = instance_create(ix, iy, Node)
}

//set up hub planet variables to connect groups
numGroups = 0
capPlanets[1] = 0

for (var i=0;i<global.NUM_PLANETS;i++){

//if planet does not have group, give it group
    if(sector.nodes[i].group == 0){
        capPlanets[numGroups] = sector.nodes[i]
        sector.nodes[i].group = numGroups + 1
        numGroups++
    }
    var ii = sector.nodes[i].numConnections
    closest = sector.nodes[0]
    for (var iii=0;iii<global.NUM_PLANETS;iii++){
        if(i != iii){
        //is the node we're comparing to close enough to make a connection?
            if (point_distance(sector.nodes[i].x,sector.nodes[i].y, sector.nodes[iii].x, sector.nodes[iii].y)<(global.MAP_SIZE/5)){
            //set that node to be a new connection
                sector.nodes[i].connections[ii] = sector.nodes[iii]
                //increase the position in connections array
                ii++
                sector.nodes[i].numConnections++
                
                //add this planet to the group
                sector.nodes[iii].group = sector.nodes[i].group
                
            }
            //check if the comparing node is closer than the last closest node
            if(point_distance(sector.nodes[i].x,sector.nodes[i].y, sector.nodes[iii].x, sector.nodes[iii].y)< point_distance(sector.nodes[i].x,sector.nodes[i].y, closest.x, closest.y)){
                closest = sector.nodes[iii]
            }
        }
    }
       if (ii == 0){
        sector.nodes[i].connections[ii] = closest
        closest.connections[closest.numConnections] = sector.nodes[i]
        sector.nodes[i].numConnections++
        closest.numConnections++
        
        //add this planet to the group
        closest.group = sector.nodes[i].group
        }
}

//make connections between all hub planets
for (var i = 0; i < numGroups; i++){
    hasMadeConnection = false
    for (var j = 0; j < numGroups; j++){
        if(i!=j){
            closesti = capPlanets[i]//set closest planet to the capPlanet
            closestj = capPlanets[j]
            for (var k = 0; k < global.NUM_PLANETS;k++){
                if (sector.nodes[k].group == i && point_distance(sector.nodes[k].x,sector.nodes[k].y, capPlanets[j].x, capPlanets[j].y)< point_distance(closesti.x,closesti.y,  capPlanets[j].x, capPlanets[j].y)){
                    closesti = sector.nodes[k]
                }
                if (sector.nodes[k].group == j && point_distance(sector.nodes[k].x,sector.nodes[k].y, capPlanets[i].x, capPlanets[i].y)< point_distance(closestj.x,closestj.y,  capPlanets[i].x, capPlanets[i].y)){
                    closestj = sector.nodes[k]
                }
            }
            if (point_distance(closesti.x, closesti.y, closestj.x, closestj.y) < (global.MAP_SIZE/3)){
                closesti.connections[closesti.numConnections] = closestj
                closesti.numConnections++
                hasMadeConnection = true
            }
        }
    }
    
    //trying to remove the outlier cases
    /*
    if (hasMadeConnection = false){
        temp = instance_nearest(capPlanets[i].x,capPlanets[i].y,Node)
        capPlanets[i].connections[capPlanets[i].numConnections] = temp
        capPlanets[i].numConnections++
        temp.connections[temp.numConnections] = capPlanets[i] 
        temp.numConnections++
    }
    */
    
}

testStation = instance_create (capPlanets[0].x, capPlanets[0].y, Station)

testStation.position = capPlanets[0]
testFleet = instance_create(capPlanets[0].fleetSlots[1].x, capPlanets[0].fleetSlots[1].y, Fleet)
testShip = instance_create(testFleet.x, testFleet.y, Unit)

testStation = instance_create (sector.nodes[1].x, sector.nodes[1].y, Station)
testStation.position = sector.nodes[1]

testStation.player = 2


//testFleet = instance_create(capPlanets[0].x-15, capPlanets[0].y+15, Fleet)
//testShip = instance_create(capPlanets[0].x-15, capPlanets[0].y+15, Unit)

