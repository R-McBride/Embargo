unitSpeed = 1
influence = 0

tempNode = instance_nearest(x,y,Node)

    if(tempNode.numFleetsPresent == 0){

            //make a new fleet at the correct fleet slot
                newFleet = instance_create(tempNode.fleetSlots[1].x,tempNode.fleetSlots[1].y,Fleet)
                ds_list_add(newFleet.ships, id)
        
            //put the new ship in the fleet
                tempNode.fleetSlots[1].occupier = newFleet
                x = newFleet.x
                y = newFleet.y

    }
    else{
        for(i = 1; i < tempNode.maxFleets; i++){
            if(tempNode.fleetSlots[i].occupier != noone){
                ds_list_add(tempNode.fleetSlots[i].occupier.ships,id)
            }
        }
    }

