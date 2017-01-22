position = instance_nearest(x,y,Node)
created = false
//i is 1 to avoid placing ground units right now
for(var i = 1; i < position.maxFleets; i++){
    if(position.fleetSlots[i].occupier == noone && created == false){
        position.fleetSlots[i].occupier = self.id
        created = true
        //show_message('NEIN!')
    }
}


ships = ds_list_create()

canMove = true

player = 0
