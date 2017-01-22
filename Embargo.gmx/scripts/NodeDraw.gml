    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    
    switch (type){
        case (NODE_TYPES.PLANET):
            draw_set_colour(c_green)
            draw_circle(x + 10*cos((get_timer()/1000000) + offset), y + 10*sin((get_timer()/1000000) + offset), 1+planetSize, false)
            break
        case (NODE_TYPES.ASTEROID_BELT):
            draw_set_colour(c_gray)
            break
        case (NODE_TYPES.OCEAN):
            draw_set_colour(c_blue)
            break
        case (NODE_TYPES.NEBULA):
            draw_set_colour(c_yellow)
            break        
        case (NODE_TYPES.BLACK_HOLE):
            draw_set_colour(c_purple)
            break      
    }
    draw_circle(x,y,10,true)
    
    draw_set_colour(sunColour)
    draw_circle(x,y,3,false)
    
if(global.selectedNode == self.id){
    draw_set_colour(c_lime)
    draw_circle(x,y,15,true)
    draw_circle(x,y,15.5,true)
    draw_circle(x,y,16,true)
    
}

/*
for(var i = 0; i < numFleetsPresent; i++){
    draw_set_colour(c_teal)
    draw_rectangle(x-15,y+(i*12),x-7,y+8+(i*12),false)
}
    
    //draw_circle(x,y,100,true)
