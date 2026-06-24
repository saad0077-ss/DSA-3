// 15. Mirror a Binary Tree

// The goal is to swap the left and right child of every node in the tree.

// Before Mirroring
//         10
//        /  \
//       5    15
//      / \     \
//     3   7     20
// After Mirroring
//         10
//        /  \
//       15   5
//      /    / \
//     20   7   3
// Logic

// For every node:

// Swap left and right
// Mirror the left subtree
// Mirror the right subtree
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

  void inOrder() {
    _inOrder(root);
    print("");
  }

  void _inOrder(Node? root) {
    if (root == null) return;

    _inOrder(root.left);
    print(root.data);
    _inOrder(root.right);
  }

  void mirror() {
    _mirror(root);
  }

  void _mirror(Node? root) {
    if (root == null) {
      return;
    }

    // Swap left and right
    Node? temp = root.left;
    root.left = root.right;
    root.right = temp;

    _mirror(root.left);
    _mirror(root.right);
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

  print("Before Mirror:");
  bst.inOrder();

  bst.mirror();

  print("After Mirror:");
  bst.inOrder();
}
// Tree Before
//         10
//        /  \
//       5    15
//      / \     \
//     3   7     20
// Tree After
//         10
//        /  \
//       15   5
//      /    / \
//     20   7   3
// Output (InOrder)

// Before mirror:

// 3
// 5
// 7
// 10
// 15
// 20

// After mirror:

// 20
// 15
// 10
// 7
// 5
// 3
// Time Complexity
// O(n)

// Every node is visited exactly once and its children are swapped.