import XCTest
@testable import Gomoku

class RuleTests: XCTestCase {
    
    var board: Board!
    var rule = Rule()
    
    override func setUp() {
        board = Board()
        rule = Rule()
        super.setUp()
    }
    
    func testEmptyBoardHasNoWinner() throws {
        XCTAssertFalse(try rule.hasWinner(board: board))
    }
    
    func testWithJustOneStoneHasNoWinner() throws {
        try board.place(at: Position(row: 1, column: 1), stone: .black)
        
        XCTAssertFalse(try rule.hasWinner(board: board))
    }
    
    func testFiveBlackStonesInARowHasWinner() throws {
        for column in 1...5 {
            try board.place(at: Position(row: 1, column: column), stone: .black)
        }
        
        XCTAssertTrue(try rule.hasWinner(board: board))
    }
    
    func testFiveWhiteStonesInARowHasWinner() throws {
        for column in 1...5 {
            try board.place(at: Position(row: 1, column: column), stone: .white)
        }
        
        XCTAssertTrue(try rule.hasWinner(board: board))
    }
    
    func testMoreThanFiveWhiteStonesInARowHasWinner() throws {
        for column in 1...10 {
            try board.place(at: Position(row: 1, column: column), stone: .white)
        }
        
        XCTAssertTrue(try rule.hasWinner(board: board))
    }
    
    func testOneBlackStonePlusFourWhiteStonesInARowHasNoWinner() throws {
        try board.place(at: Position(row: 1, column: 1), stone: .black)
        for column in 2...5 {
            try board.place(at: Position(row: 1, column: column), stone: .white)
        }
        
        XCTAssertFalse(try rule.hasWinner(board: board))
    }
    
    func testFiveWhiteStonesInASkipedRowsHasNowWinner() throws {
        for column in [1, 2, 3, 4, 10] {
            try board.place(at: Position(row: 1, column: column), stone: .white)
        }
        
        XCTAssertFalse(try rule.hasWinner(board: board))
    }
    
    func testFiveBlackStonesInASkipedRowsHasNowWinner() throws {
        for column in [1, 5, 6, 7, 8] {
            try board.place(at: Position(row: 1, column: column), stone: .black)
        }
        
        XCTAssertFalse(try rule.hasWinner(board: board))
    }
    
    func testFiveWhiteStonesInAnUnordenedRowHasWinner() throws {
        for column in [1, 3, 2, 4, 5] {
            try board.place(at: Position(row: 1, column: column), stone: .white)
        }
        
        XCTAssertTrue(try rule.hasWinner(board: board))
    }
    
    func testFiveBlackStonesInAnUnordenedRowHasWinner() throws {
        for column in [1, 3, 2, 4, 5] {
            try board.place(at: Position(row: 1, column: column), stone: .black)
        }
        
        XCTAssertTrue(try rule.hasWinner(board: board))
    }
}
