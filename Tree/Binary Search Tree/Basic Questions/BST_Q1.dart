// 1. Create a Binary Tree
// Implement a Node class and manually create a tree.

    //       10
    //     /    \
    //    5      15
    //   / \    /  \
    //  3   7  12  20


   class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BST {
  Node? root;

  Node? insert(Node? root, int value) {
    if (root == null) {
      return Node(value);
    }

    if (value < root.data) {
      root.left = insert(root.left, value);
    } else if (value > root.data) {
      root.right = insert(root.right, value);
    }

    return root;
  }
}

void main() {
  BST bst = BST();

  bst.root = bst.insert(bst.root, 10);
  bst.root = bst.insert(bst.root, 5);
  bst.root = bst.insert(bst.root, 15);
  bst.root = bst.insert(bst.root, 3);
  bst.root = bst.insert(bst.root, 7);
}