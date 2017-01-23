with(Node){
    if (isVisible != true || hasBeenExplored != true){
    
    //Full Vision
        if (numFleetsPresent != 0){
            isVisible = true
            hasBeenExplored = true
        }
        else{
    //Partial Vision
            for(var i = 0; i < numConnections; i++){
                if(connections[i].isVisible && connections[i].hasBeenExplored){
                    isVisible = true
                }
            }
        }
    }
}
