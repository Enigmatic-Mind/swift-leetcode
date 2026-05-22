//
//  Untitled.swift
//  NeetCode
//
//  Created by Francisco on 5/18/26.
//

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var largestArea = 0
        var rectStack = [Int]()
        
        for i in 0..<heights.count {
            
        }
        
        for rectLeft in rectStack {
            
        }
        
        return largestArea
    }
}


class Solution {
    func dailyTemperaturesNonOptimal(_ temperatures: [Int]) -> [Int] {
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
    
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var daysFrom = Array(repeating: 0, count: temperatures.count)
        var prevHighsStack = [Int]()
        
        for i in stride(from: temperatures.count - 1, through: 0, by: -1) {
            while !prevHighsStack.isEmpty && temperatures[i] >= temperatures[prevHighsStack.last!] {
                prevHighsStack.removeLast()
            }
            
            if prevHighsStack.isEmpty {
                daysFrom[i] = 0
            } else {
                daysFrom[i] = prevHighsStack.last! - i
            }
            prevHighsStack.append(i)
        }

        return daysFrom
    }
}





/*
 Time:
 Time Complexity:
 Space Complexity:
 */
