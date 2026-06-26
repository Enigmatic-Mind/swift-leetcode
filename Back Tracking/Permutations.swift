//
//  Permutations.swift
//  NeetCode
//
//  Created by Francisco on 6/25/26.
//

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        var current = [Int]()
        var used = Array(repeating: false, count: nums.count)
        
        func dfs() {
            if current.count == nums.count {
                results.append(current)
                return
            }
            
            for i in 0..<nums.count {
                if used[i] { continue }
                
                current.append(nums[i])
                used[i] = true
                dfs()
                current.removeLast()
                used[i] = false
            }
        }

        dfs()

        return results
    }
}
