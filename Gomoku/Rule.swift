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
        
        if let stones = placedStonesByColor[.white], stones.count >= minimunValueForWinning {
            for stoneColumn in stones {
                if !stones.contains(stoneColumn + 1) && stoneColumn != stones.last {
                    return false
                }
            }
            return true
        } else if let stones = placedStonesByColor[.black], stones.count >= minimunValueForWinning {
            for stoneColumn in stones {
                if !stones.contains(stoneColumn + 1) && stoneColumn != stones.last {
                    return false
                }
            }
            return true
        }
        
        return false
    }

}
