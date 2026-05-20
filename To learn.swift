//
//  To learn.swift
//  NeetCode
//
//  Created by Francisco on 5/18/26.
//

Array(repeating: 0, count: height.count)

stride(from: height.count - 1, through: 0, by: -1)


// Array operations
array.append(val)        // push
array.removeLast()       // pop
array.last               // peek (returns optional)
array[array.count - 1]   // peek (crashes if empty)
array.isEmpty            // check empty
array.count              // size

// Dictionary operations
dict[key] = value        // set
dict[key]                // get (returns optional)
dict.removeValue(forKey: key)  // delete


let cars = zip(position, speed)
    .sorted { $0.0 > $1.0 }  // array of (position, speed) tuples
