
//
//  Binary Search.swift
//  NeetCode
//
//  Created by Francisco on 6/2/26.
//

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var lower = 0
        var upper = nums.count - 1
        
        while lower <= upper {
            let middle = lower + (upper - lower) / 2
            if nums[middle] == target {
                return middle
            } else if target > nums[middle] {
                lower = middle + 1
            } else { // target <= nums[middle]
                upper = middle - 1
            }
        }
        
        return -1
    }
}
