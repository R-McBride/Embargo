global.MAP_SIZE = 1000
global.NUM_PLANETS = 80 //eventually we can make this a density variable based on map size
global.NUM_PLAYERS = 8
global.NUM_SHIP_TYPES = 4
global.FOG_OF_WAR = true

global.selectedNode = noone
global.selectedFleet = noone
global.selectedUnit = noone

//going to hold the variables for player actions
global.CAN_BUY = false

//global.MAX_FLEETS = 3

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
    INFLUENCE = 2 ,
    GROWTH = 3  
}

enum PLANET_SIZE{
    SMALL = 2,
    MEDIUM = 3,
    LARGE = 5
}

global.FACTION_COLOUR[0] = c_white
global.FACTION_COLOUR[1] = make_colour_rgb(153,48,222)
global.FACTION_COLOUR[2] = make_colour_rgb(70,102,220)
global.FACTION_COLOUR[3] = make_colour_rgb(251,20,50)
global.FACTION_COLOUR[4] = make_colour_rgb(103,222,48)
global.FACTION_COLOUR[5] = make_colour_rgb(17,190,152)
global.FACTION_COLOUR[6] = make_colour_rgb(234,238,241)
global.FACTION_COLOUR[7] = make_colour_rgb(219,171,38)
global.FACTION_COLOUR[8] = make_colour_rgb(247,97,127)

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
for(i = 1; i <= global.NUM_PLAYERS; i++)
{
    //Starting Faction
    global.FACTION[i] = i
    global.CAPITAL[i] = 0
    global.POWER[i] = 0
    global.ICAPITAL[i] = 2
    global.IPOWER[i] = 2
    global.ICAPITAL_NODE[i] = 0
    global.ICAPITAL_POP[i] = 0
    global.IPOWER_NODE[i] = 0
    global.IPOWER_POP[i] = 0
    global.PSCORE[i] = 0
    global.PSHIPS[i,global.NUM_SHIP_TYPES] = false

    //Starting Diplomacy
    for(ii = 1; ii <= global.NUM_PLAYERS; ii++)
    {
        global.DIPLOMACY[i,ii] = DIPLOMACY_TYPE.NEUTRAL
    }
}

global.purchButtonsExist = false


