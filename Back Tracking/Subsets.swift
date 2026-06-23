//
//  Subsets.swift
//  NeetCode
//
//  Created by Francisco on 6/23/26.
//

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        
        var subset = [Int]()
        func dfs(_ index: Int) {
            if index >= nums.count {
                result.append(subset)
                return
            }
            
            subset.append(nums[index])
            dfs(index + 1)
            
            subset.removeLast()
            dfs(index + 1)
        }

        dfs(0)
        return result
    }
}
