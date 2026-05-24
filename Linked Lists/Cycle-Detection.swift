//
//  Cycle-Detection.swift
//  NeetCode
//
//  Created by Francisco on 5/24/26.
//

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var visited = Set<ObjectIdentifier>()
        var curr = head

        while curr != nil {
            let id = ObjectIdentifier(curr!)
            if visited.contains(id) {
                return true
            }
            visited.insert(id)
            curr = curr?.next
        }
        return false
    }
}

/*
 Time: 5m
 Time complexity: O(n) -> visiting all nodes
 Space complexity: O(n) -> storing all nodes in a set
 
 */
