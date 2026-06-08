// 6. Count Leaf Nodes
// A leaf node is a node that has no left child and no right child.

// Example Tree
  //      10
  //     /  \
  //    5    15
  //   / \
  //  3   7

  // Leaf nodes are:
  // 3, 7, 15
  // So the answer is:
  // 3


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

  int countLeafNodes() {
    return _countLeafNodes(root);
  }

  int _countLeafNodes(Node? root) {
    if (root == null) {
      return 0;
    }

    // Leaf node found
    if (root.left == null && root.right == null) {
      return 1;
    }

    return _countLeafNodes(root.left) +
        _countLeafNodes(root.right);
  }
}

void main() {
  BST bst = BST();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);

  print("Leaf Nodes: ${bst.countLeafNodes()}");
}

// How It Works

// For the tree:

//        10
//       /  \
//      5    15
//     / \
//    3   7

// Checking each node:

// 10 → Not leaf
// 5  → Not leaf
// 15 → Leaf (1)
// 3  → Leaf (1)
// 7  → Leaf (1)

// Total:

// 1 + 1 + 1 = 3
// Output
// Leaf Nodes: 3
// Time Complexity
// O(n)

// Every node is visited once.