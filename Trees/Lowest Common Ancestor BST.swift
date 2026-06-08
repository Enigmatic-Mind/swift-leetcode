//
//  Lowest Common Ancestor BST.swift
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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if let p, let q, let root {
            if (p.val > root.val && q.val < root.val) || (p.val < root.val && q.val > root.val) {
                return root
            } else if p.val <= root.val && q.val <= root.val {
                if p.val == root.val || q.val == root.val { return root }
                return lowestCommonAncestor(root.left, p, q)
            } else { // p.val >= root.val && q.val >= root.val
                if p.val == root.val || q.val == root.val { return root }
                return lowestCommonAncestor(root.right, p, q)
            }
        }
        
        return nil
    }
}

// Cleaner solution by Claude:
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root, let p, let q else { return nil }
    
    // if either node is the current node, this is the LCA
    if p.val == root.val || q.val == root.val { return root }
    
    // if they split, this is the LCA
    if (p.val - root.val) * (q.val - root.val) < 0 { return root }
    
    // both on the left
    if p.val < root.val {
        return lowestCommonAncestor(root.left, p, q)
    }
    
    // both on the right
    return lowestCommonAncestor(root.right, p, q)
}

// Time complexity: O(log n) if balanced BST, O(n) worst case
// Space complexity: O(log n) if balanced BST, O(n) worst case
