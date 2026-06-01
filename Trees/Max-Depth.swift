//
//  Max-Depth.swift
//  NeetCode
//
//  Created by Francisco on 5/29/26.
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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
                
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}

/*
 Time Complexity: O(n)
 Space Complexity: O(h) — O(log n) balanced, O(n) skewed
 */
