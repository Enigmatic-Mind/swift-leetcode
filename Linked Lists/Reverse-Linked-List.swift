//
//  Reverse-Linked-Lis.swift
//  NeetCode
//
//  Created by Francisco on 5/24/26.
//


import Foundation

/*
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var nodeArray = [ListNode]()
        
        var currNode = head
        while currNode != nil {
            nodeArray.append(currNode!)
            currNode = currNode?.next
        }
        
        for i in nodeArray.indices.reversed() {
            if i == 0 {
                nodeArray[i].next = nil
            } else {
                nodeArray[i].next = nodeArray[i-1]
            }
        }
        
        return nodeArray.last
    }
}

/*
 Time: 16m
 Time complexity: O(n) -> iterating over n listnodes and the n sized array.
 Space complexity: O(n) -> storing n listnodes in array
 */
