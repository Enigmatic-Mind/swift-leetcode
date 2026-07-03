//
//  Palindrome Partitioning.swift
//  NeetCode
//
//  Created by Francisco on 7/3/26.
//

class Solution {
    func partition(_ s: String) -> [[String]] {
        var charArray = Array(s) // O(n)
        var result = [[String]]()
        var part = [String]()


        func dfs(_ index: Int) {
            if index >= charArray.count {
                result.append(part)
                return
            }

            for end in index..<charArray.count { // O(n)
                if isPalindrome(index, end) { // O(n)
                    part.append(String(charArray[index...end]))
                    dfs(end+1)
                    part.removeLast()
                }

            }

        }

        func isPalindrome(_ start: Int, _ end: Int) -> Bool {
            var left = start
            var right = end
            while left < right {
                if charArray[left] != charArray[right] { return false }
                left += 1
                right -= 1
            }
            return true
        }


        dfs(0)
        return result
    }
}

// Time: O(n * 2^n)
// Space: O(n) aux space
