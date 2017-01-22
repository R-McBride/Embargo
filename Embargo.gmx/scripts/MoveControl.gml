//gets passed the planet you're moving to by the step in fleet
tempNode = instance_nearest(mouse_x,mouse_y,Node)

//check if the click is close to a planet and if you can move to that planet
if(point_distance(mouse_x,mouse_y,tempNode.x,tempNode.y)<20  && global.selectedFleet.position == global.selectedNode && tempNode.numFleetsPresent<tempNode.maxFleets){
    for (var i = 0; i < tempNode.numConnections; i++){
        if (tempNode.connections[i] == global.selectedNode){
        
        //move the fleet
        global.selectedFleet.position = tempNode
        //starts at 1 to ignore ground units, currently
        for(var k = 1; k < array_length_1d(tempNode.fleetSlots); k++){
            if(tempNode.fleetSlots[k].occupier == noone){
            
                tempNode.fleetSlots[k].occupier = global.selectedFleet
                tempNode.numFleetsPresent++
                global.selectedFleet.x = tempNode.fleetSlots[k].x
                global.selectedFleet.y = tempNode.fleetSlots[k].y
                //following statement could be moved either inside fleet or ships
                for(l = 0; l < ds_list_size(global.selectedFleet.ships); l++){
                    global.selectedFleet.ships[| l].position = global.selectedFleet.position
                }
            }
        }
        
        //pop the fleet from the planet
            for (var j = 0; j < global.selectedNode.numFleetsPresent; j++){
                if(global.selectedNode.fleetSlots[j] == global.selectedFleet){
                    global.selectedNode.fleetSlots[j].occupier = noone
                    global.selectedNode.numFleetsPresent--
                }
            }
        }
    }
    

}



