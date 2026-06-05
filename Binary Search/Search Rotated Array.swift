//
//  Search Rotated Array.swift
//  NeetCode
//
//  Created by Francisco on 6/5/26.
//

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if nums[mid] == target { return mid }
            
            if nums[left] <= nums[mid] {
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else { // nums[left] > nums[mid]
                if nums[left] <= target || target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        
        return -1
    }
}

// Time Complexity: O(log n)
// Space Complexity: O(1)
