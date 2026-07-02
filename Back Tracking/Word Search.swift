//
//  Word Search.swift
//  NeetCode
//
//  Created by Francisco on 7/2/26.
//

class Solution {
    func nonoptimal_exist(_ board: [[Character]], _ word: String) -> Bool {
        var wordChars = Array(word)
        
        var seenChar = Set<[Int]>()
        
        func backtrack(_ y: Int, _ x: Int, _ index: Int, _ seenChar: Set<[Int]>) -> Bool {
            if index >= wordChars.count { return true }
            
            if (y < 0) || (y >= board.count) || (x < 0) || (x >= board[y].count) || (seenChar.contains([y, x])) || (board[y][x] != wordChars[index]) {
                return false
            }
            
            var seenChar = seenChar
            seenChar.insert([y, x])
            
            return backtrack(y, x-1, index+1, seenChar) ||  // left
            backtrack(y, x+1, index+1, seenChar) ||         // right
            backtrack(y-1, x, index+1, seenChar) ||         // up
            backtrack(y+1, x, index+1, seenChar)            // down
        }
        
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                if board[row][col] == wordChars[0] {
                    if backtrack(row, col, 0, seenChar) { return true }
                }
            }
        }
        return false
    }
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var wordChars = Array(word)
        
        var seenChar = Set<[Int]>()
        
        func backtrack(_ y: Int, _ x: Int, _ index: Int) -> Bool {
            if index >= wordChars.count { return true }
            
            if (y < 0) || (y >= board.count) || (x < 0) || (x >= board[y].count) || (seenChar.contains([y, x])) || (board[y][x] != wordChars[index]) {
                return false
            }
            
            seenChar.insert([y, x])
            
            let found = backtrack(y, x-1, index+1) ||  // left
                backtrack(y, x+1, index+1) ||         // right
                backtrack(y-1, x, index+1) ||         // up
                backtrack(y+1, x, index+1)            // down
            
            seenChar.remove([y, x])
            
            return found
        }
        
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                if board[row][col] == wordChars[0] {
                    if backtrack(row, col, 0) { return true }
                }
            }
        }
        return false
    }
}

// Time: O(n * 4^L) -> n total char in the board, L word length
// Space: O(L^2)
