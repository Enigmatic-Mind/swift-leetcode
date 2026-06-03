//
//  LRU-Cache.swift
//  NeetCode
//
//  Created by Francisco on 6/3/26.
//

class LRUCache {
    class Node {
        var key: Int
        var val: Int
        var prev: Node?
        var next: Node?
        
        init(key: Int, val: Int) {
            self.key = key
            self.val = val
        }
    }
    
    var capacity: Int
    var dict: [Int: Node] = [:]
    var head: Node?
    var tail: Node?
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            guard node !== tail else { return node.val }
            
            // move the node
            let prev = node.prev
            let next = node.next
            
            if prev == nil { head = next }
            
            next?.prev = prev
            prev?.next = next
            
            tail?.next = node
            node.prev = tail
            node.next = nil
            tail = tail?.next
            
            return node.val
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        // if key in dict, update value and list
        if let node = dict[key] {
                guard node !== tail else {
                    node.val = value
                    return
                }

            let prev = node.prev
            let next = node.next
            
            next?.prev = prev
            prev?.next = next
            
            if prev == nil { head = next }
            
            node.val = value
            tail?.next = node
            node.prev = tail
            node.next = nil
            tail = tail?.next
                        
        } else { // add to end of the list and dict
            let node = Node(key: key, val: value)
            if head == nil && tail == nil {
                head = node
                tail = node
            } else {
                tail?.next = node
                tail?.next?.prev = tail
                tail = tail?.next
            }
            dict[key] = node
        }
        
        // if capacity over, remove
        if dict.keys.count > capacity {
            let lruNode = head!
            dict[lruNode.key] = nil
            
            head = head?.next
            head?.prev = nil
        }
        
    }
}


// Time complexity: O(1)
// Space Complexity: O(n)
