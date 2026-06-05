//
//  Time Based KV Store.swift
//  NeetCode
//
//  Created by Francisco on 6/5/26.
//

class TimeMap {

    private var map = [String: [(Int, String)]]()
    
    init() {

    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        map[key, default: []].append((timestamp, value))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard var vals = map[key] else { return "" }
                
        for val in vals.reversed() {
            if val.0 <= timestamp {
                return val.1
            }
        }

        return ""
    }
}
