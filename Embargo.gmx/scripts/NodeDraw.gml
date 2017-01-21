for (var i = 0;i < numConnections;i++){
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_colour(c_lime)
    draw_arrow(x,y,connections[i].x,connections[i].y,10)
    draw_circle(x,y,10,true)
    draw_set_colour(c_red)
    draw_text(x+20,y+20, group)
    //draw_circle(x,y,100,true)
}
