var hX = view_xview
var hM = view_xview+view_wview
var vX = view_yview
var vM = view_yview+view_hview

draw_set_colour(c_black)
draw_set_alpha(.5)
draw_rectangle(hX,vX,hM,vX + 20, false)
draw_set_colour(c_white)
draw_set_alpha(1)
draw_line(hX,vX + 20,hM,vX + 20)

//Draw Faction Symbol
draw_sprite_ext(spr_factionIcons,global.FACTION[global.PLAYER],hM-30,vX+30,3,3,0,c_white,1)

//Draw Capital
draw_sprite(spr_resourceIcons,2,hX+15,vX+10)
draw_set_font(fnt_medium)
draw_set_halign(fa_right)
draw_text(hX+65,vX+10,string_format(global.CAPITAL[global.PLAYER],2,1))
draw_set_font(fnt_tiny)
draw_set_halign(fa_left)
draw_text(hX+70,vX+6,'+'+string_format(global.ICAPITAL[global.PLAYER],2,1))

//Draw Power
draw_sprite(spr_resourceIcons,3,hX+125,vX+10)
draw_set_font(fnt_medium)
draw_set_halign(fa_right)
draw_text(hX+175,vX+10,string_format(global.POWER[global.PLAYER],2,1))
draw_set_font(fnt_tiny)
draw_set_halign(fa_left)
draw_text(hX+180,vX+6,'+'+string_format(global.IPOWER[global.PLAYER],2,1))
draw_set_font(fnt_medium)
draw_set_halign(fa_right)
draw_text(hM-50,vX+10,'Turn: '+string(global.TURN))

draw_set_halign(fa_middle)
draw_rectangle(hM-220,vX-1,hM-120,vX+20,true)
switch(global.VIEW){
case VIEW_TYPE.NONE: draw_text(hM-170,vX+10,'Views') break
case VIEW_TYPE.RESOURCE: draw_text(hM-170,vX+10,'Resources') break
case VIEW_TYPE.INFLUENCE: draw_text(hM-170,vX+10,'Influences') break
}

//Node Details
if global.selectedNode != noone{
    draw_set_colour(c_black)
    draw_set_alpha(.5)
    draw_rectangle(hX+40,vX+80,hX+240,vX+400,false)
    draw_set_colour(c_white)
    draw_set_alpha(1)
    draw_rectangle(hX+40,vX+80,hX+240,vX+400,true)

    draw_set_font(fnt_huge)
    draw_set_halign(fa_middle)
    
    switch(global.selectedNode.type){
        case NODE_TYPES.PLANET: draw_text(hX+140,vX+100,global.selectedNode.name) break
        case NODE_TYPES.ASTEROID_BELT: draw_text(hX+140,vX+100,'Asteroid Field') break
        case NODE_TYPES.OCEAN: draw_text(hX+140,vX+100,'Ocean') break
        case NODE_TYPES.NEBULA: draw_text(hX+140,vX+100,'Nebula') break
        case NODE_TYPES.BLACK_HOLE: draw_text(hX+140,vX+100,'Black Hole') break
    }
}

