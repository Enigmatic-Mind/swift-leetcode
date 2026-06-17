//
//  Single Number.swift
//  NeetCode
//
//  Created by Francisco on 6/17/26.
//

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for n in nums {
            result = n ^ result
        }
        return result
    }
}

/*
 n^0 = n -> left with ones and unique bit
 even number of ones -> 0
 unique bit ^ 0 = unique bit
 */

// Time complexity: O(n)
// Space complexity: O(1)
