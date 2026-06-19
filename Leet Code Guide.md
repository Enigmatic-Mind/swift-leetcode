## Two Pointers
Core idea: Instead of using nested loops to compare or search through an array (O(n^2)), you place two pointers at different positions and move them towards each other or in the same direction. Drops complexity to O(n).

When:
- Sorted array + find a pair
- Remove duplicates, reverse, palindrome check
- Where brute force would be two nested loops over the same array

Forms:
- Opposite ends - start one pointer at index 0 and one at the last index. Move them toward each other.
- Same direction - pointers start at 0 but move at different speeds or conditions.

Code:
var left = 0
var right = nums.count - 1
while left < right {
    // your condition here
    left += 1
    right -= 1
}

## Sliding Window
Core idea: Instead of recalculating a subarray from scratch every step (O(n^2)), you maintain a window that expands and contracts as you move through the array (O(n)).

When:
- Longest / shortest subarray or substring that meets a condition
- Maximum sum of k elements
- Contiguous sequence

Forms:
- Fixed size - window size is given, just slide it across. E.g. max sum of k consective elements
- Variable size - window grows and shrinks based on a condition. E.g. longest substring without repeating chars.

Code:
var left = 0
var windowState = 0 // could be a sum, map, or count

for right in nums.indices {
    // add nums[right] to window
    
    while windowConditionViolated {
        // remove nums[left] from window
        left += 1
    }
    // update answer
}


## Fast & Slow Pointers
Core idea: two pointers moving through the same structure but at different speeds. The fast pointer moves 2 steps, slow moves 1. If there's a cycle, they'll eventually meet. If there isn't fast hits null first

When:
- Detect a cycle in linked list or array
- Find the middle of a linked list
- Find the start of a cycle
- Happy number problems

Forms:
- Cycle detection
- Find the middle - when fast hits the end and slow is at the middle. Useful for merge sort on linked lists.

Code:
var slow = head
var fast = head

while fast != nil && fast?.next != nil {
    slow = slow?.next
    fast = fast?.next?.next
    
    if slow == fast {
        // cycle detected
    }
}

// slow is not at the middle


## Stack
Core idea: Last in first out. Whatever you pushed on last is the first thing you pop off. This lets you remember history as you move forward through a problem.

When:
- Valid parentheses
- Next greater element
- Comparing current element to previous ones
- Undo/redo operations
- Parsing nested structures

Forms:
- Matching / validation - pushing open brackets, pop when you see a closing one, check they match
- Monotonic stack - maintain a stack that's always increasing or decreasing.  E.g. largest rectangle in histogram.

Code:
var stack = [Int]()

for num in nums {
    while !stack.isEmpty && stack.last! > num {
        stack.removeLast()
    }
    stack.append(num)
}


## HashMap / Arrays
Core idea: trade memory for speed. Instead of scanning the array repeatedly to find something (O(n^2)), store things you've already seen in a hash map and look them up in O(1).

When:
- Two sum style - find two things that combine to a target
- Contains duplicate
- Group anagrams
- First unique character
- Have i seen this before?

Forms:
- Lookup table - store values as keys, indices or counts as values.
- Freq map - count occurences of characters or numbers.

Code:
var seen = [Int: Int]() // value: index

for (i, num) in nums.enumerated() {
    let complement = target - num
    if let j = seen[complement] {
        return [j, i] // found the pair
    }
    seen[num] = i
} 


## Binary Search
Core idea: Instead of scanning element element (O(n)), you repeatedly cut the search space in half by comparing to the middle element. O(log n)

Only works on sorted data or problems where you can define a clear condition that splits the space into two halves.

When:
- Sorted array + find a target
- Find min/max that satisfies a condition
- Search in rotated sorted array

Forms:
- Classic - find exact target in sorted array
- Condition-based - you're not searching for a value, you're searching for a boundary.

Code:
var left = 0
var right = nums.count - 1

while left <= right {
    let mid = left + (right - left) / 2 // avoids integer overflow
    
    if nums[mid] == target {
        return mid
    } else if nums[mid] < target {
        left = mid + 1
    } else {
        right = mid - 1
    }
}
return -1


## Trees / BFS / DFS
Core idea: trees are hierarchical data structures. BFS and DFS are two fundamental ways to traverse them.

When:
- Anything with a tree, binary tree, or binary search tree
- Level order traversal -> BFS
- Max depth, path sum, lowest common ancestor -> DFS
- Serialize/deserialize a tree

DFS goes deep. Good for exploring all paths, working with indivdual nodes, recursive structure problems
BFS goes wide. Good for shortest path, level by level processing, anything where distance from root matters

BST specific rule: inorder traversal of a BST always gives you a sorted array.

### Depth First Search
Core idea: Go as deep as possible down one branch before backtracking. Uses recursion (or an explicit stack).

Forms:
- Preorder - process node, then left, then right
- Inorder - left, then node, then right (gives sorted order on a BST)
- Postorder - left, then right, then node

When:
- max depth
- path problems
- validating BST structure
- anything requiring you to go all the way to leaves

Code:
func dfs(_ node: TreeNode?) {
    guard let node = node else { return }
    
    // preorder: process node here
    dfs(node.left)
    // inorder: process node here
    dfs(node.right)
    // postorder: process node here
}

        1
       / \
      2   3
     / \
    4   5

Preorder: root → left → right → 1, 2, 4, 5, 3
Inorder: left → root → right → 4, 2, 5, 1, 3
Postorder: left → right → root → 4, 5, 2, 3, 1

### Breadth First Search
Core idea: Process all nodes level by level. Uses a queue.

When:
- level order
- minimum depth
- right side vide
- anything where proximity to root matters

Code:
func bfs(_ root: TreeNode?) {
    guard let root = root else { return }
    var queue: [TreeNode] = [root]
    
    while !queue.isEmpty {
        let levelSize = queue.count
        
        for _ in 0..<levelSize {
            let node = queue.removeFirst()
            // process node here
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }
    }
}


## Heap / Priority Queue
Core idea: a heap is a specialized tree that always keeps the smallest (min-heap) or largest (max-heap) element at the top. O(log n) insertion and removal. O(1) access to the min or max.

Uses an array:
- Left child is at 2i + 1
- Right child is at 2i + 2
- Parent is at (i - 1) / 2

A priority queue is just a heap with a friendlier interface. You push elements in, and they always come out in priority order.

When:
- Find the K largest/smallest elements
- Merge K sorted lists
- Find the median of a data stream
- Any problem where you repeatedly need the current min or max as data changes

Forms:
- Min-heap: smallest element always at top. E.g. find the K largest elements.
- Max-heap: largest elements always at top. E.g. find the K smallest elements.

// Simple approach for small inputs
var heap = [Int]()
heap.append(num)
heap.sort() // not a real heap but works for easy problems

// For real heap behavior you implement it or use a custom struct
struct MinHeap {
    var elements = [Int]()
    
    mutating func push(_ val: Int) {
        elements.append(val)
        elements.sort() // simplified
    }
    
    mutating func pop() -> Int? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    var top: Int? { elements.first }
}


## Dynamic Programming
Core idea: break a problem into smaller subproblems, solve each once, store the result so you never solve it twice. O(n) instead of exponential brute force.

Ask: "What's the answer to the smallest version of this problem, and how does each step build on the last?"

Framework:
- Define what dp[i] means in plain English
- Find the recurrence — how does dp[i] relate to previous values
- Identify base cases. What is the smallest valid input and what its answer should be.

When:
- How many ways to
- Max/min amount to
- Can you reach
- Any problem where the answer at position i depends on answers at previous positions

Forms:
- Top down - recursive, cache results as you go
- Bottom up - iterative, build from base cases up. Preferred bc easier to reason about space complexity.

Code:
// Top down
var memo = [Int: Int]()

func dp(_ n: Int) -> Int {
    if n <= 1 { return n } // base case
    if let cached = memo[n] { return cached }
    
    memo[n] = dp(n - 1) + dp(n - 2)
    return memo[n]!
}

// Bottom up. 
func dp(_ n: Int) -> Int {
    if n <= 1 { return n }
    var dp = Array(repeating: 0, count: n + 1)
    dp[0] = 0
    dp[1] = 1
    
    for i in 2...n {
        dp[i] = dp[i-1] + dp[i-2]
    }
    return dp[n]
}


## Graphs 
Core idea: a collection of nodes (vertices) connected by edges. Trees are actually just a special type of graph - specifically one with no cycles and a single root.

When:
- Number of islands
- Shortest path between X and Y
- Can you reach X from Y
- Anythign involving a grid, network, or connections between things.

Forms:
- Adjacency list - each node stores its neighboars. Most common in interviews
// var graph = [Int: [Int]]() // node: [neighbors]
- Adjacency matrix - 2D grid where matrix[i][j] = 1 means i and j are connected. More common for grid problems

Traversal algorithms:
// DFS - explore all paths, connected components, cycle detection
var visited = Set<Int>()

func dfs(_ node: Int, _ graph: [Int: [Int]]) {
    visited.insert(node)
    for neighbor in graph[node] ?? [] {
        if !visited.contains(neighbor) {
            dfs(neighbor, graph)
        }
    }
}

// BFS - shortest path, closest neighbors first
var visited = Set<Int>()
var queue = [Int]()
queue.append(start)
visited.insert(start)

while !queue.isEmpty {
    let node = queue.removeFirst()
    for neighbor in graph[node] ?? [] {
        if !visited.contains(neighbor) {
            visited.insert(neighbor)
            queue.append(neighbor)
        }
    }
}

// Grids
let directions = [(0,1), (0,-1), (1,0), (-1,0)]

func dfs(_ grid: [[Character]], _ visited: inout [[Bool]], _ r: Int, _ c: Int) {
    guard r >= 0 && r < grid.count &&
          c >= 0 && c < grid[0].count &&
          !visited[r][c] &&
          grid[r][c] == "1" else { return }
    
    visited[r][c] = true
    for (dr, dc) in directions {
        dfs(grid, &visited, r + dr, c + dc)
    }
}
