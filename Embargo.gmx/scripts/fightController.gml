//these are fleets
invader = argument0
defender = argument1

//put the ships in a random order
ds_list_shuffle(invader.ships)
ds_list_shuffle(defender.ships)

invaderPower = 0
defenderPower = 0

for(var i = 0; i < ds_list_size(invader.ships); i++){
    invaderPower = invader.ships[| i].spacePower
}
for(var i = 0; i < ds_list_size(defender.ships); i++){
    defenderPower = defender.ships[| i].spacePower
}

while(ds_list_size(invader.ships != 0) && ds_list_size(defender.ships) != 0){
    //first invader ship attacks first defender ship
    defender.ships[| 0].spaceHealth -= invader.ships[| 0].spacePower
    //show_message(string(defender.ships[| 0].spaceHealth) + string(ds_list_size(defender.ships)))
    //if the ship has less than 0 health, destroy it
    if(defender.ships[| 0].spaceHealth <= 0){
        ds_list_delete(defender.ships, 0)
        //if this causes the number of ships in the fleet to be zero, stop combat
        if(ds_list_size(defender.ships) == 0){
            with(defender){
                instance_destroy()
            }
            //show_message('invaders win! ' + string(invaderPower) +' '+ string(defenderPower))
            return 1
        }
    }
    
    //first defender ship attacks first invader ship
    invader.ships[| 0].spaceHealth -= defender.ships[| 0].spacePower
    //show_message(string(defender.ships[| 0].spaceHealth) + string(ds_list_size(defender.ships)))
    
    if(invader.ships[| 0].spaceHealth <= 0){
        ds_list_delete(invader.ships, 0)
        if(ds_list_size(invader.ships) == 0){
            with(invader){
                instance_destroy()
            }
            //show_message('defenders win! ' + string(invaderPower) +' '+ string(defenderPower))
            return 0
        }
    }
}

