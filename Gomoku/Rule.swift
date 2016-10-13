class Rule {
    
    let minimunValueForWinning = 5
    var placedStonesByColor = [Stone : [Int]]()

    func hasWinner(board: Board) throws -> Bool {
        placedStonesByColor[.black] = []
        placedStonesByColor[.white] = []
        
        for column in 1...board.columns {
            if let stone = try board.stone(at: Position(row: 1, column: column)) {
                placedStonesByColor[stone]?.append(column)
            }
        }
        
        for stone in [Stone.white, .black] {
            if let columns = placedStonesByColor[stone], columns.count >= minimunValueForWinning {
                for column in columns {
                    if !columns.contains(column + 1) && column != columns.last {
                        return false
                    }
                }
                return true
            }
        }

        return false
    }

}
