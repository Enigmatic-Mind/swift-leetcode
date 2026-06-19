//
//  Count Good Nodes.swift
//  NeetCode
//
//  Created by Francisco on 6/19/26.
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
    func goodNodes(_ root: TreeNode?) -> Int {

        return isGood(root, nil)
    }
    
    func isGood(_ node: TreeNode?, _ max: Int?) -> Int {
        guard let node else { return 0 }
        
        var isGreater = false
        var max = max
        
        if node.val >= max ?? Int.min {
            isGreater = true
            max = node.val
        }
        
        return isGood(node.left, max) + isGood(node.right, max) + (isGreater ? 1 : 0)
    }
}

// Time complexity: O(n) each node visited
// Space complexity: O(h) where h is n if unbalanced or log n if balanced
