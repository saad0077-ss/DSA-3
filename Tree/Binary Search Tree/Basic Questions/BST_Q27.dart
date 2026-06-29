// 🧩 Concept
// * When deleting a node with two children:

// 1. Find the inOrder successor (smallest node in the right subtree) OR inOrder predecessor (largest node in the left subtree).

// 2. Replace the node’s value with that successor/predecessor.

// 3. Delete the successor/predecessor node (which will have at most one child).

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

  // ✅ Delete node (handles leaf, one child, two children)
  Node? delete(Node? node, int value) {
    if (node == null) return null;

    if (value < node.data) {
      node.left = delete(node.left, value);
    } else if (value > node.data) {
      node.right = delete(node.right, value);
    } else {
      // Found the node
      if (node.left == null && node.right == null) {
        // Leaf node
        return null;
      } else if (node.left == null) {
        // One child (right)
        return node.right;
      } else if (node.right == null) {
        // One child (left)
        return node.left;
      } else {
        // Two children
        Node successor = _minValueNode(node.right!);
        node.data = successor.data;
        node.right = delete(node.right, successor.data);
      }
    }
    return node;
  }

  // Helper: find minimum node in subtree
  Node _minValueNode(Node node) {
    Node current = node;
    while (current.left != null) {
      current = current.left!;
    }
    return current;
  }

  void deleteNode(int value) {
    root = delete(root, value);
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
  List<int> arr = [20, 10, 30, 5, 15, 25, 35];
  BST bst = BST();

  for (var value in arr) {
    bst.insert(value);
  }

  print("Before Deletion:");
  bst.inOrder();

  bst.deleteNode(20); // ✅ node with two children

  print("After Deletion:");
  bst.inOrder();
}


// ✅ Key Point:  
// This unified delete function now handles all cases:

// Leaf node

// One child

// Two children 