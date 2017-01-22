with(Node)
{   
    if type = NODE_TYPES.PLANET{
    partialPop += resources[0]-(currentPop/planetSize)
    
    if partialPop >= currentPop*3{
        
        //Adjust Population
        ii = (partialPop+1)/partialPop
        for(var i = 0; i <= global.NUM_PLAYERS; i++){
            population[i] *= ii
        }
        
        partialPop -= (currentPop*3)
        currentPop += 1
    }
    }
}
