//
//  Climbing Stairs.swift
//  NeetCode
//
//  Created by Francisco on 6/29/26.
//

class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }

        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1 // 1 way - do nothing
        dp[1] = 1 // 1 way - take 1 step
        
        for i in 2...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        
        return dp[n]
    }
}

// Insight: only way to reach current step is sum of ways to reach previous 2 steps
// Time: O(n)
// Space: O(n)
