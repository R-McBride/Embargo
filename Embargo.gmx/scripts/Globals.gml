global.MAP_SIZE = 800
global.NUM_PLANETS = 50 //eventually we can make this a density variable based on map size
global.NUM_PLAYERS = 3

global.selectedNode = noone
global.selectedFleet = noone
global.selectedUnit = noone

global.NUM_NODE_TYPES = 5
enum NODE_TYPES {
    PLANET = 0, 
    ASTEROID_BELT = 1,
    OCEAN = 2,
    NEBULA = 3,
    BLACK_HOLE = 4    
    }

global.NUM_RESOURCE_TYPES = 5 
global.RESOURCE_RARITY = 3   
enum RESOURCE_TYPES {
    FOOD = 0 , 
    LABOR = 1 , LABOUR = 1 , 
    CAPITAL = 2 , 
    INFLUENCE = 3 , 
    LORE = 4 
}
    
enum AGENT_TYPE{
    OPERATIVE = 0 ,
    MERCHANT = 1 ,
    GENERAL = 2 ,
    ADMIRAL = 3 ,
    ENVOY = 4 ,
    SCIENTIST = 5,
    WIZARD = 6
}

enum NAVAL_TYPE{
    SCOUT = 0 ,
    FRIGATE = 1 ,
    CRUISER = 2 ,
    BATTLESHIP = 3
}

enum FACTION_TYPE{
    EMPIRE = 1 , 
    FREECOL = 2 ,
    PERFECTIONATE = 3 ,  
    COMPANIONS = 4 ,      
    COVEN = 5 , 
    CRAFT = 6 ,
    BUGMEN = 7 ,  
    SPACEGHOSTS = 8
}

enum DIPLOMACY_TYPE{
    ATWAR = 0 ,     //Players have fought and haven't resolved it
    EMBARGO = 1 ,
    NEUTRAL = 2 ,   //Players can trade
    ALLIES = 3      //Players can trade and move through each other
}

enum VIEW_TYPE{
    NONE = 0 ,
    RESOURCE = 1 ,
    INFLUENCE = 2   
}

global.FACTION_COLOUR[1] = make_colour_rgb(99,31,168)
global.FACTION_COLOUR[2] = make_colour_rgb(45,65,165)
global.FACTION_COLOUR[3] = make_colour_rgb(233,13,32)
global.FACTION_COLOUR[4] = make_colour_rgb(66,168,31)
global.FACTION_COLOUR[5] = make_colour_rgb(11,130,98)
global.FACTION_COLOUR[6] = make_colour_rgb(187,196,202)
global.FACTION_COLOUR[7] = make_colour_rgb(163,113,24)
global.FACTION_COLOUR[8] = make_colour_rgb(218,62,81)

global.RESOURCE_COLOUR[0] = make_colour_rgb(147,233,71)
global.RESOURCE_COLOUR[1] = make_colour_rgb(139,37,46)
global.RESOURCE_COLOUR[2] = make_colour_rgb(255,245,88)
global.RESOURCE_COLOUR[3] = make_colour_rgb(83,171,233)
global.RESOURCE_COLOUR[4] = make_colour_rgb(182,54,230)

//Control Variables
hover = noone
global.VIEW = VIEW_TYPE.RESOURCE

//Turn Variables
global.TURN = 1
global.PLAYER = 1

//Player Variables
for(i = 0; i < global.NUM_PLAYERS; i++)
{
    //Starting Faction
    global.FACTION[i] = i+1
    global.CAPITAL[i] = 10.0
    global.POWER[i] = 10.0

    //Starting Diplomacy
    for(ii = 0; ii < global.NUM_PLAYERS; ii++)
    {
        global.DIPLOMACY[i,ii] = DIPLOMACY_TYPE.NEUTRAL
    }
}
