// 16. Find Depth of a Node

// The depth of a node is the number of edges from the root to that node.

// Example Tree
//         10
//        /  \
//       5    15
//      / \
//     3   7

// Depths:

// 10 → 0
// 5  → 1
// 15 → 1
// 3  → 2
// 7  → 2
// Logic
// Root starts at depth 0
// Move left or right while increasing depth by 1
// When the node is found, return the depth
// If not found, return -1
// Code
class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BST {
  Node? root;

  void insert(int value) {
    root = _insert(root, value);
  }

  Node? _insert(Node? root, int value) {
    if (root == null) {
      return Node(value);
    }

    if (value < root.data) {
      root.left = _insert(root.left, value);
    } else if (value > root.data) {
      root.right = _insert(root.right, value);
    }

    return root;
  }

  int findDepth(int value) {
    return _findDepth(root, value, 0);
  }

  int _findDepth(Node? root, int value, int depth) {
    if (root == null) {
      return -1;
    }

    if (root.data == value) {
      return depth;
    }

    if (value < root.data) {
      return _findDepth(root.left, value, depth + 1);
    }

    return _findDepth(root.right, value, depth + 1);
  }
}

void main() {
  BST bst = BST();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);

  print("Depth of 10: ${bst.findDepth(10)}");
  print("Depth of 5: ${bst.findDepth(5)}");
  print("Depth of 3: ${bst.findDepth(3)}");
  print("Depth of 7: ${bst.findDepth(7)}");
}
// Output
// Depth of 10: 0
// Depth of 5: 1
// Depth of 3: 2
// Depth of 7: 2
// How It Works

// Finding depth of 7:

// 10 → depth 0
// ↓
// 5 → depth 1
// ↓
// 7 → depth 2

// Answer:

// 2
// Time Complexity
// Balanced BST: O(log n)
// Skewed BST: O(n)

// Because we follow only one path from the root to the target node.