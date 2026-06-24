# 📚 Heap & Heap-Sort: Complete Guide (Dart Edition)

> **Master Heaps and Heap-Sort with Practical Examples, Code, and Interview Questions**

![Status](https://img.shields.io/badge/status-complete-brightgreen)
![Level](https://img.shields.io/badge/level-intermediate-blue)
![Dart](https://img.shields.io/badge/dart-3.x-blue)

---

## 📋 Table of Contents

1. [Introduction](#introduction)
2. [What is a Heap?](#what-is-a-heap)
3. [Types of Heaps](#types-of-heaps)
4. [Heap Properties](#heap-properties)
5. [Core Operations](#core-operations)
6. [Heap-Sort Algorithm](#heap-sort-algorithm)
7. [Code Examples](#code-examples)
8. [Complexity Analysis](#complexity-analysis)
9. [Interview Questions](#interview-questions)
10. [Common Problems](#common-problems)
11. [Quick Reference](#quick-reference)

---

## 🎯 Introduction

A **heap** is one of the most important and powerful data structures in computer science. It's widely used in:

- ✅ **Priority Queues** - Efficient insertion and deletion
- ✅ **Sorting** - Heap-sort with O(n log n) guarantee
- ✅ **System Design** - OS memory management, scheduling
- ✅ **Algorithms** - Dijkstra's, Prim's, load balancing
- ✅ **Interview Questions** - Frequently asked in top tech companies

### Why Learn Heaps?

| Reason | Benefit |
|--------|---------|
| **Efficiency** | All operations in O(log n) or O(n) |
| **Guaranteed Performance** | No worst-case scenarios |
| **Practical Applications** | Used in real-world systems |
| **Interview Ready** | Core data structure for technical interviews |

---

## 🔍 What is a Heap?

### Definition

> A **heap** is a specialized tree-based data structure that satisfies the **heap property**. It is a complete binary tree where each node has at most two children.

### Key Characteristics

- **Complete Binary Tree**: All levels are fully filled except possibly the last level
- **Heap Property**: Parent-child ordering relationship
- **Array Storage**: Efficiently stored as an array (Dart `List`)
- **O(log n) Operations**: Most operations run in logarithmic time

### Visual Example

```
Max-Heap:              Min-Heap:
        50                   5
       /  \                 / \
      30   40              10  8
     / \   / \            / \ / \
    10 20 35 5           20 15 30 25
```

---

## 🔀 Types of Heaps

### 1. Max-Heap

```
Property: Parent ≥ Child nodes
Root: Contains the maximum element
Use Cases:
  • Sorting in descending order
  • Priority queues (highest priority first)
  • Finding k smallest elements
```

**Example:**
```
       50
      /  \
    30    40
   / \    / \
  10 20  35  5
```

### 2. Min-Heap

```
Property: Parent ≤ Child nodes
Root: Contains the minimum element
Use Cases:
  • Sorting in ascending order
  • Priority queues (lowest priority first)
  • Dijkstra's shortest path algorithm
  • Prim's minimum spanning tree
```

**Example:**
```
        5
       / \
     10   8
    / \  / \
   20 15 30 25
```

---

## ⚙️ Heap Properties

### Complete Binary Tree Property

- All levels are completely filled except possibly the last level
- Last level is filled from left to right
- This ensures the heap has O(log n) height

### Heap Property

- **Max-Heap**: `parent ≥ children`
- **Min-Heap**: `parent ≤ children`
- Only parent-child relationship matters, not sibling relationships

### Array Representation

Heaps are stored as arrays (Dart `List<T>`) for efficient memory usage:

```
For node at index i (0-indexed):
┌─────────────────────────────────┐
│ Parent Index:   (i - 1) ~/ 2    │
│ Left Child:     2 * i + 1       │
│ Right Child:    2 * i + 2       │
└─────────────────────────────────┘
```

**Example:**
```
Heap: [50, 30, 40, 10, 20, 35, 5]
Index: 0   1   2   3   4   5   6

Tree representation:
           50 (index 0)
          /  \
      30(1)  40(2)
     / \     / \
  10(3) 20(4) 35(5) 5(6)

Parent of 20(index 4): (4-1)~/2 = 1 → element 30 ✓
Left child of 30(index 1): 2*1+1 = 3 → element 10 ✓
Right child of 30(index 1): 2*1+2 = 4 → element 20 ✓
```

---

## 🎯 Core Operations

### 1. Heapify (Bubble Down) - O(log n)

Maintains heap property by moving an element down the tree.

**Algorithm:**
```
1. Compare element with its children
2. If violates heap property:
   - Swap with smaller/larger child (depending on heap type)
   - Recursively heapify the affected subtree
3. Stop when heap property is satisfied
```

**When Used:**
- After removing the root element
- During heap construction
- Maintaining heap after element replacement

### 2. Insert (Bubble Up) - O(log n)

Adds a new element while maintaining the heap property.

**Algorithm:**
```
1. Add element at the end of the array
2. Compare with parent
3. If violates heap property:
   - Swap with parent
   - Move up to parent's position
4. Repeat until heap property satisfied or reached root
```

**Example:**
```
Insert 15 into [10, 20, 30]:
         10                10              10
        /  \      →      /  \      →     /  \
       20  30           15  30          15  30
      /               /              /
     15              20             20

Final: [10, 15, 30, 20]
```

### 3. Extract Min/Max - O(log n)

Removes and returns the root element.

**Algorithm:**
```
1. Save root value (minimum/maximum)
2. Move last element to root position
3. Remove last element from array
4. Heapify from root
5. Return saved value
```

**Example:**
```
Extract from [10, 15, 30, 20]:
         10                20              15
        /  \      →      /  \      →     /  \
       15  30            15  30          20  30

Final: [15, 20, 30], Extracted: 10
```

### 4. Build Heap - O(n)

Converts an unordered array into a valid heap.

**Algorithm:**
```
1. Start from last non-leaf node: (n~/2 - 1)
2. Heapify each node moving upward toward root
3. This ensures all subtrees satisfy heap property
```

**Why O(n) and not O(n log n)?**
```
Most nodes are leaves (n/2 nodes) with 0 operations
n/4 nodes at level 1: 1 operation each
n/8 nodes at level 2: 2 operations each
...

Total: n/2*0 + n/4*1 + n/8*2 + ... 
     = n * (0/2 + 1/4 + 2/8 + ...)
     = n * 1 = O(n)

The geometric series sums to less than 1!
```

**Example:**
```
Array: [4, 10, 3, 5, 1]
       0   1  2  3  4

Step 1: Heapify from index (5~/2 - 1) = 1
        [4, 10, 3, 5, 1] → [4, 10, 3, 5, 1]
        
Step 2: Heapify from index 0
        [4, 10, 3, 5, 1] → [10, 5, 3, 4, 1]
        
Result: [10, 5, 3, 4, 1] (valid max-heap)
```

---

## 🚀 Heap-Sort Algorithm

### Overview

**Heap-Sort** is a comparison-based sorting algorithm that uses a heap to sort elements. It **guarantees O(n log n)** in all cases - best, average, and worst!

### How It Works

```
Step 1: Build a max-heap from the input array
Step 2: The largest element is now at root
Step 3: Swap root with last element
Step 4: Reduce heap size by 1
Step 5: Heapify the root
Step 6: Repeat steps 2-5 until heap size is 1
```

### Complete Example

```
Original Array: [4, 10, 3, 5, 1]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
STEP 1: BUILD MAX-HEAP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        10
       /  \
      5    3
     / \
    4   1

Heap Array: [10, 5, 3, 4, 1]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
STEP 2-6: EXTRACT ELEMENTS ONE BY ONE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Iteration 1: Swap 10 with 1
  [1, 5, 3, 4] | [10]
  Heapify: [5, 4, 3, 1] | [10]

Iteration 2: Swap 5 with 1
  [1, 4, 3] | [5, 10]
  Heapify: [4, 1, 3] | [5, 10]

Iteration 3: Swap 4 with 3
  [1, 3] | [4, 5, 10]
  Heapify: [3, 1] | [4, 5, 10]

Iteration 4: Swap 3 with 1
  [1] | [3, 4, 5, 10]

Iteration 5: Only 1 left
  [1, 3, 4, 5, 10]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
FINAL SORTED ARRAY: [1, 3, 4, 5, 10] ✓
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### Advantages & Disadvantages

| Advantage | Disadvantage |
|-----------|------------|
| O(n log n) guaranteed | Poor cache locality |
| In-place sorting | Not adaptive to nearly-sorted data |
| No extra space needed | More comparisons than quicksort |
| Predictable performance | Slower in practice than quicksort |

---

## 💻 Code Examples

### Complete Min-Heap Implementation

```dart
/// Min-Heap implementation with common operations
class MinHeap<T extends Comparable<T>> {
  final List<T> heap = [];

  // Helper methods for indices
  int parent(int i) => (i - 1) ~/ 2;
  int leftChild(int i) => 2 * i + 1;
  int rightChild(int i) => 2 * i + 2;

  void swap(int i, int j) {
    final tmp = heap[i];
    heap[i] = heap[j];
    heap[j] = tmp;
  }

  // Core operations

  /// Insert element - O(log n)
  void insert(T value) {
    heap.add(value);
    _bubbleUp(heap.length - 1);
  }

  /// Move element up to maintain heap property
  void _bubbleUp(int i) {
    while (i > 0 && heap[i].compareTo(heap[parent(i)]) < 0) {
      swap(i, parent(i));
      i = parent(i);
    }
  }

  /// Remove and return minimum - O(log n)
  T? extractMin() {
    if (heap.isEmpty) return null;
    if (heap.length == 1) return heap.removeLast();

    final minVal = heap[0];
    heap[0] = heap.removeLast();
    _bubbleDown(0);
    return minVal;
  }

  /// Move element down to maintain heap property
  void _bubbleDown(int i) {
    while (true) {
      int smallest = i;
      final left = leftChild(i);
      final right = rightChild(i);

      if (left < heap.length && heap[left].compareTo(heap[smallest]) < 0) {
        smallest = left;
      }
      if (right < heap.length && heap[right].compareTo(heap[smallest]) < 0) {
        smallest = right;
      }

      if (smallest != i) {
        swap(i, smallest);
        i = smallest;
      } else {
        break;
      }
    }
  }

  /// Build heap from array - O(n)
  void buildHeap(List<T> arr) {
    heap
      ..clear()
      ..addAll(arr);
    for (int i = (heap.length ~/ 2) - 1; i >= 0; i--) {
      _bubbleDown(i);
    }
  }

  /// Get minimum without removing - O(1)
  T? peek() => heap.isNotEmpty ? heap[0] : null;

  /// Get heap size - O(1)
  int size() => heap.length;

  /// Check if empty - O(1)
  bool isEmpty() => heap.isEmpty;
}

// Usage Example
void main() {
  // Create and populate heap
  final heap = MinHeap<int>();
  final values = [15, 10, 20, 8, 25, 12];

  print('Inserting values: $values');
  for (final val in values) {
    heap.insert(val);
  }

  print('Heap: ${heap.heap}');
  print('Min: ${heap.peek()}');

  // Extract all elements
  print('\nExtracting elements in order:');
  final extracted = <int>[];
  while (!heap.isEmpty()) {
    extracted.add(heap.extractMin()!);
  }
  print(extracted.join(' '));
}
```

### Heap-Sort Implementation

```dart
/// Maintain heap property for subtree rooted at index i
///
/// [arr]: Array representation of heap
/// [n]: Heap size
/// [i]: Index of node to heapify
///
/// Time: O(log n)
void heapify<T extends Comparable<T>>(List<T> arr, int n, int i) {
  int smallest = i;
  final left = 2 * i + 1;
  final right = 2 * i + 2;

  // Find smallest among parent and children
  if (left < n && arr[left].compareTo(arr[smallest]) < 0) {
    smallest = left;
  }

  if (right < n && arr[right].compareTo(arr[smallest]) < 0) {
    smallest = right;
  }

  // Recursively heapify if needed
  if (smallest != i) {
    final tmp = arr[i];
    arr[i] = arr[smallest];
    arr[smallest] = tmp;
    heapify(arr, n, smallest);
  }
}

/// Sort array using heap-sort algorithm
///
/// [arr]: List to sort (modified in-place)
///
/// Time: O(n log n) - guaranteed
/// Space: O(1) - in-place
void heapSort<T extends Comparable<T>>(List<T> arr) {
  final n = arr.length;

  // Build max-heap - O(n)
  for (int i = (n ~/ 2) - 1; i >= 0; i--) {
    heapify(arr, n, i);
  }

  // Extract elements one by one - O(n log n)
  for (int i = n - 1; i > 0; i--) {
    // Move root (max element) to end
    final tmp = arr[0];
    arr[0] = arr[i];
    arr[i] = tmp;
    // Heapify reduced heap
    heapify(arr, i, 0);
  }
}

// Test Examples
void main() {
  // Example 1
  final arr1 = [64, 34, 25, 12, 22, 11, 90];
  print('Original: $arr1');
  heapSort(arr1);
  print('Sorted:   $arr1');

  // Example 2
  final arr2 = [4, 10, 3, 5, 1];
  print('\nOriginal: $arr2');
  heapSort(arr2);
  print('Sorted:   $arr2');

  // Example 3: Reverse sorted array (worst case for quicksort)
  final arr3 = List.generate(10, (i) => 10 - i);
  print('\nOriginal: $arr3');
  heapSort(arr3);
  print('Sorted:   $arr3');
}
```

### Max-Heap Implementation

```dart
/// Max-Heap implementation
class MaxHeap<T extends Comparable<T>> {
  final List<T> heap = [];

  /// Insert element - O(log n)
  void insert(T value) {
    heap.add(value);
    _bubbleUp(heap.length - 1);
  }

  /// Move element up to maintain max-heap property
  void _bubbleUp(int i) {
    while (i > 0) {
      final parentIdx = (i - 1) ~/ 2;
      if (heap[i].compareTo(heap[parentIdx]) > 0) {
        final tmp = heap[i];
        heap[i] = heap[parentIdx];
        heap[parentIdx] = tmp;
        i = parentIdx;
      } else {
        break;
      }
    }
  }

  /// Remove and return maximum - O(log n)
  T? extractMax() {
    if (heap.isEmpty) return null;

    final maxVal = heap[0];
    heap[0] = heap.removeLast();
    if (heap.isNotEmpty) _bubbleDown(0);
    return maxVal;
  }

  /// Move element down to maintain max-heap property
  void _bubbleDown(int i) {
    while (true) {
      int largest = i;
      final left = 2 * i + 1;
      final right = 2 * i + 2;

      if (left < heap.length && heap[left].compareTo(heap[largest]) > 0) {
        largest = left;
      }
      if (right < heap.length && heap[right].compareTo(heap[largest]) > 0) {
        largest = right;
      }

      if (largest != i) {
        final tmp = heap[i];
        heap[i] = heap[largest];
        heap[largest] = tmp;
        i = largest;
      } else {
        break;
      }
    }
  }
}
```

---

## 📊 Complexity Analysis

### Heap Operations Complexity

| Operation | Best Case | Average Case | Worst Case | Space |
|-----------|-----------|--------------|-----------|-------|
| **Insert** | O(1) | O(log n) | O(log n) | O(1) |
| **Delete Min/Max** | O(log n) | O(log n) | O(log n) | O(1) |
| **Extract Min/Max** | O(log n) | O(log n) | O(log n) | O(1) |
| **Build Heap** | O(n) | O(n) | O(n) | O(1) |
| **Peek/Get Min** | O(1) | O(1) | O(1) | O(1) |

### Heap-Sort Complexity

```
Time Complexity:
  Best Case:    O(n log n) - Balanced heap
  Average Case: O(n log n) - Normal scenario
  Worst Case:   O(n log n) - GUARANTEED!
  
  Breakdown:
  • Build heap:      O(n)
  • Extract n elements: n × O(log n) = O(n log n)
  • Total: O(n) + O(n log n) = O(n log n)

Space Complexity: O(1)
  • Sorts in-place
  • Only uses constant extra space
  • No additional arrays needed
```

### Why Build Heap is O(n)?

```
For a heap of size n:
• Level 0 (root): 1 node × 0 operations = 0
• Level 1: 2 nodes × 1 operation = 2
• Level 2: 4 nodes × 2 operations = 8
• Level 3: 8 nodes × 3 operations = 24
• ...
• Level h: 2^h nodes × h operations

Total = 0 + 2 + 8 + 24 + ...
      = Σ(i=0 to h) 2^i × i
      = 2 × 2^(h+1) - (h+2) × 2^h (using math)
      = 2n - (h+2) × 2^(h+1) / 2^(h+1)
      = O(n)

The series converges to a constant factor of n!
```

---

## ❓ Interview Questions

### Basic Questions

#### Q1: What is a heap and what are its properties?

**Answer:**
A heap is a complete binary tree that satisfies the heap property:
- **Complete Binary Tree**: All levels fully filled except possibly the last
- **Heap Property**: Parent ≥ children (max-heap) or Parent ≤ children (min-heap)
- **Array Representation**: Stored as array with O(1) parent/child access
- **Root Access**: O(1) access to min/max element

#### Q2: What's the difference between a min-heap and a max-heap?

**Answer:**
| Aspect | Min-Heap | Max-Heap |
|--------|----------|----------|
| Property | Parent ≤ Children | Parent ≥ Children |
| Root | Minimum element | Maximum element |
| Use | Ascending sort, Dijkstra's | Descending sort, Priority queue |
| Extract | Returns minimum | Returns maximum |

#### Q3: How do you calculate parent and child indices?

**Answer:**
For node at index `i` (0-indexed):
```dart
int parentIndex = (i - 1) ~/ 2;
int leftChildIndex = 2 * i + 1;
int rightChildIndex = 2 * i + 2;
```

Example:
```
Array: [10, 20, 30, 40, 50]
Index:  0   1   2   3   4

Node at index 3 (value 40):
  Parent: (3-1)~/2 = 1 → value 20 ✓
  Left child: 2*3+1 = 7 → doesn't exist
  Right child: 2*3+2 = 8 → doesn't exist
```

### Intermediate Questions

#### Q4: Explain the heapify operation and when to use it

**Answer:**
Heapify maintains the heap property by moving an element up or down:

- **Bubble Down (Max-Heapify)**: Move larger element down
  - Used after removing root
  - Compares with children, swaps with larger
  - O(log n) time complexity

- **Bubble Up**: Move smaller element up
  - Used after insertion
  - Compares with parent, swaps if needed
  - O(log n) time complexity

#### Q5: What's the time complexity of building a heap from n elements?

**Answer:**
**O(n)** - NOT O(n log n)!

Why? Because:
- Most nodes are leaves (n/2 nodes) requiring 0 operations
- Only a few nodes deep in tree need many swaps
- Sum of work: n/2×0 + n/4×1 + n/8×2 + ... = O(n)
- The geometric series bounds to less than n

#### Q6: Why is heap-sort not commonly used despite O(n log n) guarantee?

**Answer:**
Although theoretically O(n log n), heap-sort has practical issues:
- **Poor Cache Locality**: Random memory access patterns
- **More Data Movement**: More swaps than quicksort
- **Not Adaptive**: Can't take advantage of nearly-sorted data
- **Slower in Practice**: Quicksort usually faster due to cache efficiency

### Advanced Questions

#### Q7: How does heap-sort compare to quicksort?

**Answer:**
| Aspect | Heap-Sort | Quick-Sort |
|--------|-----------|-----------|
| Best Case | O(n log n) | O(n log n) |
| Average Case | O(n log n) | O(n log n) |
| Worst Case | O(n log n) | O(n²) |
| Space | O(1) | O(log n) |
| Stability | Unstable | Unstable |
| Cache | Poor | Good |
| Practical Speed | Slower | Faster |

Use **Quick-Sort** in general practice. Use **Heap-Sort** when guaranteed O(n log n) is needed.

#### Q8: Implement a priority queue using a heap

**Answer:**
```dart
/// Priority Queue using min-heap.
/// Lower priority number = served first.
class PriorityQueue<V> {
  final List<(int priority, V value)> heap = [];

  /// Add element with priority - O(log n)
  void enqueue(V value, int priority) {
    heap.add((priority, value));
    _bubbleUp(heap.length - 1);
  }

  /// Remove highest priority (lowest value) - O(log n)
  (int priority, V value)? dequeue() {
    if (heap.isEmpty) return null;
    final top = heap[0];
    heap[0] = heap.removeLast();
    if (heap.isNotEmpty) _bubbleDown(0);
    return top;
  }

  void _bubbleUp(int i) {
    while (i > 0 && heap[i].$1 < heap[(i - 1) ~/ 2].$1) {
      final tmp = heap[i];
      heap[i] = heap[(i - 1) ~/ 2];
      heap[(i - 1) ~/ 2] = tmp;
      i = (i - 1) ~/ 2;
    }
  }

  void _bubbleDown(int i) {
    while (true) {
      int smallest = i;
      final left = 2 * i + 1, right = 2 * i + 2;

      if (left < heap.length && heap[left].$1 < heap[smallest].$1) {
        smallest = left;
      }
      if (right < heap.length && heap[right].$1 < heap[smallest].$1) {
        smallest = right;
      }

      if (smallest != i) {
        final tmp = heap[i];
        heap[i] = heap[smallest];
        heap[smallest] = tmp;
        i = smallest;
      } else {
        break;
      }
    }
  }
}

// Usage
void main() {
  final pq = PriorityQueue<String>();
  pq.enqueue('Task A', 3);
  pq.enqueue('Task B', 1);
  pq.enqueue('Task C', 2);

  while (pq.heap.isNotEmpty) {
    final (priority, task) = pq.dequeue()!;
    print('$task (priority: $priority)');
  }
  // Output: Task B (1), Task C (2), Task A (3)
}
```

#### Q9: What's the space complexity of heap-sort and why?

**Answer:**
**O(1) - constant space**

Heap-sort sorts in-place:
- Input array is converted to heap structure
- No additional arrays created
- Only constant variables for indexing
- Even the recursion depth of heapify is O(log n) space, but often implemented iteratively

This is different from:
- Merge-sort: O(n) extra space
- Quick-sort: O(log n) space (recursion stack)

---

## 🔧 Common Interview Problems

### Problem 1: Find K Largest Elements

**Problem Statement:**
Given an array, find the k largest elements.

**Solution Approach:**
```dart
import 'dart:collection';

/// Find k largest elements using min-heap
///
/// Time: O(n log k)
/// Space: O(k)
List<int> findKLargest(List<int> arr, int k) {
  // Keep min-heap of size k
  final heap = PriorityQueue<int>(); // dart:collection min-priority-queue

  for (final num in arr) {
    if (heap.length < k) {
      heap.add(num);
    } else if (heap.isNotEmpty && num > heap.first) {
      heap.removeFirst();
      heap.add(num);
    }
  }

  final result = heap.toList()..sort((a, b) => b.compareTo(a));
  return result;
}

// Example
void main() {
  final arr = [3, 2, 1, 5, 6, 4];
  final k = 2;
  print(findKLargest(arr, k)); // [6, 5]
}
```

**Time Complexity:** O(n log k)
**Space Complexity:** O(k)

> Note: `dart:collection`'s `PriorityQueue<E>` is a **min**-priority-queue by default (lowest element comes out first via `removeFirst()`), matching Python's `heapq`.

### Problem 2: Merge K Sorted Lists

**Problem Statement:**
Merge k sorted lists into one sorted list.

**Solution Approach:**
```dart
import 'dart:collection';

/// Merge k sorted lists using min-heap
///
/// Time: O(n log k) where n is total elements
/// Space: O(k)
List<int> mergeKLists(List<List<int>> lists) {
  // Min-heap storing (value, listIndex, nodeIndex), ordered by value
  final heap = PriorityQueue<(int, int, int)>(
    (a, b) => a.$1.compareTo(b.$1),
  );

  // Add first node of each list
  for (int i = 0; i < lists.length; i++) {
    if (lists[i].isNotEmpty) {
      heap.add((lists[i][0], i, 0));
    }
  }

  final result = <int>[];

  // Extract minimum, add next from same list
  while (heap.isNotEmpty) {
    final (val, listIdx, nodeIdx) = heap.removeFirst();
    result.add(val);

    // Add next element from same list
    if (nodeIdx + 1 < lists[listIdx].length) {
      final nextVal = lists[listIdx][nodeIdx + 1];
      heap.add((nextVal, listIdx, nodeIdx + 1));
    }
  }

  return result;
}

// Example
void main() {
  final lists = [
    [1, 4, 5],
    [1, 3, 4],
    [2, 6],
  ];
  print(mergeKLists(lists)); // [1, 1, 2, 3, 4, 4, 5, 6]
}
```

**Time Complexity:** O(n log k)
**Space Complexity:** O(k)

### Problem 3: Find Median in Data Stream

**Problem Statement:**
Find the median of numbers in a stream.

**Solution Approach:**
```dart
import 'dart:collection';

/// Find median in stream using two heaps
class MedianFinder {
  // Max-heap for smaller half (reverse comparator for max behavior)
  final PriorityQueue<int> small = PriorityQueue<int>((a, b) => b.compareTo(a));
  // Min-heap for larger half
  final PriorityQueue<int> large = PriorityQueue<int>();

  /// Add number - O(log n)
  void addNum(int num) {
    // Add to appropriate heap
    if (small.isEmpty || num <= small.first) {
      small.add(num);
    } else {
      large.add(num);
    }

    // Balance: small should have at most 1 more element
    if (small.length > large.length + 1) {
      large.add(small.removeFirst());
    }

    if (large.length > small.length) {
      small.add(large.removeFirst());
    }
  }

  /// Find median - O(1)
  double findMedian() {
    if (small.length > large.length) {
      return small.first.toDouble();
    }
    return (small.first + large.first) / 2;
  }
}

// Example
void main() {
  final mf = MedianFinder();
  mf.addNum(1);
  print(mf.findMedian()); // 1.0
  mf.addNum(2);
  print(mf.findMedian()); // 1.5
  mf.addNum(3);
  print(mf.findMedian()); // 2.0
}
```

**Time Complexity:** O(log n) per addition, O(1) per query
**Space Complexity:** O(n)

### Problem 4: K Closest Points to Origin

**Problem Statement:**
Find k closest points to origin (0, 0).

**Solution Approach:**
```dart
import 'dart:collection';

/// Find k closest points using max-heap by distance
///
/// Time: O(n log k)
/// Space: O(k)
List<List<int>> kClosest(List<List<int>> points, int k) {
  // Max-heap ordered by distance (largest distance first)
  final heap = PriorityQueue<(int dist, List<int> point)>(
    (a, b) => b.$1.compareTo(a.$1),
  );

  for (final point in points) {
    final dist = point[0] * point[0] + point[1] * point[1];

    if (heap.length < k) {
      heap.add((dist, point));
    } else if (dist < heap.first.$1) {
      // Closer than farthest in heap
      heap.removeFirst();
      heap.add((dist, point));
    }
  }

  return heap.toList().map((e) => e.$2).toList();
}

// Example
void main() {
  final points = [
    [1, 3],
    [2, 2],
    [2, -2],
  ];
  final k = 2;
  print(kClosest(points, k)); // [[2,2], [2,-2]]
}
```

**Time Complexity:** O(n log k)
**Space Complexity:** O(k)

### Problem 5: Top K Frequent Elements

**Problem Statement:**
Find k most frequent elements in array.

**Solution Approach:**
```dart
import 'dart:collection';

/// Find k most frequent elements using heap
///
/// Time: O(n log k)
/// Space: O(n)
List<int> topKFrequent(List<int> nums, int k) {
  // Count frequencies
  final freq = <int, int>{};
  for (final n in nums) {
    freq[n] = (freq[n] ?? 0) + 1;
  }

  // Keep min-heap of size k, ordered by count
  final heap = PriorityQueue<(int count, int num)>(
    (a, b) => a.$1.compareTo(b.$1),
  );

  freq.forEach((num, count) {
    if (heap.length < k) {
      heap.add((count, num));
    } else if (count > heap.first.$1) {
      heap.removeFirst();
      heap.add((count, num));
    }
  });

  return heap.toList().map((e) => e.$2).toList();
}

// Example
void main() {
  final nums = [1, 1, 1, 2, 2, 3];
  final k = 2;
  print(topKFrequent(nums, k)); // [1, 2]
}
```

**Time Complexity:** O(n log k)
**Space Complexity:** O(n)

---

## 📝 Quick Reference

### Heap Operations Cheat Sheet

```dart
import 'dart:collection';

// MIN-HEAP (default)
final heap = PriorityQueue<int>();
heap.add(5);      // Insert - O(log n)
heap.add(3);
heap.add(7);

final minVal = heap.removeFirst(); // Extract min - O(log n)
final peekMin = heap.first;        // Peek min - O(1)

// Build heap from a list - O(n log n) via repeated add,
// or seed directly if you don't need incremental inserts:
final arr = [5, 3, 7, 1];
final heapFromList = PriorityQueue<int>()..addAll(arr);

// MAX-HEAP (custom comparator — no negation needed)
final maxHeap = PriorityQueue<int>((a, b) => b.compareTo(a));
maxHeap.addAll([5, 3, 7, 2]);
final maxVal = maxHeap.removeFirst();

// Common operations
heap.removeFirst();
heap.add(4);                 // "replace root" pattern - O(log n)

List<int> nLargest(List<int> arr, int n) {
  final sorted = [...arr]..sort((a, b) => b.compareTo(a));
  return sorted.take(n).toList(); // O(n log n), simplest approach
}

List<int> nSmallest(List<int> arr, int n) {
  final sorted = [...arr]..sort();
  return sorted.take(n).toList();
}
```

### When to Use Heap

```
✓ USE HEAP WHEN:
  • Need efficient min/max access
  • Implementing priority queue
  • Need O(n log n) guaranteed sort
  • Memory is limited
  • Need in-place sorting

✗ DON'T USE HEAP WHEN:
  • Nearly-sorted data (use insertion sort)
  • Need stable sort (heap-sort unstable)
  • Cache efficiency matters (use quicksort)
  • Need sorted order throughout
```

### Common Patterns

```dart
// K Largest/Smallest Problems
// Pattern: Use min-heap of size k for k largest
//          Use max-heap of size k for k smallest

// Priority Queue
// Pattern: Use min-heap with (priority, value) records

// Merge K Sorted Lists
// Pattern: Use min-heap to track front element of each list

// Median Finding
// Pattern: Balance max-heap (lower) and min-heap (upper)

// Top K Frequent
// Pattern: Count frequencies, then use heap on frequencies
```

---

## 📚 Learning Resources

### Practice Problems
- LeetCode: Heap/Priority Queue section
- Medium-level problems: K largest, K closest, median stream
- Hard-level problems: Merge K lists, sliding window max

### Time Complexity Summary

```
┌────────────────────────────────────────────┐
│ Heap Operations Summary                    │
├────────────────────────────────────────────┤
│ Operation        │ Time Complexity        │
├──────────────────┼─────────────────────────┤
│ Insert           │ O(log n)               │
│ Delete Min/Max   │ O(log n)               │
│ Build Heap       │ O(n)                   │
│ Heapify          │ O(log n)               │
│ Peek Min/Max     │ O(1)                   │
│ Heap-Sort        │ O(n log n) guaranteed  │
└────────────────────────────────────────────┘
```

---

## 🎓 Summary & Key Points

### What You Should Know

1. ✅ **Heap Definition**: Complete binary tree with parent-child ordering
2. ✅ **Array Representation**: Efficient storage with simple index formulas
3. ✅ **Core Operations**: Insert/Delete O(log n), Build O(n)
4. ✅ **Heap-Sort**: O(n log n) guaranteed, in-place, unstable
5. ✅ **Priority Queues**: Built using heaps
6. ✅ **When to Use**: K problems, streaming medians, system design

### Interview Preparation Checklist

- [ ] Implement MinHeap from scratch
- [ ] Implement MaxHeap from scratch
- [ ] Implement heap-sort algorithm
- [ ] Solve K largest/smallest problems
- [ ] Solve merge K sorted lists
- [ ] Solve median in data stream
- [ ] Understand complexity analysis
- [ ] Practice explaining heap operations
- [ ] Solve at least 5 heap problems on LeetCode

### Resources to Master

1. **Theory**: Understand complete binary tree, heap property
2. **Implementation**: Write heap code without library
3. **Applications**: Know when and where to use heaps
4. **Problems**: Practice systematically from easy to hard
5. **Optimization**: Understand why heaps are used over alternatives

---

## 📖 Additional Notes

### Common Mistakes

```
❌ Wrong: Thinking build heap is O(n log n)
✅ Right: Build heap is O(n) - most nodes are leaves

❌ Wrong: Using max-heap for K largest (inefficient)
✅ Right: Use min-heap of size K for K largest

❌ Wrong: Heap-sort is faster than quicksort
✅ Right: Quicksort usually faster due to cache locality

❌ Wrong: Heaps are always in sorted order
✅ Right: Only root is guaranteed to be min/max

❌ Wrong: Forgetting to maintain heap property
✅ Right: Always heapify after modifications
```

### Pro Tips

```
💡 In Dart, use dart:collection's PriorityQueue<E> for competitive programming
💡 Remember: PriorityQueue<E>() is a MIN-heap by default (pass a comparator for max)
💡 For interviews: Explain indexing clearly
💡 Test: Always verify with small examples first
💡 Optimize: Use heap when you need top-k elements
```

---

**Created:** 2024
**Version:** 1.0 (Dart Edition)
**License:** MIT

---

## 📞 Contributing

Found an issue or want to improve this guide? Feel free to contribute!

---

## ⭐ Don't Forget to Star!

If this helped you, please give it a star! ⭐

Happy Learning! 🚀