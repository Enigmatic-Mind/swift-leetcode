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
array.removeLast() // — removes and returns the last element, crashes if empty
array.popLast() // — removes and returns the last element as an optional, returns nil if empty
array.last // — peeks at the last element without removing, returns optional


// Dictionary operations
dict[key] = value        // set
dict[key]                // get (returns optional)
dict.removeValue(forKey: key)  // delete


let cars = zip(position, speed)
    .sorted { $0.0 > $1.0 }  // array of (position, speed) tuples



Lazy — O(1) to create, no extra allocation:
stride(from:through:by:)
Range — 0..<n
sequence(first:next:)

Eager — O(n) time and space to create:
zip(a, b) — creates a new sequence of tuples, allocates memory
Array(stride(...)) — explicitly materializes into array
.reversed() — creates a new reversed collection
.map {} — creates a new array
.filter {} — creates a new array
.sorted {} — creates a new sorted array
