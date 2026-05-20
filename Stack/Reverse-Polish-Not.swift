//
//  Untitled.swift
//  NeetCode
//
//  Created by Francisco on 5/18/26.
//

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var tokenStack = [Int]()
        var result = 0
        
        func evaluateOperation(val1: Int, val2: Int, op: String) -> Int {
            switch op {
            case "+": return val1 + val2
            case "-": return val1 - val2
            case "/": return val1 / val2
            case "*": return val1 * val2
            default: return 0
            }
        }
        
        for token in tokens {
            if let val = Int(token) {
                tokenStack.append(val)
            } else {
                let val2 = tokenStack.removeLast()
                let val1 = tokenStack.removeLast()
                tokenStack.append(evaluateOperation(val1: val1, val2: val2, op: token))
            }
        }
        
        return tokenStack.removeLast()
        
    }
}






/*
 Time: 33 mins
 Time Complexity: O(n) -> going through the array
 Space Complexity: O(n) -> store half the array in a stack
 */
