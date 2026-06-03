//
//  Merge-K.swift
//  NeetCode
//
//  Created by Francisco on 6/3/26.
//

/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists
        
        let head: ListNode? = ListNode(0)
        var curr = head
        
        while lists.count > 0 {
            // find min head across all lists
            var minIndex = 0
            for i in 1..<lists.count {
                if let val = lists[i]?.val, let minVal = lists[minIndex]?.val {
                    if val < minVal { minIndex = i }
                }
            }
            
            // appead to result
            curr?.next = lists[minIndex]
            curr = curr?.next
            
            // advance list
            lists[minIndex] = lists[minIndex]?.next

            // if list is now nil, remove it from lists
            if lists[minIndex] == nil {
                lists.remove(at: minIndex)
            }
        }
        
        
        return head?.next
    }
}

// Time Complexity: O(n*k), n = total number of nodes, k = number of ListNodes
// Space Complexity: O(k), k listnodes
