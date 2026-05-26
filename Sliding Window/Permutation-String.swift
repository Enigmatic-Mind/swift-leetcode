//
//  Permutation-String.swift
//  NeetCode
//
//  Created by Francisco on 5/26/26.
//

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var s1Dict = [Character: Int]()
        var s2Dict = [Character: Int]()
        var left = 0
        
        let s1Chars = Array(s1)
        let s2Chars = Array(s2)
        
        for char in s1Chars {
            s1Dict[char, default: 0] += 1
        }
        
        for i in s2Chars.indices {
            s2Dict[s2Chars[i], default: 0] += 1
            
            if (i - left + 1) > s1Chars.count {
                s2Dict[s2Chars[left], default: 0] -= 1
                if s2Dict[s2Chars[left]]! <= 0 { s2Dict[s2Chars[left]] = nil }
                left += 1
            }
            
            if s1Dict == s2Dict { return true }
        }
        
        return false
    }
}

/*
 Time: 35m
 Time Complexity: O(n + m) -> making strings into arrays for both AND also traversing array of m entries. Simplifies to O(n + m)
 Space Complexity: O(n + m) -> making strings into arrays. Dicts store at most 26 entries.
 */
