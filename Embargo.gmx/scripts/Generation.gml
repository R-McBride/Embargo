randomize()

sector = instance_create(0,0,Sector)
for (var i=0;i<global.NUM_PLANETS;i++){
    sector.nodes[i] = instance_create(random(500), random(500), Node)
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
            if (point_distance(sector.nodes[i].x,sector.nodes[i].y, sector.nodes[iii].x, sector.nodes[iii].y)<100){
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
            closesti.connections[closesti.numConnections] = closestj
            closesti.numConnections++
        }
    }
}
