struct Position: Hashable {
    var row: Int
    var column: Int
    
    var hashValue: Int {
        return row * column
    }
}

func ==(left: Position, right: Position) -> Bool {
    return left.row == right.row &&
        left.column == right.column
}