//
//  Products-Array-Self.swift
//  NeetCode
//
//  Created by Francisco on 5/22/26.
//

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var products = Array(repeating: 0, count: nums.count)
        
        var leftTotal = 1
        for i in nums.indices {
            products[i] = leftTotal
            leftTotal *= nums[i]
        }
        
        var rightTotal = 1
        for i in nums.indices.reversed() {
            products[i] *= rightTotal
            rightTotal *= nums[i]
        }

        return products
    }
}

/*
 Time: 7 mins
 Time Complexity: O(n) -> traversing nums twice
 Space Complexity: O(1) if you dont count the output
 */
