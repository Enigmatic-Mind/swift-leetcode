//
//  Binary Tree Max Path Sum.swift
//  NeetCode
//
//  Created by Francisco on 6/23/26.
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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = root?.val ?? 0
        
        dfs(root)
        
        return maxSum
        
        func dfs(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            
            let leftPath = dfs(root.left)
            let rightPath = dfs(root.right)
            
            let leftMax = max(leftPath, 0)
            let rightMax = max(rightPath, 0)
            
            maxSum = max(maxSum, leftMax + rightMax + root.val)
            
            return root.val + max(leftMax, rightMax)
            
        }
    }
}
