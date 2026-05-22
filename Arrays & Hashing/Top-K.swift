//
//  Top-K.swift
//  NeetCode
//
//  Created by Francisco on 5/22/26.
//

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqDict = [Int : Int]()
        for num in nums {
            freqDict[num, default: 0] += 1
        }
        
        let vals = freqDict.keys.sorted { freqDict[$0]! > freqDict[$1]! }
        return Array(vals[..<k])
    }
}

/*
 First Answer
 Time: 15 mins
 Time Complexity: O(n log n) -> sorting dominates
 Space Complexity: O(n) -> storing a multiple of n values
 */
