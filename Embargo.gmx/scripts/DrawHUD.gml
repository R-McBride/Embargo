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
draw_text(hX+65,vX+10,string_format(global.CAPITAL[global.PLAYER],10,1))
draw_set_font(fnt_tiny)
draw_set_halign(fa_left)
draw_text(hX+70,vX+6,'+'+string_format(global.ICAPITAL[global.PLAYER],3,1))

if point_in_rectangle(mouse_x,mouse_y,hX+50,vX,hX+100,vX+20){
    draw_set_colour(c_black)
    draw_set_alpha(.5)
    draw_rectangle(hX+20,vX+20,hX+180,vX+120,false)
    draw_set_colour(c_white)
    draw_set_alpha(1)
    draw_rectangle(hX+20,vX+20,hX+180,vX+120,true)
    
    draw_text(hX+20,vX+30,string_format(global.ICAPITAL_NODE[global.PLAYER],3,1)+' Income from systems.')
    draw_text(hX+20,vX+50,string_format(global.ICAPITAL_POP[global.PLAYER],3,1)+' Income from population.')
    draw_text(hX+20,vX+70,string_format(2.0,3,1)+' Basic Income.')
}

//Draw Power
draw_sprite(spr_resourceIcons,3,hX+125,vX+10)
draw_set_font(fnt_medium)
draw_set_halign(fa_right)
draw_text(hX+175,vX+10,string_format(global.POWER[global.PLAYER],10,1))
draw_set_font(fnt_tiny)
draw_set_halign(fa_left)
draw_text(hX+180,vX+6,'+'+string_format(global.IPOWER[global.PLAYER],3,1))
draw_set_font(fnt_medium)
draw_set_halign(fa_right)
draw_text(hM-50,vX+10,'Turn: '+string(global.TURN))

if point_in_rectangle(mouse_x,mouse_y,hX+150,vX,hX+200,vX+20){
    draw_set_font(fnt_tiny)
    draw_set_halign(fa_left)

    draw_set_colour(c_black)
    draw_set_alpha(.5)
    draw_rectangle(hX+120,vX+20,hX+280,vX+120,false)
    draw_set_colour(c_white)
    draw_set_alpha(1)
    draw_rectangle(hX+120,vX+20,hX+280,vX+120,true)
    
    draw_text(hX+120,vX+30,string_format(global.IPOWER_NODE[global.PLAYER],3,1)+' Influence from systems.')
    draw_text(hX+120,vX+50,string_format(global.IPOWER_POP[global.PLAYER],3,1)+' Influence from population.')
    draw_text(hX+120,vX+70,string_format(2.0,3,1)+' Basic Influence.')
}

draw_set_halign(fa_middle)
draw_rectangle(hM-220,vX-1,hM-120,vX+20,true)
switch(global.VIEW){
case VIEW_TYPE.NONE: draw_text(hM-170,vX+10,'Views') break
case VIEW_TYPE.RESOURCE: draw_text(hM-170,vX+10,'Resources') break
case VIEW_TYPE.INFLUENCE: draw_text(hM-170,vX+10,'Influence') break
case VIEW_TYPE.GROWTH: draw_text(hM-170,vX+10,'Growth') break
}

//THIS IS JUST TO TEST SCORE
draw_text (hM-50,vX+500,string_format(global.PSCORE[global.PLAYER],3,1))

//THIS IS TO TEST BUYING THINGS AT STATIONS

