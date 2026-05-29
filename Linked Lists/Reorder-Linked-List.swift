//
//  Reorder-Linked-List.swift
//  NeetCode
//
//  Created by Francisco on 5/28/26.
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
    func reorderList(_ head: ListNode?) {
        
        // Find middle
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        var listToReverse = slow?.next
        
        // slow points to end of list
        slow?.next = nil
        
        // Reverse second half
        var reversedList: ListNode? = nil
        var curr = listToReverse
        
        while curr != nil {
            let list = curr?.next
            curr?.next = reversedList
            reversedList = curr
            curr = list
        }
        
        // Merge
        var mergeHead = head
        var currReversed = reversedList
        while currReversed != nil {
            let list = mergeHead?.next
            let rList = currReversed?.next
            
            mergeHead?.next = currReversed
            mergeHead = mergeHead?.next
            mergeHead?.next = list
            mergeHead = mergeHead?.next
            currReversed = rList
        }
    }
}

/*
 Time: 2+ hours. Conceptually the problem was easy at a high level. Implementation w all the optional pointers was tripping me up.
 Time Complexity: O(n) -> two (or three if you consider find middle and reverse separate) passes through the list
 Space Complexity: O(1) -> not storing any extra nodes
 */
