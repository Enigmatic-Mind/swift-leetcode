//
//  House Robber.swift
//  NeetCode
//
//  Created by Francisco on 7/7/26.
//

class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }

        var rob2Ago = 0
        var rob1Ago = 0
        
        for i in 0..<nums.count {
            let curr = max(rob2Ago + nums[i], rob1Ago)
            rob2Ago = rob1Ago
            rob1Ago = curr
        }
        
        return max(rob1Ago, rob2Ago)
    }
}

