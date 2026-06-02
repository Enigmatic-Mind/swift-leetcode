//
//  Duplicate-Number.swift
//  NeetCode
//
//  Created by Francisco on 6/2/26.
//

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0
        var fast = 0
        
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast
                    
        var slow2 = 0
        
        repeat {
            slow2 = nums[slow2]
            slow = nums[slow]
        } while slow != slow2
        
        return slow
    }
}

/*
 Time complexity: O(n) - slow pointer travels at most p + c steps total
 Space complexity: O(1)
 */

/*
 Explanation:
 - cycle dectection to find the intersection point (since cycle is guaranteed with n+1 values)
 - two slow pointers to find duplicate number (start of cycle)
 
 Let:
 p = distance from start to cycle entrance
 c = cycle length
 x = distance from cycle entrance to meeting point

 When they meet:
 slow traveled: p + x
 fast traveled: p + x + nc (fast did n extra full loops)
 
 2(p + x) = p + x + nc
 2p + 2x = p + x + nc
 p + x = nc
 p = nc - x
 p = (n-1)c + (c - x)
 
 p equals some full loops plus the remaining distance to the entrance.
 
 If you reset one pointer to index 0 and move both at speed 1.. one travels p steps to reach the entrance, the other travels (n-1)c + (c-x) steps which also lands exactly at the entrance.

 
 */
