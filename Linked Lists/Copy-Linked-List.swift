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
        guard let head = head else { return nil }
        
        var curr: Node? = head
        var map = [ObjectIdentifier: Node]()
        
        while let node = curr {
            map[ObjectIdentifier(node)] = Node(node.val)
            curr = node.next
        }
        
        curr = head
        
        while let node = curr {
            let copy = map[ObjectIdentifier(node)]!
            if let next = node.next {
                copy.next = map[ObjectIdentifier(next)]
            }
            
            if let random = node.random {
                copy.random = map[ObjectIdentifier(random)]
            }
            curr = node.next
        }
        
        return map[ObjectIdentifier(head)]
    }
}


/*
 Time Complexity: O(n) -> two passes, linear time
 Space Compleixty: O(n) -> dict stores n entries
 */
