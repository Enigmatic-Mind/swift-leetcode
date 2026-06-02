//
//  Binary Search.swift
//  NeetCode
//
//  Created by Francisco on 6/2/26.
//

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var index = -1
        var lower = 0
        var upper = nums.count - 1
        repeat {
            let middle = (upper + lower) / 2
            if nums[middle] == target {
                index = middle
                return index
            } else if target > nums[middle] {
                lower = middle
            } else { // target <= nums[middle]
                upper = middle
            }
        } while lower < upper
        
        return index
    }
}
