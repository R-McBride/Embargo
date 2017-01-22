if global.mouseMenu = false{
temp = instance_nearest(mouse_x,mouse_y,Node)

if(point_distance(mouse_x,mouse_y,temp.x,temp.y)<20){
    global.selectedNode = temp
    //temp.curSelected = true
    with(obj_sectorScreen){
        instance_destroy()
    }
    instance_create(300,200,obj_sectorScreen)
    
}
}
//draw_set_colour(c_fuchsia)
//draw_circle(mouse_x,mouse_y,20,false)
