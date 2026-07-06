//
//  Min Cost Climbing Stairs.swift
//  NeetCode
//
//  Created by Francisco on 7/6/26.
//

class Solution {
    // Time: O(2^n) -> each call makes two recursive calls
    func nonOptimialminCostClimbingStairs(_ cost: [Int]) -> Int {
        func minCostPath(_ indexA: Int, _ indexB: Int) -> Int {
            var minCostPathA = 0

            if indexA < cost.count {
                minCostPathA = minCostPath(indexA + 1, indexA + 2) + cost[indexA]
            }
            
            var minCostPathB = 0
            
            if indexB < cost.count {
                minCostPathB = minCostPath(indexB + 1, indexB + 2) + cost[indexB]
            }
            
            return min(minCostPathA, minCostPathB)
        }
        return minCostPath(0, 1)
    }
    
    // Time: O(n)
    // Space: O(n)
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = Array(repeating: 0, count: cost.count)
        dp[0] = cost[0]
        dp[1] = cost[1]
        
        for i in 2..<cost.count {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        }
        
        return min(dp[cost.count - 1], dp[cost.count - 2])
    }
    
    // Time: O(n)
    // Space: O(1)
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var prev2 = cost[0]
        var prev1 = cost[1]
        
        for i in 2..<cost.count {
            let curr = min(prev1, prev2) + cost[i]
            prev2 = prev1
            prev1 = curr
        }
        
        return min(prev1, prev2)
    }
}
