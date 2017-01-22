unitSpeed = 1
influence = 0

created = false

tempNode = instance_nearest(x,y,Node)


//if(instance_exists(Fleet)){
    //if(point_distance(x,y,instance_nearest(x,y,Fleet).x,instance_nearest(x,y,Fleet).y)<30){
       // ds_list_add(instance_nearest(x,y,Fleet).ships,id)
       // }
    //else{
    //loop through fleet slots
    if(tempNode.numFleetsPresent == 0){
        for(i = 1; i < tempNode.maxFleets; i++){
        //see if the fleet slot is empty and this script hasn't run yet
            if(tempNode.fleetSlots[i].occupier == noone && created == false){
            
            //make a new fleet at the correct fleet slot
                newFleet = instance_create(tempNode.fleetSlots[i].x,tempNode.fleetSlots[i].y,Fleet)
                ds_list_add(newFleet.ships, id)
        
            //put the new ship in the fleet
                tempNode.fleetSlots[i].occupier = newFleet
                tempNode.numFleetsPresent++
                x = newFleet.x
                y = newFleet.y
                created = true
            }
        }
    }
    else{
        for(i = 1; i < tempNode.maxFleets; i++){
            if(tempNode.fleetSlots[i].occupier != noone){
                ds_list_add(tempNode.fleetSlots[i].occupier.ships,id)
            }
        }
    }
    //}
//}
/*else{
    for(i = 1; i < tempNode.maxFleets; i++){
        if(tempNode.fleetSlots[i].occupier == noone && created == false){
            newFleet = instance_create(tempNode.fleetSlots[i].x,tempNode.fleetSlots[i].y,Fleet)
            ds_list_add(newFleet.ships, id)
            tempNode.fleetSlots[i].occupier = newFleet
            tempNode.numFleetsPresent++
            x = newFleet.x
            y = newFleet.y
            created = true
        }
    }
}*/
