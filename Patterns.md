## Monotonic Stack
Core insight: the stack maintains a consistent ordering property (always decreasing or increasing)
Univeral Pattern:
    for each element:
        while stack not empty AND current element breaks the monotonic property:
            pop and resolve
        push current element

