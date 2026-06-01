//
//  Invert+tree.swift
//  NeetCode
//
//  Created by Francisco on 5/29/26.
//

// Non optimal
func invertTree(_ root: TreeNode?) -> TreeNode? {
    var root = root
    if root?.left != nil {
        invertTree(root?.left)
    }
    
    if root?.right != nil {
        invertTree(root?.right)
    }
    
    let left = root?.left
    root?.left = root?.right
    root?.right = left
    
    return root
}

// Cleaner
func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    
    let left = root.left
    root.left = invertTree(root.right)
    root.right = invertTree(left)
    
    return root
}

/*
 Time complexity: O(n)
 Space complexity: O(h) where h == n if skewed tree
 */
