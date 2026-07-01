//
//  Generate Parentheses.swift
//  NeetCode
//
//  Created by Francisco on 6/26/26.
//

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()

        func backtrack(_ open: Int, _ close: Int, _ currString: String) {
            if currString.count == n * 2 {
                result.append(currString)
                return
            }

            if open < n {
                backtrack(open + 1, close, currString + "(")
            }

            if close < open {
                backtrack(open, close + 1, currString + ")")
            }
        }

        backtrack(0, 0, "")
        return result
    }
}

// Time: bounded by O(2^(2n)) == O(4^n) but a lot tighter with Catalan derivation
// Space: O(n) aux space
