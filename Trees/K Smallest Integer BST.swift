//
//  K Smallest Integer BST.swift
//  NeetCode
//
//  Created by Francisco on 6/22/26.
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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var count = 0
        var result = 0
        
        func inorder(_ node: TreeNode?) {
            guard let node = node else { return }
            guard count < k else { return }
            
            inorder(node.left)
            
            count += 1
            if count == k {
                result = node.val
                return
            }
            
            inorder(node.right)
        }
        
        inorder(root)
        return result
    }
}

// Time complexity: O(k) - visit k nodes
// Space complexity: On) - when k = n (the largest element)
