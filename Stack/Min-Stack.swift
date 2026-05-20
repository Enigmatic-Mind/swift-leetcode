//
//  Untitled.swift
//  NeetCode
//
//  Created by Francisco on 5/18/26.
//

class MinStack {
    var stack = [Int]()
    var minStack = [Int]()

    init() {

    }

    func push(_ val: Int) {
        stack.append(val)
        
        var currMin = val
        if !minStack.isEmpty {
            currMin = min(getMin(), currMin)
        }
        minStack.append(currMin)
    }

    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }

    func top() -> Int {
        return stack[stack.count - 1]
    }

    func getMin() -> Int {
        return minStack[minStack.count - 1]
    }
}





/*
 Time: 45 mins
 Time Complexity: O(1) -> all operations are working from the top
 Space Complexity: O(n) -> two stacks so 2n
 */
