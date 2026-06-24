//
//  Combination Sum.swift
//  NeetCode
//
//  Created by Francisco on 6/24/26.
//

class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var results = [[Int]]()
        var subset = [Int]()
        
        func dfs(_ index: Int, _ remaining: Int) {
            
            if remaining == 0 {
                results.append(subset)
                return
            }
            
            if remaining < 0 || index >= nums.count {
                return
            }
            
            subset.append(nums[index])
            dfs(index, remaining - nums[index])
            
            subset.removeLast()
            dfs(index + 1, remaining)
            
        }
        
        dfs(0, target)
        return results
    }
}

// Time complexity: O(2^target) -> each step, you make 2 choices and depth is bounded by t because each number is at least 1
// Space complexity: O(t)
