//
//  Subsets II.swift
//  NeetCode
//
//  Created by Francisco on 6/26/26.
//

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        
        var result = [[Int]]()
        var subset = [Int]()
        
        func dfs(_ index: Int) {
            if index == nums.count {
                result.append(subset)
                return
            }

            subset.append(nums[index])
            dfs(index + 1)
            subset.removeLast()
            
            var nextIndex = index + 1
            while nextIndex < nums.count && nums[index] == nums[nextIndex] {
                nextIndex += 1
            }
            
            dfs(nextIndex)
            
        }
        
        dfs(0)
        return result
    }
}

// Time complexity: n (max array length) * 2^n (decisions)
// Space complexity: O(n)
