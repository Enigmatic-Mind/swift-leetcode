//
//  Longest Pali String.swift
//  NeetCode
//
//  Created by Francisco on 7/8/26.
//

// Extremely Inefficient
class Solution {
    func longestPalindrome(_ s: String) -> String {
        var longestPali = [Character]()
        let charArray = Array(s)
        for i in 0..<charArray.count {
            let pali = longestPaliStarting(at: i)
            if pali.count > longestPali.count {
                longestPali = pali
            }
        }

        func longestPaliStarting(at index: Int) -> [Character] {
            var index = index
            var result = [Character]()
            var temp = [Character]()

            while index < charArray.count {
                temp.append(charArray[index])
                index += 1

                if temp == temp.reversed() && temp.count > result.count {
                    result = temp
                }
            }

            return result
        }

        return String(longestPali)
    }
}


//
class Solution {
    func longestPalindrome(_ s: String) -> String {
        var longestPali = [Character]()
        let charArray = Array(s)
        var resultLen = 0

        for i in 0..<charArray.count {
            var l = i
            var r = i
            
            while l >= 0 and r < charArray.count && charArray[l] == charArray[r] {
                if r - l + 1 > resultLen {
                    longestPali = Array(charArray[l...r])
                    resultLen = longestPali.count
                }
                
                l -= 1
                r ++ 1
            }
            
            l = i
            r = i + 1
            
            while l >= 0 && r < charArray.count && charArray[l] == charArray[r] {
                if r - l + 1 > resultLen {
                    longestPali = Array(charArray[l...r])
                    resultLen = longestPali.count
                }
            }
        }

        return String(longestPali)
    }
}

