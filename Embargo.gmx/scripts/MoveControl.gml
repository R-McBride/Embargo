//gets passed the planet you're moving to by the step in fleet
tempNode = instance_nearest(mouse_x,mouse_y,Node)

moved = false
prevNode = global.selectedFleet.position

//check if the click is close to a planet and if you can move to that planet
if(point_distance(mouse_x,mouse_y,tempNode.x,tempNode.y)<20 && tempNode.numFleetsPresent<tempNode.maxFleets && global.selectedFleet.canMove != false){
    for (var i = 0; i < tempNode.numConnections; i++){
        if (tempNode.connections[i] == prevNode){

            //loop through all of the fleet slots
            //starts at 1 to ignore ground units, currently
            for(var k = 1; k < tempNode.maxFleets; k++){
            //check if the fleet slot is empty
                if(tempNode.fleetSlots[k].occupier == noone && moved == false){
                        //set the fleet's position to the new position
            global.selectedFleet.position = tempNode
                //put the fleet in the fleet slot
                    tempNode.fleetSlots[k].occupier = global.selectedFleet
                    tempNode.numFleetsPresent++
                //move the fleet to the new position
                    global.selectedFleet.x = tempNode.fleetSlots[k].x
                    global.selectedFleet.y = tempNode.fleetSlots[k].y
                    //following statement could be moved either inside fleet or ships
                    for(l = 0; l < ds_list_size(global.selectedFleet.ships); l++){
                        global.selectedFleet.ships[| l].position = global.selectedFleet.position
                        }
                moved = true 
                }
            }
        //pop the fleet from the planet
        //starting at fucking 1
            for (var j = 1; j < prevNode.maxFleets; j++){
                if(prevNode.fleetSlots[j].occupier == global.selectedFleet && moved == true){
                    prevNode.fleetSlots[j].occupier = noone
                    prevNode.numFleetsPresent--
                }
            }
        }
    }
}

if (moved = true){
    for (var i = 0; i < ds_list_size(global.selectedFleet.ships);i++){
        temp = ds_list_find_value(global.selectedFleet.ships, i)
        temp.movesLeft--
        if(temp.movesLeft == 0){
            global.selectedFleet.canMove = false
        }
    }
    if(!tempNode.hasBeenExplored){
        global.PSCORE[global.PLAYER] += 5
        tempNode.hasBeenExplored = true
    }
    tempNode.isVisible = true
    updateVision()
    
    for(var i = 1; i < tempNode.maxFleets; i++){
        if(global.selectedFleet != noone){
            if(tempNode.fleetSlots[i].occupier != noone){
                //show_message(tempNode.fleetSlots[i].occupier.player)
                if(tempNode.fleetSlots[i].occupier.player != global.selectedFleet.player){
                
                    if(tempNode.fleetSlots[i].occupier.player != global.selectedFleet.player){
                        //add another if for if they're allied before doing the following
                        results = fightController(global.selectedFleet,tempNode.fleetSlots[i].occupier)
                        if(results == 0){
                            break
                        }
                    }
                }
            }
        }
    }
}

