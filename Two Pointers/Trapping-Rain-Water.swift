//
//  Trapping-Rain-Watter.swift
//  NeetCode
//
//  Created by Francisco on 5/18/26.
//

class Solution {
    func trap(_ height: [Int]) -> Int {
        var left_wall = [Int]()
        var max_left_height = 0
        
        for i in 0..<height.count {
            if height[i] > max_left_height { max_left_height = height[i] }
            left_wall.append(max_left_height)
        }
        
        var right_wall = Array(repeating: 0, count: height.count)
        var max_right_height = 0
        
        for i in stride(from: height.count - 1, through: 0, by: -1) {
            if height[i] > max_right_height { max_right_height = height[i] }
            right_wall[i] = max_right_height
        }
        
        var water = 0
        for i in 0..<height.count {
            water += (min(left_wall[i], right_wall[i]) - height[i])
        }
        
        return water
    }
}

/*
 Time: 1h 45m
 Time Complexity: O(n) -> 3n for walls + water compute
 Space Complexity: O(n) -> left_wall & right_wall
 */

// TODO: optimized two pointer solution
