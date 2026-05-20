//
//  Untitled.swift
//  NeetCode
//
//  Created by Francisco on 5/18/26.
//

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for paren in s {
            if paren == "[" || paren == "(" || paren == "{" {
                stack.append(paren)
            } else if paren == "]" || paren == ")" || paren == "}" {
                if let value = stack.popLast() {
                    switch paren {
                    case "]":
                        if value != "[" { return false }
                    case ")":
                        if value != "(" { return false }
                    case "}":
                        if value != "{" { return false }
                    default:
                        return false
                    }
                } else {
                    return false
                }
            }
        }
        return stack.count == 0
    }
    
    // Cleaner solution:
    func isValidClaude(_ s: String) -> Bool {
        var stack = [Character]()
        let map: [Character: Character] = [")": "(", "]": "[", "}": "{"]
        
        for char in s {
            if let match = map[char] {
                if stack.removeLast() != match { return false }
            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}



/*
 Time: 13 mins
 Time Complexity: O(n) -> only one pass
 Space Complexity: O(n) -> have to store array
 */
