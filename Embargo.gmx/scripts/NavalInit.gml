switch (argument0){
    case(NAVAL_TYPE.SCOUT):
        unitSpeed = 3
        canBlockade = false
        spacePower = 1
        break
    case(NAVAL_TYPE.FRIGATE):
        unitSpeed = 2
        canBlockade = true
        spacePower = 2
        break
    case(NAVAL_TYPE.CRUISER):
        unitSpeed = 1
        canBlockade = true
        spacePower = 3
        break
    case(NAVAL_TYPE.BATTLESHIP):
        unitSpeed = 1
        canBlockade = true
        spacePower = 4
        break
        
    

}
