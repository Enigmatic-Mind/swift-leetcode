//
//  Same Binary Tree.swift
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        
        guard let p, let q else { return false }
        
        if p.val != q.val { return false }
        
        let leftCheck = isSameTree(p.left, q.left)
        let rightCheck = isSameTree(p.right, q.right)
        
        return leftCheck && rightCheck
    }
}
