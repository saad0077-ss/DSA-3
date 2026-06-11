// 19. Count Internal Nodes

// An internal node is any node that has at least one child.

// A node is not an internal node if it is a leaf node.

// Example Tree
//         10
//        /  \
//       5    15
//      / \     \
//     3   7     20

// Internal Nodes:

// 10
// 5
// 15

// Leaf Nodes:

// 3
// 7
// 20

// Count of Internal Nodes:

// 3
// Logic
// If node is null → return 0
// If node is a leaf → return 0
// Otherwise:
// Count current node as 1
// Count internal nodes in left subtree
// Count internal nodes in right subtree
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

  int countInternalNodes() {
    return _countInternalNodes(root);
  }

  int _countInternalNodes(Node? root) {
    if (root == null) {
      return 0;
    }

    if (root.left == null && root.right == null) {
      return 0;
    }

    return 1 +
        _countInternalNodes(root.left) +
        _countInternalNodes(root.right);
  }
}

void main() {
  BST bst = BST();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);
  bst.insert(20);

  print("Internal Nodes: ${bst.countInternalNodes()}");
}
// How It Works

// Tree:

//         10
//        /  \
//       5    15
//      / \     \
//     3   7     20

// Checking each node:

// 10 → Internal (1)
// 5  → Internal (1)
// 15 → Internal (1)

// 3  → Leaf (0)
// 7  → Leaf (0)
// 20 → Leaf (0)

// Total:

// 1 + 1 + 1 = 3
// Output
// Internal Nodes: 3
// Time Complexity
// O(n)

// Every node is visited exactly once.