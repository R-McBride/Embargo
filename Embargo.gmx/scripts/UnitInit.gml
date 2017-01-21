unitSpeed = 1
influence = 0
if(instance_exists(Fleet)){
    if(point_distance(x,y,instance_nearest(x,y,Fleet).x,instance_nearest(x,y,Fleet).y)<10){
        ds_list_add(instance_nearest(x,y,Fleet).ships,id)
        }
    else{
        newFleet = instance_create(x,y,Fleet)
        ds_list_add(newFleet.ships, id)
    }
}
else{
    newFleet = instance_create(x,y,Fleet)
    ds_list_add(newFleet.ships, id)
}
