// 5. Count Total Nodes
// The goal is to count how many nodes exist in the tree.
// Logic
// For every node:

// Count = 1 (current node)
//       + nodes in left subtree
//       + nodes in right subtree

// If the node is null, return 0.

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

  int countNodes() {
    return _countNodes(root);
  }

  int _countNodes(Node? root) {
    if (root == null) {
      return 0;
    }

    return 1 + _countNodes(root.left) + _countNodes(root.right);
  }
}

void main() {
  BST bst = BST();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);

  print("Total Nodes: ${bst.countNodes()}");
}
