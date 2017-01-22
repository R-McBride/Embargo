#define NodeInit
connections[global.NUM_PLANETS] = noone
numConnections = 0
group = 0
fleetSlots[3] = noone
numFleetsPresent = 0
difficult = false
name = choose('Gar','Farr','Hel','Pal','Tek')+
choose('','','','','','','','','','-')+
choose('gon','tal','ala','ian','ah')+' '+
choose('I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII')+
choose('','','','','','','','','','','','','a','a','b','c')
offset = random(2*pi)
type = 1+irandom(99)

planetSize = irandom(3)
currentPop = 0
partialPop = 0
maxPop = 0
population[global.NUM_PLAYERS] = 0
influence[global.NUM_PLAYERS] = 0
resistance = 1

sunColour = choose(c_red,c_yellow,c_teal,c_white,c_orange)

for (var i = 0; i < global.NUM_RESOURCE_TYPES; i++){
    if (random(global.RESOURCE_RARITY) > global.RESOURCE_RARITY - 1){
        resources[i] = choose(1,1,1,2)
    }
    else{
        resources[i] = 0
    }
}

//Type
    if(type<65){
            resources[0] += 2
            resources[1] += 1
            population[0] += irandom(resources[0]*planetSize-1)+1
            currentPop = population[0]
            type = NODE_TYPES.PLANET
            }
    else if(type<80){
            resources[0] = 0
            resources[1] += 2
            resources[2] += 1
            type = NODE_TYPES.ASTEROID_BELT
            nodeParticles(type)
            }
    else if(type<85){
            resources[0] += 3
            type = NODE_TYPES.OCEAN
            nodeParticles(type)
            }
    else if(type<95){
            resources[0] = 0
            resources[1] = 0
            resources[4] += 2
            type = NODE_TYPES.NEBULA
            nodeParticles(type)
            }  
    else{
            resources[0] = 0
            resources[3] += 1
            resources[4] += 1
            sunColour = c_black
            type = NODE_TYPES.BLACK_HOLE
            nodeParticles(type)
            }      

//Planet Size
if type = NODE_TYPES.PLANET{
    resistance = 2  //influence is devided by resistance
    
    if(planetSize == 0){
        planetSize = PLANET_SIZE.SMALL
        resources[0] -= floor(resources[0]*.4)
        resources[1] -= floor(resources[1]*.4)
    }
    else if(planetSize == 1 || planetSize == 2){
        planetSize = PLANET_SIZE.MEDIUM
    }
    else if(planetSize == 3){
        planetSize = PLANET_SIZE.LARGE
        resources[0] += floor(resources[0]*.4)
        resources[1] += floor(resources[1]*.4)
    }
}

maxFleets = 4

if (type = NODE_TYPES.PLANET){
    i = instance_create(x,y,obj_FleetSlot)
    i.space = false
    i.node = id
    fleetSlots[0] = i
    //maxFleets++
}
else{
    fleetSlots[0] = noone
}

i = instance_create(x-20,y,obj_FleetSlot)
i.node = id
fleetSlots[1] = i

i = instance_create(x-15,y+15,obj_FleetSlot)
i.node = id
fleetSlots[2] = i

i = instance_create(x,y+20,obj_FleetSlot)
i.node = id
fleetSlots[3] = i

#define nodeParticles
ps = part_system_create()

particle1 = part_type_create();
emitter1 = part_emitter_create(ps);

switch(argument0){
case NODE_TYPES.OCEAN:
part_type_shape(particle1,pt_shape_sphere);
part_type_size(particle1,0.20,1.00,0,0);
part_type_color1(particle1,make_color_rgb(0,128,255));
part_type_alpha3(particle1,0,1,0);
part_type_speed(particle1,0,0.2,0,0);
part_type_direction(particle1,0,359,0,1);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,0);
part_type_life(particle1,100,300);
part_emitter_region(ps,emitter1,x-25,x+25,y-25,y+25,ps_shape_ellipse,0);
break

case NODE_TYPES.ASTEROID_BELT:
part_type_shape(particle1,pt_shape_disk);
part_type_size(particle1,.03,.06,0,0);
part_type_color1(particle1,make_color_rgb(128,128,64));
part_type_alpha3(particle1,0,1,0);
part_type_speed(particle1,0,0.3,0,0);
part_type_direction(particle1,0,359,0,10);
part_type_orientation(particle1,0,359,2,2,1);
part_type_blend(particle1,0);
part_type_life(particle1,40,80);
part_emitter_region(ps,emitter1,x-25,x+25,y-25,y+25,ps_shape_ellipse,0);
break

case NODE_TYPES.NEBULA:
part_type_shape(particle1,pt_shape_smoke);
part_type_size(particle1,0.20,1.50,0,0);
part_type_color3(particle1,make_color_rgb(255,255,0),make_color_rgb(255,128,0),make_color_rgb(255,0,0));
part_type_alpha3(particle1,0,.2,0);
part_type_speed(particle1,0,0.3,0,0);
part_type_direction(particle1,0,359,1,5);
part_type_orientation(particle1,0,0,0,5,1);
part_type_blend(particle1,1);
part_type_life(particle1,60,200);
part_emitter_region(ps,emitter1,x-25,x+25,y-25,y+25,ps_shape_ellipse,0);
break

case NODE_TYPES.BLACK_HOLE:
part_type_shape(particle1,pt_shape_disk);
part_type_size(particle1,.03,.05,0,0);
part_type_color3(particle1,c_black,c_white,c_white);
part_type_alpha3(particle1,0,0,1);
part_type_speed(particle1,1,2,0,0);
part_type_direction(particle1,0,359,4,1);
part_type_orientation(particle1,0,0,0,0,0);
part_type_blend(particle1,0);
part_type_life(particle1,80,80);
part_emitter_region(ps,emitter1,x,x,y,y,ps_shape_ellipse,0);
break

}


