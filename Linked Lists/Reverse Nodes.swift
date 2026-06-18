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
        var root = head
        
        var prev: ListNode? = nil
        var curr = root

        var endOfPrevList: ListNode? = nil
        var startofNextList: ListNode? = root
                
        var hasUpdatedRoot = false
        var hasKNodes = true
        
        // move hold k ahead
        for i in 0..<k {
            if i == k-1 {
                hsaKNodes = startofNextList != nil
            }
            startofNextList = startofNextList?.next
        }
        
        while curr != nil && hasKNodes != nil {
            // reverse k nodes
            for i in 0..<k {
                let list = curr?.next
                curr?.next = prev
                prev = curr
                curr = list
            }
            
            if !hasUpdatedRoot {
                root = prev
                hasUpdatedRoot = true
            }
            
            // connect prev list to current set
            endOfPrevList?.next = prev
            
            // connect current set to next list
            endOfPrevList = prev
            for i in 0..<k-1 {
                endOfPrevList = endOfPrevList?.next
            }
            endOfPrevList?.next = startofNextList
            prev = nil // clear it
            
            // move hold k ahead
            for i in 0..<k {
                if i == k-1 {
                    hsaKNodes = startofNextList != nil
                }
                startofNextList = startofNextList?.next
            }
        }
        
        endOfPrevList?.next = curr
        
        return root
        
    }
}

// Time complexity: O(n)
// Space complexity: O(1)
