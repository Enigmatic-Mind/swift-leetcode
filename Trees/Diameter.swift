//
//  Diameter.swift
//  NeetCode
//
//  Created by Francisco on 6/6/26.
//

class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }

            let left = dfs(node.left)
            let right = dfs(node.right)
            
            if (left + right) > maxDia { maxDia = left + right }

            return max(left, right) + 1
        }

        var maxDia = 0
        
        dfs(root)
        
        return maxDia
    }
}

// Time complexity: O(n)
// Space complexity: O(h), h is n if tree unbalanced, but log n if balanced
