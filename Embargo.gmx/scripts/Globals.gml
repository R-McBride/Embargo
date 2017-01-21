global.MAP_SIZE = 800
global.NUM_PLANETS = 40 //eventually we can make this a density variable based on map size
global.NUM_PLAYERS = 2

global.NUM_NODE_TYPES = 4
enum NODE_TYPES {
    PLANET = 0, 
    ASTEROID_BELT = 1,
    OCEAN = 2,
    NEBULA = 3
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
    
    
//Control Variables
hover = noone

//Turn Variables
turn = 1
currentPlayer = 1
