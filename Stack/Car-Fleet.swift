//
//  Untitled.swift
//  NeetCode
//
//  Created by Francisco on 5/18/26.
//

class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var fleetStack = [Double]()
        
        let cars = zip(position, speed)
            .sorted { $0.0 > $1.0 }  // array of (position, speed) tuples

        for (pos, spd) in cars {
            let timeToDest = Double(target - pos) / Double(spd)
            
            if !fleetStack.isEmpty {
                let prevCarTime = fleetStack[fleetStack.count - 1]
                if timeToDest > prevCarTime {
                    fleetStack.append(timeToDest)
                }
            } else {
                fleetStack.append(timeToDest)
            }
        }
        
        return fleetStack.count
    }
}



/*
 Time: 40 mins
 Time Complexity: O(n log n) -> dominated by sorting
 Space Complexity: O(n) -> zipping stores the cars
 */
