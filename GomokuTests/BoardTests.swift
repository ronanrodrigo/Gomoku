import XCTest
@testable import Gomoku

class BoardTests: XCTestCase {
    
    var board: Board!
    
    override func setUp() {
        super.setUp()
        board = Board()
    }
    
    func testNewBoardHasNoStones() {
        XCTAssertEqual(0, board.placedStones())
    }
    
    func testCanAddStonesToTheBoard() throws {
        try board.place(at: Position(row: 0, column: 0), stone: Stone.black)
        
        XCTAssertEqual(1, board.placedStones())
    }
    
    func testCanGetStoneColorFromPositionAtBoard() throws {
        let blackStonePosition = Position(row: 0, column: 0)
        try board.place(at: blackStonePosition, stone: Stone.black)

        let whiteStonePosition = Position(row: 1, column: 1)
        try board.place(at: whiteStonePosition, stone: Stone.white)

        let blackStone = try board.stone(at: blackStonePosition)
        XCTAssertEqual(blackStone, Stone.black)

        let whiteStone = try board.stone(at: whiteStonePosition)
        XCTAssertEqual(whiteStone, Stone.white)
    }
    
    func testShouldBeWithoutStoneAtNotOccupiedPosition() throws {
        let stone = try board.stone(at: Position(row: 0, column: 0))
        
        XCTAssertEqual(Optional<Stone>.none, stone)
    }
    
    func testCannotPlaceStoneAtOccupiedPosition() throws {
        let blackStonePosition = Position(row: 0, column: 0)
        try board.place(at: blackStonePosition, stone: Stone.black)
        
        XCTAssertThrowsError(try board.place(at: blackStonePosition, stone: Stone.white))
    }
    
    func testCannotPlaceStonesOutsideBounds() {
        XCTAssertThrowsError(try board.place(at: Position(row: -1, column: -1), stone: Stone.white))
        XCTAssertThrowsError(try board.place(at: Position(row: 0, column: -1), stone: Stone.white))
        XCTAssertThrowsError(try board.place(at: Position(row: -1, column: 0), stone: Stone.white))
        XCTAssertThrowsError(try board.place(at: Position(row: 20, column: 20), stone: Stone.white))
        XCTAssertThrowsError(try board.place(at: Position(row: 0, column: 20), stone: Stone.white))
        XCTAssertThrowsError(try board.place(at: Position(row: 20, column: 0), stone: Stone.white))
        XCTAssertEqual(0, board.placedStones())
    }
    
    func testCannotGetStonePlacedOutsideBounds() {
        XCTAssertThrowsError(try board.stone(at: Position(row: -1, column: -1)))
        XCTAssertThrowsError(try board.stone(at: Position(row: 0, column: -1)))
        XCTAssertThrowsError(try board.stone(at: Position(row: -1, column: 0)))
        XCTAssertThrowsError(try board.stone(at: Position(row: 20, column: 20)))
        XCTAssertThrowsError(try board.stone(at: Position(row: 0, column: 20)))
        XCTAssertThrowsError(try board.stone(at: Position(row: 20, column: 0)))
        XCTAssertEqual(0, board.placedStones())
    }

}
