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
    
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqDict = [Int : Int]()
        for num in nums {
            freqDict[num, default: 0] += 1
        }
        
        var buckets = Array(repeating: [Int](), count: nums.count + 1)
        for (num, freq) in freqDict {
            buckets[freq].append(num)
        }
        
        var topK = [Int]()

        for i in buckets.indices.reversed() {
            for val in buckets[i] {
                if topK.count < k {
                    topK.append(val)
                }
            }
            
            if topK.count == k {
                return topK
            }
            
        }
        
        return topK
    }
}

/*
 First Answer
 Time: 15 mins
 Time Complexity: O(n log n) -> sorting dominates
 Space Complexity: O(n) -> dictionary and sorted array each store up to n elements, combined space is still linear.
 
 Bucket sort
 Time: 25 mins
 Time Complexity: O(n) -> going through n elements in freq counting, dict to buckets, and top k
 Space Complexity: O(n) -> data stored in dict, buckets array, and top k.
 */
