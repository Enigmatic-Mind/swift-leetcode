//
//  Subtree Another Tree.swift
//  NeetCode
//
//  Created by Francisco on 6/8/26.
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

class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        
        func isSame(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
            if root == nil && subRoot == nil { return true }
            
            if let root, let subRoot {
                if root.val != subRoot.val { return false }
                
                let leftCheck = isSame(root.left, subRoot.left)
                if !leftCheck { return false }
                
                let rightCheck = isSame(root.right, subRoot.right)
                if !rightCheck { return false }
                
                return true
            }
            
            return false
        }
        
        if let root, let subRoot {
            if root.val == subRoot.val {
                let subTreeCheck = isSame(root, subRoot)
                if subTreeCheck { return true }
            }
            
            return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
        }
        
        return false
    }
}

// Time complexity: O(n * m) -> for each node in root (n nodes) isSame traverses all subroot (m nodes)
// Space complexity: O(h), h = log n if balanced, or n if unbalanced
