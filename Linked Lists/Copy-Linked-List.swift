//
//  Copy-Linked-List.swift
//  NeetCode
//
//  Created by Francisco on 5/29/26.
//

/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var curr = head
        var nodeArray = [Node]()
        while curr != nil {
            if let node = curr {
                nodeArray.append(Node(node.val))
            }
            
            curr = curr?.next
        }
        
        for i in nodeArray.indices.reversed() {
            if i != 0 {
                nodeArray[i-1].next = nodeArray[i]
            }
        }
        
        curr = head
        var i = 0
        while curr != nil {
            if let node = curr {
                nodeArray[i].random = node.random
            }
            
            i += 1
            curr = curr?.next
        }
        
        return nodeArray.first
    }
}
