//
//  Encode-Decode.swift
//  NeetCode
//
//  Created by Francisco on 5/22/26.
//

class Solution {

    func encode(_ strs: [String]) -> String {
        var encodedString = ""
        
        for str in strs {
            encodedString += "\(str.count)#"
            
            encodedString += str
        }
        
        return encodedString
    }

    func decode(_ str: String) -> [String] {
        var decodedMessage = [String]()
        
        var chars = Array(str)
        var i = 0
        while i < chars.count {
            var count = ""
            while chars[i] != "#" {
                count += String(chars[i])
                i += 1
            }
            i += 1
            
            var currStr = ""
            for j in 0..<Int(count)! {
                currStr += String(chars[i])
                i += 1
            }
            decodedMessage.append(currStr)
        }
        
        return decodedMessage
    }
}

/*
 Time: 26m
 Time Complexity: O(n)
 Space Complexity (auxiliary): encode O(1), decode O(n) bc of Array
 */
