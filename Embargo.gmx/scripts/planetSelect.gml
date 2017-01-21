temp = instance_nearest(mouse_x,mouse_y,Node)

if(point_distance(mouse_x,mouse_y,temp.x,temp.y)<20){
    global.selected = temp
    //temp.curSelected = true
}

//draw_set_colour(c_fuchsia)
//draw_circle(mouse_x,mouse_y,20,false)
