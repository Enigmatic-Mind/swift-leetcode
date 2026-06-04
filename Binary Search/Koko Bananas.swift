//
//  Koko Bananas.swift
//  NeetCode
//
//  Created by Francisco on 6/4/26.
//

class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        let largestPileCount = piles.max()!
        
        if piles.count == h {
            return largestPileCount
        } else {
            let pileRate = Double(h) / Double(piles.count)
            let upperK = Int(ceil(Double(largestPileCount) / pileRate))
            
            var left = 1
            var right = upperK
            var result = right
            
            while left <= right {
                let mid = left + (right - left) / 2
                
                if hoursNeeded(piles, mid) <= h {
                    result = mid // mid works, save and try smaller
                    right = mid - 1
                } else {
                    left = mid + 1 // mid too slow, need faster
                }
            }
            return result
        }
    }
    
    func hoursNeeded(_ piles: [Int], _ k: Int) -> Int {
        var total = 0
        for pile in piles {
            total += Int(ceil(Double(pile) / Double(k)))
        }
        return total
    }
}

// Time Complexity: O(n log k) -> binary search through K * hours needed n piles
// Space Complexity: O(1)
