# 🌳 Binary Search Tree (BST) — Complete Guide in Dart

> A comprehensive reference covering concepts, operations, traversals, complexity, and implementations — all in **Dart**.

---

## 📚 Table of Contents

1. [What is a Binary Search Tree?](#what-is-a-binary-search-tree)
2. [BST Properties](#bst-properties)
3. [Node Structure](#node-structure)
4. [Core Operations](#core-operations)
   - [Insertion](#insertion)
   - [Search](#search)
   - [Deletion](#deletion)
5. [Tree Traversals](#tree-traversals)
   - [Inorder (Left → Root → Right)](#inorder)
   - [Preorder (Root → Left → Right)](#preorder)
   - [Postorder (Left → Right → Root)](#postorder)
   - [Level Order (BFS)](#level-order-bfs)
6. [Complete BST Class in Dart](#complete-bst-class-in-dart)
7. [Time & Space Complexity](#time--space-complexity)
8. [Balanced vs Unbalanced BST](#balanced-vs-unbalanced-bst)
9. [Special BST Algorithms](#special-bst-algorithms)
10. [Common Interview Problems](#common-interview-problems)
11. [Visual Diagram](#visual-diagram)
12. [Key Takeaways](#key-takeaways)

---

## What is a Binary Search Tree?

A **Binary Search Tree (BST)** is a node-based binary tree data structure where each node has a value, and the following rule holds at every node:

```
For every node N:
  - All values in the LEFT subtree  < N.value
  - All values in the RIGHT subtree > N.value
  - Both left and right subtrees are also valid BSTs
```

BSTs enable **efficient searching, insertion, and deletion** — O(log n) on a balanced tree.

---

## BST Properties

| Property | Description |
|----------|-------------|
| **Ordering** | Left child < Parent < Right child |
| **Unique keys** | No duplicate values (by convention) |
| **Recursive structure** | Every subtree is itself a valid BST |
| **Inorder traversal** | Always yields a sorted (ascending) sequence |
| **Dynamic size** | Nodes can be added/removed at runtime |

---

## Node Structure

```dart
class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}
```

> `Node?` uses Dart's **null safety** — left/right are nullable since leaf nodes have no children.

---

## Core Operations

### Insertion

Compare the new value with the current node and recurse left or right until an empty spot is found.

```dart
Node insert(Node? root, int value) {
  if (root == null) return Node(value);

  if (value < root.value) {
    root.left = insert(root.left, value);
  } else if (value > root.value) {
    root.right = insert(root.right, value);
  }

  return root;
}
```

> 📝 Inserting `[50, 30, 70, 20, 40]` builds:
> ```
>         50
>        /  \
>       30   70
>      /  \
>    20   40
> ```

---

### Search

Returns the node if found, or `null` if not present.

```dart
Node? search(Node? root, int value) {
  if (root == null || root.value == value) return root;

  if (value < root.value) {
    return search(root.left, value);
  }
  return search(root.right, value);
}
```

---

### Deletion

Three cases when deleting a node:

| Case | Condition | Action |
|------|-----------|--------|
| **Case 1** | Node is a leaf (no children) | Remove it directly |
| **Case 2** | Node has one child | Replace node with its child |
| **Case 3** | Node has two children | Replace with **inorder successor** (min of right subtree) |

```dart
Node? delete(Node? root, int value) {
  if (root == null) return null;

  if (value < root.value) {
    root.left = delete(root.left, value);
  } else if (value > root.value) {
    root.right = delete(root.right, value);
  } else {
    // Case 1 & 2: 0 or 1 child
    if (root.left == null) return root.right;
    if (root.right == null) return root.left;

    // Case 3: 2 children — replace with inorder successor
    Node minNode = findMin(root.right!);
    root.value = minNode.value;
    root.right = delete(root.right, minNode.value);
  }

  return root;
}

Node findMin(Node node) {
  while (node.left != null) {
    node = node.left!;
  }
  return node;
}
```

---

## Tree Traversals

### Inorder

**Order:** Left → Root → Right
**Result:** Sorted ascending output ✅

```dart
void inorder(Node? root) {
  if (root == null) return;
  inorder(root.left);
  stdout.write('${root.value} ');
  inorder(root.right);
}
// Output for [50,30,70,20,40]: 20 30 40 50 70
```

---

### Preorder

**Order:** Root → Left → Right
**Use:** Copy or serialize a tree

```dart
void preorder(Node? root) {
  if (root == null) return;
  stdout.write('${root.value} ');
  preorder(root.left);
  preorder(root.right);
}
// Output: 50 30 20 40 70
```

---

### Postorder

**Order:** Left → Right → Root
**Use:** Delete a tree, evaluate expressions

```dart
void postorder(Node? root) {
  if (root == null) return;
  postorder(root.left);
  postorder(root.right);
  stdout.write('${root.value} ');
}
// Output: 20 40 30 70 50
```

---

### Level Order (BFS)

**Order:** Level by level, left to right
**Use:** Shortest path, level-wise operations

```dart
import 'dart:collection';

void levelOrder(Node? root) {
  if (root == null) return;

  Queue<Node> queue = Queue();
  queue.add(root);

  while (queue.isNotEmpty) {
    Node node = queue.removeFirst();
    stdout.write('${node.value} ');

    if (node.left != null)  queue.add(node.left!);
    if (node.right != null) queue.add(node.right!);
  }
}
// Output: 50 30 70 20 40
```

---

## Complete BST Class in Dart

```dart
import 'dart:collection';
import 'dart:io';

class Node {
  int value;
  Node? left;
  Node? right;
  Node(this.value);
}

class BST {
  Node? root;

  // ── Insert ──────────────────────────────────────────
  void insert(int value) {
    root = _insert(root, value);
  }

  Node _insert(Node? node, int value) {
    if (node == null) return Node(value);
    if (value < node.value) {
      node.left = _insert(node.left, value);
    } else if (value > node.value) {
      node.right = _insert(node.right, value);
    }
    return node;
  }

  // ── Search ──────────────────────────────────────────
  bool search(int value) => _search(root, value) != null;

  Node? _search(Node? node, int value) {
    if (node == null || node.value == value) return node;
    if (value < node.value) return _search(node.left, value);
    return _search(node.right, value);
  }

  // ── Delete ──────────────────────────────────────────
  void delete(int value) {
    root = _delete(root, value);
  }

  Node? _delete(Node? node, int value) {
    if (node == null) return null;
    if (value < node.value) {
      node.left = _delete(node.left, value);
    } else if (value > node.value) {
      node.right = _delete(node.right, value);
    } else {
      if (node.left == null) return node.right;
      if (node.right == null) return node.left;
      Node min = _findMin(node.right!);
      node.value = min.value;
      node.right = _delete(node.right, min.value);
    }
    return node;
  }

  Node _findMin(Node node) {
    while (node.left != null) node = node.left!;
    return node;
  }

  Node _findMax(Node node) {
    while (node.right != null) node = node.right!;
    return node;
  }

  // ── Traversals ──────────────────────────────────────
  List<int> inorder() {
    List<int> result = [];
    _inorder(root, result);
    return result;
  }

  void _inorder(Node? node, List<int> result) {
    if (node == null) return;
    _inorder(node.left, result);
    result.add(node.value);
    _inorder(node.right, result);
  }

  List<int> preorder() {
    List<int> result = [];
    _preorder(root, result);
    return result;
  }

  void _preorder(Node? node, List<int> result) {
    if (node == null) return;
    result.add(node.value);
    _preorder(node.left, result);
    _preorder(node.right, result);
  }

  List<int> postorder() {
    List<int> result = [];
    _postorder(root, result);
    return result;
  }

  void _postorder(Node? node, List<int> result) {
    if (node == null) return;
    _postorder(node.left, result);
    _postorder(node.right, result);
    result.add(node.value);
  }

  List<int> levelOrder() {
    if (root == null) return [];
    List<int> result = [];
    Queue<Node> queue = Queue()..add(root!);
    while (queue.isNotEmpty) {
      Node node = queue.removeFirst();
      result.add(node.value);
      if (node.left != null)  queue.add(node.left!);
      if (node.right != null) queue.add(node.right!);
    }
    return result;
  }

  // ── Height ──────────────────────────────────────────
  int height() => _height(root);

  int _height(Node? node) {
    if (node == null) return 0;
    return 1 + [_height(node.left), _height(node.right)].reduce((a, b) => a > b ? a : b);
  }

  // ── Min / Max ───────────────────────────────────────
  int? get minimum => root == null ? null : _findMin(root!).value;
  int? get maximum => root == null ? null : _findMax(root!).value;
}

// ── Main ─────────────────────────────────────────────
void main() {
  BST bst = BST();
  for (int v in [50, 30, 70, 20, 40, 60, 80]) {
    bst.insert(v);
  }

  print('Inorder   : ${bst.inorder()}');    // [20, 30, 40, 50, 60, 70, 80]
  print('Preorder  : ${bst.preorder()}');   // [50, 30, 20, 40, 70, 60, 80]
  print('Postorder : ${bst.postorder()}');  // [20, 40, 30, 60, 80, 70, 50]
  print('LevelOrder: ${bst.levelOrder()}'); // [50, 30, 70, 20, 40, 60, 80]
  print('Height    : ${bst.height()}');     // 3
  print('Min       : ${bst.minimum}');      // 20
  print('Max       : ${bst.maximum}');      // 80
  print('Search 40 : ${bst.search(40)}');   // true
  print('Search 99 : ${bst.search(99)}');   // false

  bst.delete(30);
  print('After delete 30: ${bst.inorder()}'); // [20, 40, 50, 60, 70, 80]
}
```

---

## Time & Space Complexity

| Operation | Average Case | Worst Case (Skewed Tree) |
|-----------|-------------|--------------------------|
| **Search** | O(log n) | O(n) |
| **Insert** | O(log n) | O(n) |
| **Delete** | O(log n) | O(n) |
| **Traversal** | O(n) | O(n) |
| **Space (call stack)** | O(log n) | O(n) |

> ⚠️ Worst case happens when values are inserted in sorted order — the tree becomes a straight chain.

---

## Balanced vs Unbalanced BST

```
Balanced (O log n):           Unbalanced / Skewed (O n):
        50                        10
       /  \                         \
      30   70                        20
     / \  / \                          \
   20  40 60 80                         30
                                          \
                                          40
```

**Self-balancing trees** fix this automatically:

| Type | Strategy | Real-world Usage |
|------|----------|-----------------|
| **AVL Tree** | Height difference ≤ 1 | Read-heavy workloads |
| **Red-Black Tree** | Node coloring rules | Dart/Java `SplayTreeMap` internals |
| **B-Tree** | Multi-way, disk-optimized | Databases, file systems |

> 💡 Dart's `SplayTreeMap` from `dart:collection` is a self-balancing BST you can use directly.

---

## Special BST Algorithms

### Kth Smallest Element

```dart
int kthSmallest(Node? root, int k) {
  List<int> result = [];
  _inorder(root, result);
  return result[k - 1]; // inorder gives sorted order
}

void _inorder(Node? node, List<int> result) {
  if (node == null) return;
  _inorder(node.left, result);
  result.add(node.value);
  _inorder(node.right, result);
}
```

---

### Validate a BST

```dart
bool isValidBST(Node? root,
    {int min = -1 << 62, int max = 1 << 62}) {
  if (root == null) return true;
  if (root.value <= min || root.value >= max) return false;
  return isValidBST(root.left,  min: min, max: root.value) &&
         isValidBST(root.right, min: root.value, max: max);
}
```

---

### Lowest Common Ancestor (LCA)

```dart
Node? lca(Node? root, int p, int q) {
  if (root == null) return null;
  if (p < root.value && q < root.value) return lca(root.left, p, q);
  if (p > root.value && q > root.value) return lca(root.right, p, q);
  return root; // split point = LCA
}
```

---

### Floor and Ceiling

```dart
int? floor(Node? root, int key) {
  if (root == null) return null;
  if (root.value == key) return root.value;
  if (key < root.value) return floor(root.left, key);
  int? right = floor(root.right, key);
  return right ?? root.value;
}

int? ceiling(Node? root, int key) {
  if (root == null) return null;
  if (root.value == key) return root.value;
  if (key > root.value) return ceiling(root.right, key);
  int? left = ceiling(root.left, key);
  return left ?? root.value;
}
```

---

## Common Interview Problems

| Problem | Key Insight |
|---------|------------|
| Kth smallest / largest | Inorder traversal with index |
| Lowest Common Ancestor | Both values branch at root = LCA |
| Validate BST | Pass min/max bounds recursively |
| Sorted array → BST | Use mid element as root, recurse |
| Height / Depth of BST | `1 + max(leftHeight, rightHeight)` |
| Count nodes in range [L, R] | Prune using BST property |
| Inorder successor | Smallest node greater than given node |
| BST to sorted doubly linked list | Inorder + pointer adjustment |

---

## Visual Diagram

```
Inserting: 50, 30, 70, 20, 40, 60, 80

              50           ← Root
            /    \
          30      70
         /  \    /  \
        20  40  60  80

Inorder    → 20 30 40 50 60 70 80  ✅ sorted
Preorder   → 50 30 20 40 70 60 80
Postorder  → 20 40 30 60 80 70 50
Level Order→ 50 30 70 20 40 60 80
```

---

## Key Takeaways

- ✅ Use **null safety** (`Node?`) in Dart — leaf nodes have `null` children.
- ✅ **Inorder traversal** always gives sorted output from a BST.
- ✅ Average O(log n) operations degrade to O(n) on a skewed tree.
- ✅ Use Dart's built-in `SplayTreeMap` (from `dart:collection`) for a production-ready self-balancing BST.
- ✅ LCA, validation, and floor/ceiling are the most common BST interview problems.

---

## Dart-Specific Tips

```dart
// Use SplayTreeMap for a ready-made sorted BST in Dart
import 'dart:collection';

var tree = SplayTreeMap<int, String>();
tree[50] = 'root';
tree[30] = 'left';
tree[70] = 'right';

print(tree.firstKey());  // 30  (minimum)
print(tree.lastKey());   // 70  (maximum)
print(tree.keys.toList()); // [30, 50, 70] — always sorted
```

---

## References

- [Dart Language Tour](https://dart.dev/language)
- [dart:collection — SplayTreeMap](https://api.dart.dev/stable/dart-collection/SplayTreeMap-class.html)
- [GeeksforGeeks — BST](https://www.geeksforgeeks.org/binary-search-tree-data-structure/)
- [Visualgo — BST Visualization](https://visualgo.net/en/bst)
- Introduction to Algorithms (CLRS) — Chapter 12

---

*Happy Coding in Dart! 🎯🚀*