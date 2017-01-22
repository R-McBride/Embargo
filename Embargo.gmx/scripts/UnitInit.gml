#define UnitInit
unitSpeed = 1
influence = 0
player = global.PLAYER


movesLeft = unitSpeed

created = false


tempNode = instance_nearest(x,y,Node)

    if(tempNode.numFleetsPresent == 0){
        createFleetAtLoc()
    }
    else{
    //show_message(tempNode.maxFleets)
        for(i = 1; i < tempNode.maxFleets; i++){
            if(tempNode.fleetSlots[i].occupier != noone && tempNode.fleetSlots[i].occupier.player == global.PLAYER && created == false){
                ds_list_add(tempNode.fleetSlots[i].occupier.ships,id)
                
                created = true
            }
        }    
            
        if(created == false){
            createFleetAtLoc()
        }
        
    }


#define createFleetAtLoc
//make a new fleet at the correct fleet slot

for(var j = 1; j < tempNode.maxFleets; j++){
    if(tempNode.fleetSlots[j].occupier == noone && created == false){
    //put the new ship in the fleet
        newFleet = instance_create(tempNode.fleetSlots[j].x,tempNode.fleetSlots[j].y,Fleet)
        ds_list_add(newFleet.ships, id)
        tempNode.fleetSlots[j].occupier = newFleet
        x = newFleet.x
        y = newFleet.y
        created = true
    }
}

with(newFleet){
    position.numFleetsPresent++
    player = global.PLAYER
}

//show_message('fleeg')