//
//  Find Min.swift
//  NeetCode
//
//  Created by Francisco on 6/4/26.
//

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        if nums[left] < nums[right] { // rotated n times
            return nums[left]
        }
        
        var result = nums[left]
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if nums[mid] <= nums[right] {
                result = min(nums[mid], result)
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return result
    }
}


