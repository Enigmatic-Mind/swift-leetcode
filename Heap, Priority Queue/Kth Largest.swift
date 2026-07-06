//
//  Kth Largest.swift
//  NeetCode
//
//  Created by Francisco on 7/6/26.
//

// Non-optimal
class KthLargest {
    var queue: [Int]
    var k: Int

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        queue = nums.sorted()
    }

    func add(_ val: Int) -> Int {
        queue.append(val)
        queue.sort()
        return queue[queue.count - k]
    }
}




import Collections

class KthLargest {
    var heap: Heap<Int>
    var k: Int
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        heap = Heap(nums)
        while heap.count > k {
            _ = heap.popMin()
        }
        
    }

    func add(_ val: Int) -> Int {
        heap.insert(val)
        if heap.count > k {
            _ = heap.popMin()
        }
        return heap.min!
    }
}

// Time:
// - init - O(n + (n-k)*logn)
// - insert - O(log n)
// Space: O(k)
