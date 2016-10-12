class Board {
    var stonesPlaced = [Position : Stone]()
    let rows = 19, columns = 19
    
    func placedStones() -> Int {
        return stonesPlaced.count
    }
    
    func place(at position: Position, stone: Stone) throws {
        if stonesPlaced[position] != nil {
            throw BoardError.occupiedPosition
        }
        stonesPlaced[try valid(position)] = stone
    }
    
    func stone(at position: Position) throws -> Stone? {
        return stonesPlaced[try valid(position)]
    }
    
    func valid(_ position: Position) throws -> Position {
        if !(0...rows ~= position.row) || !(0...columns ~= position.column) {
            throw BoardError.inexistentPosition
        }
        return position
    }
}
