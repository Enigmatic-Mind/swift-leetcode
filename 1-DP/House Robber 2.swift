//
//  House Robber 2.swift
//  NeetCode
//
//  Created by Francisco on 7/7/26.
//

class Solution {
    func rob(_ nums: [Int]) -> Int {

        if nums.count == 1 {
            return nums[0]
        }

        func maxPath(_ nums: [Int]) -> Int {
            var prev2 = 0
            var prev1 = 0

            for i in 0..<nums.count {
                let curr = max(prev2 + nums[i], prev1)
                prev2 = prev1
                prev1 = curr
            }

            return max(prev2, prev1)
        }

        return max(maxPath(Array(nums[0..<nums.count-1])), maxPath(Array(nums[1...])))
    }
}
