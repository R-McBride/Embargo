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

draw_set_halign(fa_left)

//Draw Capital
draw_sprite(spr_resourceIcons,2,hX+10,vX+10)
draw_text(hX+20,vX+10,string_format(global.CAPITAL[global.PLAYER],2,1))
draw_text(hX+20,vX+10,string_format(global.CAPITAL[global.PLAYER],2,1))

//Draw Power
draw_sprite(spr_resourceIcons,3,hX+80,vX+10)
draw_text(hX+90,vX+10,string_format(global.POWER[global.PLAYER],2,1))
draw_text(hX+20,vX+10,string_format(global.CAPITAL[global.PLAYER],2,1))

