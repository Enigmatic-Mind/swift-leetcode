//
//  Sliding Window Max.swift
//  NeetCode
//
//  Created by Francisco on 6/10/26.
//

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var list = [Int]()
        
        list.append(nums[0..<k].max() ?? 0)
        
        var left = 1
        for i in k..<nums.count {
            list.append(nums[left...i].max() ?? 0)
            left += 1
        }
        
        return list
    }
}


// Time complexity: O(n * k)
// Space complexity: O(1) (no auxiliary space used)
