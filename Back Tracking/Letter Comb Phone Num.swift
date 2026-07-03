//
//  Letter Comb Phone Num.swift
//  NeetCode
//
//  Created by Francisco on 7/3/26.
//

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let phoneMap = [
            "2" : ["a", "b", "c"],
            "3" : ["d", "e", "f"],
            "4" : ["g", "h", "i"],
            "5" : ["j", "k", "l"],
            "6" : ["m", "n", "o"],
            "7" : ["p", "q", "r", "s"],
            "8" : ["t", "u", "v"],
            "9" : ["w", "x", "y", "z"]
        ]
        
        let digitsArray = Array(digits)
        var currString = ""
        var result = [String]()
        
        func dfs(_ index: Int) {
            if index >= digitsArray.count {
                if !currString.isEmpty {
                    result.append(currString)
                }
                return
            }
            
            for letter in phoneMap[String(digitsArray[index])]! {
                currString += letter
                dfs(index+1)
                
                currString.removeLast()
            }
        }
        
        dfs(0)
        return result
    }
}

// Time: O(n*4^n)
// - every digit (n) has max of 4 choices
// - n copy to result array
// Insight: (branching factor)^depth * work per leaf

// Space: O(n)

