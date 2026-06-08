// 8. Search an Element in BST

// The goal is to check whether a value exists in the Binary Search Tree.

// Logic

// For a BST:

// If value equals current node → Found
// If value is smaller → Go Left
// If value is larger → Go Right
// If you reach null → Not Found
 


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

  bool search(int value) {
    return _search(root, value);
  }

  bool _search(Node? root, int value) {
    if (root == null) {
      return false;
    }

    if (root.data == value) {
      return true;
    }

    if (value < root.data) {
      return _search(root.left, value);
    }

    return _search(root.right, value);
  }
}

void main() {
  BST bst = BST();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);

  print(bst.search(7));   // true
  print(bst.search(20));  // false
}
// Tree
//        10
//       /  \
//      5    15
//     / \
//    3   7
// Example: Search 7
// Start at 10
// 7 < 10 → Go Left

// At 5
// 7 > 5 → Go Right

// At 7
// Found

// Output:

// true
// Example: Search 20
// Start at 10
// 20 > 10 → Go Right

// At 15
// 20 > 15 → Go Right

// null reached
// Not Found

// Output:

// false
// Time Complexity
// Average Case: O(log n)
// Worst Case (skewed tree): O(n)

// Because a BST allows you to eliminate half of the remaining nodes at each step in a balanced tree.