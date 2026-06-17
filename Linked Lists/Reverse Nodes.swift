//
//  Reverse Nodes.swift
//  NeetCode
//
//  Created by Francisco on 6/17/26.
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head
        var root = head
        var hold = head
        var tail : ListNode? = nil
                
        while curr != nil && hold != nil {
            // move hold k ahead
            for i in 0..<k {
                hold = hold?.next
            }
            
            // reverse k nodes
            for i in 0..<k {
                let list = curr?.next
                curr?.next = prev
                prev = curr
                curr = list
            }
            
            // point prev to k list
            
            
            // point end of k list to list
            var end: ListNode? = prev
            for i in 0..<k {
                end = end?.next
            }
            end.next = hold
            
        }
        
        return root
        
    }
}
