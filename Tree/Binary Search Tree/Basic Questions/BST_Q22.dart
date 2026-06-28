// Count Total Nodes in BST (Recursive)

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

  Node _insert(Node? node, int value) {
    if (node == null) return Node(value);

    if (value < node.data) {
      node.left = _insert(node.left, value);
    } else if (value > node.data) {
      node.right = _insert(node.right, value);
    }
    return node;
  }

  // ✅ Count total nodes
  int countNodes() {
    return _countNodes(root);
  }

  int _countNodes(Node? node) {
    if (node == null) return 0;
    return 1 + _countNodes(node.left) + _countNodes(node.right);
  }
}

void main() {
  List<int> arr = [10, 5, 20, 3, 7, 15, 25];
  BST bst = BST();

  for (var value in arr) {
    bst.insert(value);
  }

  print("Total Nodes: ${bst.countNodes()}"); // Output: 7
}


// Explanation
// If the node is null → return 0.

// Otherwise → count 1 (the current node) + nodes in the left subtree + nodes in the right subtree.

// Time complexity: 
// 𝑂(𝑛), since every node is visited once.