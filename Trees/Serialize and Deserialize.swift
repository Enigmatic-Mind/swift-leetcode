//
//  Serialize and Deserialize.swift
//  NeetCode
//
//  Created by Francisco on 6/29/26.
//

/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var res = ""
        
        func preorderDFS(_ node: TreeNode?) {
            guard let node else {
                res.append("nil,")
                return
            }
            
            res.append("\(node.val),")
            preorderDFS(node.left)
            preorderDFS(node.right)
        }
        
        preorderDFS(root)
        res.removeLast()
        return res
    }

    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        var nodes = Array(data.components(separatedBy: ",").reversed())
        
        let root = preorderDFS()
        
        func preorderDFS() -> TreeNode? {
            guard nodes.count != 0 else {
                return nil
            }
            
            let nodeVal = nodes.removeLast()
            
            if nodeVal == "nil" {
                return nil
            }
            
            let node = TreeNode(Int(nodeVal) ?? 0)
            node.left = preorderDFS()
            node.right = preorderDFS()
            return node
        }
        
        return root
    }
}

// Time complexity: O(n) for both
// Space complexity: O(n) for both
