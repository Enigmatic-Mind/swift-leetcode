//
//  Untitled.swift
//  NeetCode
//
//  Created by Francisco on 5/18/26.
//

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var charArray = Array(s)
        var leftPtr = 0
        var windowDict = [Character : Int]()
        var maxWindowSize = 0
        
        for i in charArray.indices {
            windowDict[charArray[i], default: 0] += 1
            while (i - leftPtr + 1) - maxFreq(windowDict) > k {
                windowDict[charArray[leftPtr], default: 0] -= 1
                leftPtr += 1
            }
            
            if (i - leftPtr + 1) > maxWindowSize {
                maxWindowSize = i - leftPtr + 1
            }
        }
        return maxWindowSize
    }
    
    func maxFreq(_ dict: [Character: Int]) -> Int {
        var maxFreq = 0
        
        for value in dict.values {
            if value > maxFreq {
                maxFreq = value
            }
        }
        
        return maxFreq
    }
}

/*
 Time: 30m
 Time Complexity: O(n) -> only 26 uppercase english characters so O(26n) is just O(n)
 Space Complexity: O(1) -> storing a max of 26 characters in dict
 */
