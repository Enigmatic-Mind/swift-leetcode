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
array.indices // — returns a Range<Int> which is lazy, just a start and end value, no allocation.
array.indices.reversed() // — returns a ReversedCollection which is also lazy. It doesn't create a new reversed array, it just traverses the original indices in reverse order on demand.
var chars = Array(str)


// Dictionary operations
dict[key] = value        // set
dict[key]                // get (returns optional)
dict.removeValue(forKey: key)  // delete
freqDict[num, default: 0] += 1 // handle first case = nil



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


// Linked Lists
let a = ListNode(1)
let b = ListNode(1)
let c = a

a === b  // false — same value, different objects
a === c  // true — same object


var visited = Set<ObjectIdentifier>()
let id = ObjectIdentifier(curr!)


Int(1.5) // 1 — truncates toward zero
Int(1.9) // 1 — still truncates

Int(1.5.rounded())        // 2 — rounds half up
Int(1.5.rounded(.up))     // 2 — ceiling
Int(1.5.rounded(.down))   // 1 — floor

ceil(1.1) // 2.0
ceil(1.5) // 2.0
ceil(1.9) // 2.0
ceil(1.0) // 1.0 — already whole, stays


Arrays
Backed by a contiguous block of memory.
O(1) append (amortized), O(n) insert/delete at arbitrary index.
Ideal for ordered, indexable collections.
            
Sets
Unordered collection of unique elements.
O(1) membership checks (on average).
Useful when you care about uniqueness or need fast existence checks.
            
Dictionaries
Key–value pairs, backed by a hash table.
O(1) insert, lookup, delete (on average).
Common for mapping IDs to models, caching, etc.
            
Linked Lists
Rarely needed explicitly in Swift (but good to know for interviews).
O(1) insert/delete at head; O(n) search.
Example: Custom LRU cache implementation.

Stacks & Queues
Stacks (LIFO) and queues (FIFO) are conceptual patterns you can implement with
arrays.
Used in navigation (stack-based) and task processing (queue-based).
