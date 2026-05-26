//
//  Untitled.swift
//  NeetCode
//
//  Created by Francisco on 5/18/26.
//

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var largestArea = 0
        var rectStack = [(Int, Int)]() // (Height, Index)
        
        for i in 0..<heights.count {
            var startingIndex = i
            while !rectStack.isEmpty && rectStack.last!.0 >= heights[i]{
                // Pop rect from stack
                let (rectHeight, rectLeftIndex) = rectStack.removeLast()
                
                // Keep starting index to use for new rect
                startingIndex = rectLeftIndex
                
                // Update max area
                let area = (i-rectLeftIndex) * rectHeight
                if area > largestArea {
                    largestArea = area
                }
            }
            
            rectStack.append((heights[i], startingIndex))
        }
        
        while !rectStack.isEmpty {
            let (rectHeight, rectLeftIndex) = rectStack.removeLast()
            let area = (heights.count - rectLeftIndex) * rectHeight
            if area > largestArea {
                largestArea = area
            }
        }
        
        return largestArea
    }
}
