//
//  Binary Tree Level Order Traversal.swift
//  NeetCode
//
//  Created by Francisco on 6/17/26.
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [[Int]]() }
        var result = [[Int]]()
        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            let levelCount = queue.count
            var levelList = [Int]()

            for _ in 0..<levelCount {
                let node = queue.removeFirst()
                levelList.append(node.val)

                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            result.append(levelList)
        }

        return result
    }
}

// Time Complexity: O(n^2) in the worst case because 1) we go through all nodes & 2).removeFirst() touches all elements in the array -> a tree holds n/2 leaves.
// Space Complexity: O(n) auxiliary space
