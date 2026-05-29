//
//  3Sum.swift
//  NeetCode
//
//  Created by Francisco on 5/29/26.
//

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var distinctSets = Set<[Int]>()
        for i in nums[0...nums.count-3].indices {
            for j in nums[i+1...nums.count-2].indices {
                for k in nums[j+1...nums.count-1].indices {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        let temp = [nums[i], nums[j], nums[k]].sorted()
                        distinctSets.insert(temp)
                    }
                }
            }
        }
        
        return Array(distinctSets)
    }
}

/*
 Non optimal
 Time:
 Time Complexity: O(n^3)
 Space Complexity: O(n) if you count the output
 */
