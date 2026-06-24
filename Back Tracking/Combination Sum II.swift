//
//  Combination Sum II.swift
//  NeetCode
//
//  Created by Francisco on 6/24/26.
//

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results = [[Int]]()
        var subset = [Int]()
        
        let candidates = candidates.sorted()  // sort first

        func dfs(_ index: Int, _ remaining: Int) {
            var index = index

            if remaining == 0 {
                results.append(subset)
                return
            }
            if index >= candidates.count || remaining < 0 {
                return
            }
            
            subset.append(candidates[index])
            dfs(index + 1, remaining - candidates[index])
            
            subset.removeLast()
            while index + 1 < candidates.count && candidates[index] == candidates[index + 1] {
                index += 1
            }
            
            dfs(index + 1, remaining)
        }
        
        dfs(0, target)
        return results
    }
}

// Time complexity: O(2^n)
// Space complexity: O(n) extra space but O(n * 2^n) total space

