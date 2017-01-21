    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_colour(c_gray)
    
for (var i = 0;i < numConnections;i++){
    draw_line(x,y,connections[i].x,connections[i].y)
    }
    
    switch (type){
        case (NODE_TYPES.PLANET):
            draw_set_colour(c_green)
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
    }
    draw_circle(x,y,10,true)
    
    switch(sunColour){
        case (0):
            draw_set_colour(c_orange)
            break
        case (1):
            draw_set_colour(c_yellow)
            break
        case (2):
            draw_set_colour(c_white)
            break
        case (3):
            draw_set_colour(c_red)
            break
        case (4):
            draw_set_colour(c_aqua)
            break
        }  
          
    draw_circle(x,y,3,false)
    draw_set_colour(c_red)
    //draw_text(x+20,y+20, group)
    
    if global.VIEW = VIEW_TYPE.RESOURCE
    {
        var j = 0
        for (var i = 0; i < global.NUM_RESOURCE_TYPES; i++){
            if(resources[i] != 0){
                draw_sprite (spr_resourceIcons, i, x+16, y-10+(12*j))
                draw_set_halign(fa_left)
                draw_set_colour(c_white)
                draw_text(x+22, y-10+(12*j), string_format(resources[i],2,1))
                j++
            }
        }
    }
    
    //draw_circle(x,y,100,true)
