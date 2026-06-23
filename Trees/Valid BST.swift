//
//  Valid BST.swift
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let node = root else { return true }

        return isValid(root, nil, nil)
    }
    
    func isValid(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let root = root else { return true }
            
        if let min, root.val <= min { return false }
        if let max, root.val >= max { return false }
        
        return isValid(root.left, min, root.val) && isValid(root.right, root.val, max)
    }
}


// Time complexity: O(n)
// Space complexity: O(h) where h is n in skewed case and log n in balanced case
