// 14. Check if Tree is Empty

// A tree is considered empty when its root is null.

// Logic
// If root == null
//     Tree is Empty
// Else
//     Tree is Not Empty
// Code
class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}
  
class BST {
  Node? root;

  bool isEmpty() {
    return root == null;
  }

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
}

void main() {
  BST bst = BST();

  print(bst.isEmpty()); // true

  bst.insert(10);

  print(bst.isEmpty()); // false
}
// Example 1
// root = null

// Output:

// true

// Tree:

// Empty Tree
// Example 2

// After:

// bst.insert(10);

// Tree:

// 10

// Output:

// false
// Time Complexity
// O(1)

// Only one check is performed:

// root == null