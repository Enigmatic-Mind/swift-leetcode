//
//  Balanced Tree.swift
//  NeetCode
//
//  Created by Francisco on 6/6/26.
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        
        var isBalanced = true
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }
            
            let left = dfs(node.left)
            let right = dfs(node.right)
            
            if abs(left - right) > 1 { isBalanced = false}
            
            return max(left, right) + 1
        }
        
        dfs(root)
        
        return isBalanced
    }
}

// Time complexity: O(n)
// Space complexity: O(h), h = n if unbalanced, h = log n if balanced
