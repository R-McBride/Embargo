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
        for(i = 1; i < tempNode.maxFleets; i++){
            if(tempNode.fleetSlots[i].occupier != noone && tempNode.fleetSlots[i].occupier.player == player && created == false){
                ds_list_add(tempNode.fleetSlots[i].occupier.ships,id)
                show_message('huuurg')
                created = true
            }
            else if(created == false){
                createFleetAtLoc()
            }
        }
    }


#define createFleetAtLoc
//make a new fleet at the correct fleet slot
newFleet = instance_create(tempNode.fleetSlots[1].x,tempNode.fleetSlots[1].y,Fleet)
ds_list_add(newFleet.ships, id)

//put the new ship in the fleet
tempNode.fleetSlots[1].occupier = newFleet
x = newFleet.x
y = newFleet.y

show_message('fleeg')