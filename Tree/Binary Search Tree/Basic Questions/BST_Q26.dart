// 🧩 Concept
// A valid BST must satisfy:

// * For every node:

// => All values in the left subtree < node’s value.

// => All values in the right subtree > node’s value.

// => This rule must hold recursively for all nodes.

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

  // ✅ Validate BST using min/max constraints
  bool isValidBST() {
    return _validate(root, null, null);
  }

  bool _validate(Node? node, int? min, int? max) {
    if (node == null) return true;

    if ((min != null && node.data <= min) ||
        (max != null && node.data >= max)) {
      return false;
    }

    return _validate(node.left, min, node.data) &&
           _validate(node.right, node.data, max);
  }
}

void main() {
  BST bst = BST();
  bst.insert(20);
  bst.insert(10);
  bst.insert(30);
  bst.insert(5);
  bst.insert(15);

  print("Is BST valid? ${bst.isValidBST()}"); // ✅ true

  // Example of invalid BST
  Node invalidRoot = Node(10);
  invalidRoot.left = Node(20); // ❌ violates BST property
  BST invalidBST = BST();
  invalidBST.root = invalidRoot;

  print("Is invalid BST valid? ${invalidBST.isValidBST()}"); // ❌ false
}

// ✅ Key Points
// Uses min/max bounds to ensure correctness across the entire tree.

// Time complexity: 
// 𝑂(𝑛)since every node is checked once.
// Works even if the tree is not balanced.