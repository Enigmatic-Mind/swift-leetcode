//
//  Construct Binary Tree.swift
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty || inorder.isEmpty { return nil }
        
        let root = TreeNode(preorder[0])
        let mid = inorder.firstIndex(of: preorder[0])!
        
        root.left = buildTree(Array(preorder[1..<mid+1]), Array(inorder[0..<mid]))
        root.right = buildTree(Array(preorder[(mid+1)...]), Array(inorder[(mid+1)...]))
        
        return root
    }
}

// Time complexity: O(n^2) - n nodes + mid val search each call
// Space complexity: O(n^2) - n levels, each holds a copy of the sub level
