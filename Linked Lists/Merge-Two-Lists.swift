//
//  Merge-Two-Lists.swift
//  NeetCode
//
//  Created by Francisco on 5/24/26.
//

import Foundation

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    // Swift parameters are constants by default
    var list1 = list1
    var list2 = list2
    
    let dummy = ListNode(0)
    var currNode = dummy
    var mergedList: ListNode? = currNode
    
    while list1 != nil || list2 != nil {
        if list1 == nil {
            currNode.next = list2
            break
        } else if list2 == nil {
            currNode.next = list1
            break
        } else if list1!.val < list2!.val {
            currNode.next = list1
            list1 = list1?.next
        } else { // list1.val >= list2.val
            currNode.next = list2
            list2 = list2?.next
        }
        currNode = currNode.next!
    }
    
    return mergedList?.next
}
