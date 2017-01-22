for (var i = 0; i < instance_number(Station); i += 1){

    stations[i] = instance_find(Station,i); //find all the stations
    
    stations[i].influence = ((4 + stations[i].position.resources[3])/stations[i].position.currentPop)/10 //calculate influence output
    
    k=0
    
    for (j = 0; j<global.NUM_PLAYERS;j++){
        if (stations[i].player != j){
            stations[i].position.population[j]*=(1-(stations[i].influence)) //lose the influence output per population
        }
        else if (stations[i].player == j){
            stations[i].position.population[j]+=stations[i].influence*(stations[i].position.currentPop - stations[i].position.population[j])  //gain influence equal to the population you converted
        }
    }
    
    for (j = 0; j<stations[i].position.numConnections;j++){
       if (stations[i].position.connections[j].population[stations[i].player]<stations[i].connections[stations[i].player].currentPop/2){
            k++     //find how many nodes are currently not under your control
       }
    }
    
    tempInfluence = stations[i].influence/k //divide the influence amongst them
    
    for (j = 0; j<stations[i].position.numConnections;j++){
        for(k=0; k<global.NUM_PLAYERS;k++){
            if (stations[i].player != k){
                stations[i].position.connections[j].population[k]*=(1-(tempInfluence))
            }
            else if (stations[i].player == k){
                stations[i].position.connections[j].population[k]+=tempInfluence*(stations[i].position.connections[j].currentPop-stations[i].position.connections[j].population[k])
            }
        }
    }
}
