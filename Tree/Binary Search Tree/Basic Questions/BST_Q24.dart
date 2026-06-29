
// 🧩 Delete Node with One Child (Dart)

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

  // ✅ Delete node with one child
  Node? deleteOneChild(Node? node, int value) {
    if (node == null) return null;

    if (value < node.data) {
      node.left = deleteOneChild(node.left, value);
    } else if (value > node.data) {
      node.right = deleteOneChild(node.right, value);
    } else {
      // Found the node
      if (node.left != null && node.right == null) {
        // Only left child
        return node.left;
      } else if (node.right != null && node.left == null) {
        // Only right child
        return node.right;
      } else {
        print("Node $value is not a one-child node, cannot delete!");
      }
    }
    return node;
  }

  void deleteNodeWithOneChild(int value) {
    root = deleteOneChild(root, value);
  }

  void inOrder() => _inOrder(root);

  void _inOrder(Node? node) {
    if (node == null) return;
    _inOrder(node.left);
    print(node.data);
    _inOrder(node.right);
  }
}

void main() {
  List<int> arr = [10, 5, 20, 3, 7, 15]; 
  BST bst = BST();

  for (var value in arr) {
    bst.insert(value);
  }

  print("Before Deletion:");
  bst.inOrder();

  bst.deleteNodeWithOneChild(5); // ✅ deletes node with one child
  bst.deleteNodeWithOneChild(10); // ❌ not a one-child node

  print("After Deletion:");
  bst.inOrder();
}


// ✅ Key Point:

// If the node has exactly one child, we replace the node with its child.

// If it has two children or no children, we don’t delete here (handled separately).