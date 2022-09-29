//
//  YahtzeeSolutionCalculatorTests.swift
//  tdd_tech_grad_diceTests
//
//  Created by Matthew Glover on 29/09/2022.
//

import XCTest
@testable import tdd_tech_grad_dice

final class YahtzeeSolutionCalculatorTests: XCTestCase {

    var sut: YahtzeeSolutionCalculator!
    
    func testCanCreateSolutionCalculator() {
        sut = YahtzeeSolutionCalculator()
        
        XCTAssertNotNil(sut)
    }
    
    func testDiceRollOf1_4_6_2_2Returns5Solutions() {
        
        sut = YahtzeeSolutionCalculator()
        let diceRoll = [1, 4, 6, 2, 2]
        
        let solutions = sut.availableSolutions(for: diceRoll)
        
        XCTAssertEqual(solutions.count, 5)
        XCTAssertEqual(solutions.solutionDescriptionForTest(), "{aces:1,twos:4,fours:4,sixes:6,ch:15}")
    }
    
    func testDiceRollOf6_6_6_2_2Returns5Solutions() {
        
        sut = YahtzeeSolutionCalculator()
        let diceRoll = [6, 6, 6, 2, 2]
        
        let solutions = sut.availableSolutions(for: diceRoll)
        
        XCTAssertEqual(solutions.count, 5)
        XCTAssertEqual(solutions.solutionDescriptionForTest(), "{twos:4,sixes:18,3ofk:22,fh:25,ch:22}")
    }
    
    func testDiceRollOf6_6_6_6_3Returns5Solutions() {
        
        sut = YahtzeeSolutionCalculator()
        let diceRoll = [6, 6, 6, 6, 3]
        
        let solutions = sut.availableSolutions(for: diceRoll)
        
        XCTAssertEqual(solutions.count, 5)
        XCTAssertEqual(solutions.solutionDescriptionForTest(), "{threes:3,sixes:24,3ofk:27,4ofk:27,ch:27}")
    }
    
    func testDiceRollOf6_2_6_1_6Returns5Solutions() {
        
        sut = YahtzeeSolutionCalculator()
        let diceRoll = [6, 2, 6, 1, 6]
        
        let solutions = sut.availableSolutions(for: diceRoll)
        
        XCTAssertEqual(solutions.count, 5)
        XCTAssertEqual(solutions.solutionDescriptionForTest(), "{aces:1,twos:2,sixes:18,3ofk:21,ch:21}")
    }
    
    func testDiceRollOf1_2_3_5_6Returns7Solutions() {
        
        sut = YahtzeeSolutionCalculator()
        let diceRoll = [1, 2, 3, 5, 6]
        
        let solutions = sut.availableSolutions(for: diceRoll)
        
        XCTAssertEqual(solutions.count, 7)
        XCTAssertEqual(solutions.solutionDescriptionForTest(), "{aces:1,twos:2,threes:3,fives:5,sixes:6,ss:30,ch:17}")
    }
    
    func testDiceRollOf6_5_1_4_2Returns7Solutions() {
        
        sut = YahtzeeSolutionCalculator()
        let diceRoll = [6, 5, 1, 4, 2]
        
        let solutions = sut.availableSolutions(for: diceRoll)
        
        XCTAssertEqual(solutions.count, 7)
        XCTAssertEqual(solutions.solutionDescriptionForTest(), "{aces:1,twos:2,fours:4,fives:5,sixes:6,ss:30,ch:18}")
    }
    
    func testDiceRollOf1_2_4_5_6Returns7Solutions() {
        
        sut = YahtzeeSolutionCalculator()
        let diceRoll = [1, 2, 4, 5, 6]
        
        let solutions = sut.availableSolutions(for: diceRoll)
        
        XCTAssertEqual(solutions.count, 7)
        XCTAssertEqual(solutions.solutionDescriptionForTest(), "{aces:1,twos:2,fours:4,fives:5,sixes:6,ss:30,ch:18}")
    }
    
    func testDiceRollOf1_2_3_4_6Returns7Solutions() {
        
        sut = YahtzeeSolutionCalculator()
        let diceRoll = [1, 2, 3, 4, 6]
        
        let solutions = sut.availableSolutions(for: diceRoll)
        
        XCTAssertEqual(solutions.count, 8)
        XCTAssertEqual(solutions.solutionDescriptionForTest(), "{aces:1,twos:2,threes:3,fours:4,sixes:6,ss:30,ls:40,ch:16}")
    }
    
    func testDiceRollOf1_1_2_3_4Returns6Solutions() {
        
        sut = YahtzeeSolutionCalculator()
        let diceRoll = [1, 1, 2, 3, 4]
        
        let solutions = sut.availableSolutions(for: diceRoll)
        
        XCTAssertEqual(solutions.count, 7)
        XCTAssertEqual(solutions.solutionDescriptionForTest(), "{aces:2,twos:2,threes:3,fours:4,ss:30,ls:40,ch:11}")
    }
}

extension Array where Element == Solution {
    func solutionDescriptionForTest() -> String {
        var description = "{"
        
        for element in self {
            description += "\(element.type):\(element.score),"
        }
        description.remove(at: description.index(before: description.endIndex))
        
        description += "}"
        return description
    }
}
