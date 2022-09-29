//
//  YahtzeeSolutionCalculator.swift
//  tdd_tech_grad_dice
//
//  Created by Matthew Glover on 29/09/2022.
//

import Foundation

struct Solution {
    let type: String
    let score: Int
}

class YahtzeeSolutionCalculator {
    
    func availableSolutions(for diceRoll: [Int]) -> [Solution] {
        
        var solutions: [Solution] = []
        
        for (index, diceOption) in ["aces", "twos", "threes", "fours", "fives", "sixes"].enumerated() {
            if let upperSectionSolution = upperSectionSolutions(for: diceRoll, number: index + 1, type: diceOption) {
                solutions.append(upperSectionSolution)
            }
        }
        
        for diceOption in ["3ofk", "4ofk", "fh", "ss", "ls", "yz", "ch"] {
            if let lowerSectionSolution = lowerSectionSolutions(for: diceRoll, type: diceOption) {
                solutions.append(lowerSectionSolution)
            }
        }
        
        return solutions
    }
    
    private func upperSectionSolutions(for diceRoll: [Int], number: Int, type: String) -> Solution? {
        guard diceRoll.firstIndex(of: number) != nil else { return nil }
        var score = 0
        for roll in diceRoll {
            if roll == number {
                score += number
            }
        }
        
        return Solution(type: type, score: score)
    }
    
    private func lowerSectionSolutions(for diceRoll: [Int], type: String) -> Solution? {
        
        var score = 0
        
        switch type {
        case "3ofk":
            score = is3OfKind(diceRoll: diceRoll) ? diceRoll.reduce(0, +) : 0
        case "4ofk":
            score = is4OfKind(diceRoll: diceRoll) ? diceRoll.reduce(0, +) : 0
        case "fh":
            score = isFullHouse(diceRoll: diceRoll) ? 25 : 0
        case "ss":
            score = isSmallStraight(diceRoll: diceRoll) ? 30 : 0
        case "ls":
            score = isLargeStraight(diceRoll: diceRoll) ? 40 : 0
        case "yz":
            score = isYahtzee(diceRoll: diceRoll) ? 50 : 0
        case "ch":
            score = diceRoll.reduce(0, +)
        default:
            return nil
        }
        
        guard score > 0 else { return nil }
        
        return Solution(type: type, score: score)
    }
    
    private func is3OfKind(diceRoll: [Int]) -> Bool {
        var result = false
        for occurance in occuranceDict(for: diceRoll) {
            if occurance.value >= 3 {
                result = true
                break
            }
        }
        return result
    }
    
    private func is4OfKind(diceRoll: [Int]) -> Bool {
        var result = false
        for occurance in occuranceDict(for: diceRoll) {
            if occurance.value >= 4 {
                result = true
                break
            }
        }
        return result
    }
    
    private func isFullHouse(diceRoll: [Int]) -> Bool {
        var result = false
        let occurances = occuranceDict(for: diceRoll)
        if occurances.count == 2 {
            if occurances.first?.value == 2 || occurances.first?.value == 3 {
                result = true
            }
        }

        return result
    }
    
    private func isSmallStraight(diceRoll: [Int]) -> Bool {
        
        var result = false
        let sortedDiceRoll = diceRoll.sorted()
        
        if sortedDiceRoll[2] - sortedDiceRoll[1] == 1 && sortedDiceRoll[1] - sortedDiceRoll[0] == 1 ||
           sortedDiceRoll[3] - sortedDiceRoll[2] == 1 && sortedDiceRoll[2] - sortedDiceRoll[1] == 1 ||
           sortedDiceRoll[4] - sortedDiceRoll[3] == 1 && sortedDiceRoll[3] - sortedDiceRoll[2] == 1 {
            result = true
        }
        
        return result
    }
    
    private func isLargeStraight(diceRoll: [Int]) -> Bool {
        var result = false
        let sortedDiceRoll = diceRoll.sorted()
        
        if sortedDiceRoll[3] - sortedDiceRoll[2] == 1 && sortedDiceRoll[2] - sortedDiceRoll[1] == 1 && sortedDiceRoll[1] - sortedDiceRoll[0] == 1 ||
            sortedDiceRoll[4] - sortedDiceRoll[3] == 1 && sortedDiceRoll[3] - sortedDiceRoll[2] == 1 && sortedDiceRoll[2] - sortedDiceRoll[1] == 1 {
            result = true
        }
        
        return result
    }
    
    private func isYahtzee(diceRoll: [Int]) -> Bool {
        let diceRollWithRemovedDuplicates = Set<Int>(diceRoll)
        return diceRollWithRemovedDuplicates.count == 1
    }
    
    private func occuranceDict(for diceRoll: [Int]) -> [Int:Int] {
        var occurences: [Int:Int] = [:]
        
        for roll in diceRoll {
            if let occurenceCount = occurences[roll] {
                occurences[roll] = occurenceCount + 1
            } else {
                occurences[roll] = 1
            }
        }
        
        return occurences
    }
}


