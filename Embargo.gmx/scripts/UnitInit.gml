#define UnitInit
unitSpeed = 1
influence = 0
player = global.PLAYER


movesLeft = unitSpeed

created = false

spacePower = irandom(3) + 2
spaceHealth = spacePower


tempNode = instance_nearest(x,y,Node)

    if(tempNode.numFleetsPresent == 0){
        createFleetAtLoc()
    }
    else{
        for(i = 1; i < tempNode.maxFleets; i++){
            if(tempNode.fleetSlots[i].occupier != noone && tempNode.fleetSlots[i].occupier.player == global.PLAYER && created == false){
                ds_list_add(tempNode.fleetSlots[i].occupier.ships,id)
                
                created = true
            }
          
        }  
        if(created == false){
            createFleetAtLoc()
            //show_message('huuurg')
        }
    }





#define createFleetAtLoc
for(i = 1; i < tempNode.maxFleets; i++){
    if(tempNode.fleetSlots[i].occupier == noone && created == false){
        //make a new fleet at the correct fleet slot
        newFleet = instance_create(tempNode.fleetSlots[i].x,tempNode.fleetSlots[i].y,Fleet)
        ds_list_add(newFleet.ships, id)
        
        newFleet.player = global.PLAYER
        
        //put the new ship in the fleet
        tempNode.fleetSlots[i].occupier = newFleet
        x = newFleet.x
        y = newFleet.y
        
        tempNode.numFleetsPresent++
        
        created = true
    }
}

//show_message('fleeg')