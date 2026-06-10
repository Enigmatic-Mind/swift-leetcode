//
//  Min-Window-Substring.swift
//  NeetCode
//
//  Created by Francisco on 5/26/26.
//

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var needCount = [Character: Int]()
        var haveCount = [Character: Int]()
        var need = 0
        var have = 0
        var result = [Character]()
        var left = 0
        
        for char in t {
            needCount[char, default: 0] += 1
        }
        need = needCount.count
        
        let sChars = Array(s)
        for i in 0..<sChars.count {
            let currChar = sChars[i]
            
            haveCount[currChar, default: 0] += 1
            if needCount[currChar] != nil && haveCount[currChar, default: 0] == needCount[currChar] {
                have += 1
            }
            
            while have == need {
                // update min substring
                if result.isEmpty || (i - left + 1) < result.count {
                    result = Array(sChars[left ... i])
                }
                
                haveCount[sChars[left], default: 0] -= 1
                if needCount[sChars[left]] != nil && haveCount[sChars[left], default: 0] < needCount[sChars[left], default: 0] {
                    have -= 1
                }
                
                left += 1
            }
        }
        return String(result)
    }
}


// Time complexity: O(m + n) -> need count and sliding window over s
// Space complexity: O(n) -> dicts are 26 characters but in swift we need Array(s) and result so O(n)
