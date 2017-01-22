with(Node){

    //Full Vision
    if numFleetsPresent != 0{
        isVisible = true
    }
    if isVisible != true{
    //Partial Vision
        for(i = 0; i < numConnections; i++){
            if(connections[i].isVisible = true){
                isVisible = 2
            }
        }
    }
}
