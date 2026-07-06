//
//  N Queens.swift
//  NeetCode
//
//  Created by Francisco on 7/4/26.
//

class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var currBoard = [String]()
        var cols = Set<Int>()
        var posDiag = Set<Int>()
        var negDiag = Set<Int>()

        func backtrack(_ row: Int) {
            if row >= n {
                result.append(currBoard)
                return
            }

            for col in 0..<n {
                if !cols.contains(col) &&
                !posDiag.contains(row - col) &&
                !negDiag.contains(row + col) {
                    // place queen
                    var rowChars = Array(repeating: ".", count: n)
                    rowChars[col] = "Q"
                    let rowString = rowChars.joined()
                    currBoard.append(rowString)
                    cols.insert(col)
                    posDiag.insert(row - col)
                    negDiag.insert(row + col)

                    // recurse
                    backtrack(row+1)

                    // remove queen
                    currBoard.removeLast()
                    cols.remove(col)
                    posDiag.remove(row - col)
                    negDiag.remove(row + col)
                }
            }
        }

        backtrack(0)
        return result
    }
}
