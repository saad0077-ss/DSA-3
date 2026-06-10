// 13. Print All Leaf Nodes

// A leaf node is a node that has no left child and no right child.

// Example Tree
//        10
//       /  \
//      5    15
//     / \     \
//    3   7    20

// Leaf nodes are:

// 3
// 7
// 20
// Logic

// For each node:

// If node is null → return
// If both left and right are null → print the node
// Otherwise, recursively check left and right subtrees
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

  void printLeafNodes() {
    _printLeafNodes(root);
  }

  void _printLeafNodes(Node? root) {
    if (root == null) {
      return;
    }

    if (root.left == null && root.right == null) {
      print(root.data);
      return;
    }

    _printLeafNodes(root.left);
    _printLeafNodes(root.right);
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

  bst.printLeafNodes();
}
// Tree
//        10
//       /  \
//      5    15
//     / \     \
//    3   7    20
// Traversal
// 10
// ├── 5
// │   ├── 3  ← Leaf
// │   └── 7  ← Leaf
// └── 15
//     └── 20 ← Leaf
// Output
// 3
// 7
// 20
// Time Complexity
// O(n)

// Every node is visited once to determine whether it is a leaf node.