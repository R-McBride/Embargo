global.MAP_SIZE = 800
global.NUM_PLANETS = 40 //eventually we can make this a density variable based on map size
global.NUM_PLAYERS = 3

global.NUM_NODE_TYPES = 12
enum NODE_TYPES {
    PLANET = 5, 
    ASTEROID_BELT = 7,
    OCEAN = 8,
    NEBULA = 10,
    BLACK_HOLE = 11    
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

//Control Variables
hover = noone

//Turn Variables
global.TURN = 1
global.PLAYER = 1

//Player Variables
for(i = 0; i < NUM_PLAYERS; i++)
{
    //Starting Faction
    global.FACTION[i] = i+1

    //Starting Diplomacy
    for(ii = 0; i < NUM_PLAYERS; ii++)
    {
        global.DIPLOMACY[i,ii] = DIPLOMACY_TYPE.NEUTRAL
    }
}
