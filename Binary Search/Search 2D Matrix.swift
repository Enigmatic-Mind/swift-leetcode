//
//  Search 2D Matrix.swift
//  NeetCode
//
//  Created by Francisco on 6/2/26.
//

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var lower = 0
        var upper = matrix.count * matrix[0].count - 1
        
        func getValue (_ index: Int) -> Int {
            let row = index / matrix[0].count
            let col = index % matrix[0].count
            return matrix[row][col]
        }
        
        while lower <= upper {
            let middle = lower + (upper - lower) / 2
            if getValue(middle) == target {
                return true
            } else if target > getValue(middle) {
                lower = middle + 1
            } else {
                upper = middle - 1
            }
        }
        
        return false
    }
}

// Time Complexity: O(n logn)
// Space Complexity: O(1)
