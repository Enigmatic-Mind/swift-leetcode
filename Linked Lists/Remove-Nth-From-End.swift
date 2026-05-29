//
//  Remove-Nth-From-End.swift
//  NeetCode
//
//  Created by Francisco on 5/29/26.
//

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var numNodes = 0
        var currCounter = head
        while currCounter != nil {
            currCounter = currCounter?.next
            numNodes += 1
        }
        
        
        var newList: ListNode? = ListNode(0)
        newList?.next = head
        
        var curr = newList
        var i = -1
        while i < numNodes - n - 1 {
            curr = curr?.next
            i += 1
        }
        
        curr?.next = curr?.next?.next
        
        return newList?.next
    }
}

/*
 Time: 25m
 Time Complexity: O(n) -> two passes through the list
 Space Complexity: O(1) -> using input
 */
