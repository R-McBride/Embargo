position = instance_nearest(x,y,Node)
//i is 1 to avoid placing ground units right now
for(var i = 1; i < position.maxFleets; i++){
    if(position.fleetSlots[i].occupier == noone){
        position.fleetSlots[i].occupier = self.id
    }
}

position.numFleetsPresent++
ships = ds_list_create()

player = 1
