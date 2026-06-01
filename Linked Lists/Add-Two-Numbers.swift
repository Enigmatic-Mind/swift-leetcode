//
//  Add-Two-Numbers.swift
//  NeetCode
//
//  Created by Francisco on 6/1/26.
//

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var head: ListNode? = nil
        var curr = head
        
        var curr1 = l1
        var curr2 = l2
        
        var remainder = 0
        
        while curr1 != nil || curr2 != nil {
            var sum = remainder
            if let node1 = curr1 {
                sum += node1.val
            }
            
            if let node2 = curr2 {
                sum += node2.val
            }
            
            remainder = sum > 9 ? 1 : 0
            
            if head == nil {
                head = ListNode(sum % 10)
                curr = head
            } else {
                curr?.next = ListNode(sum % 10)
                curr = curr?.next
            }
            
            curr1 = curr1?.next
            curr2 = curr2?.next
        }
        
        if remainder > 0 {
            curr?.next = ListNode(remainder)
        }
        
        return head
    }
}

/*
 Time Complexity: O(max(n1, n2))
 Space Complexity: O(1) - no extra space beyond the output list
 */
