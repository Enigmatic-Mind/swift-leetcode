//
//  Untitled.swift
//  NeetCode
//
//  Created by Francisco on 5/18/26.
//

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var daysFrom = [Int]()
        
        for i in 0..<temperatures.count {
            let currTemp = temperatures[i]
            
            var days = 0
            if i+1 < temperatures.count {
                var tempDays = 0
                for temp in temperatures[(i+1)...] {
                    tempDays += 1
                    if temp > currTemp {
                        days = tempDays
                        breakt
                    }
                }
            }
            daysFrom.append(days)
        }

        return daysFrom
    }
}





/*
 Time: 45 mins
 Time Complexity: O(1) -> all operations are working from the top
 Space Complexity: O(n) -> two stacks so 2n
 */
