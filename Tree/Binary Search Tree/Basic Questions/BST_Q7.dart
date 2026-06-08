// 7. Find Height of Tree

// The height of a tree is the number of nodes in the longest path from the root to a leaf node.

// Example Tree
//        10
//       /  \
//      5    15
//     /
//    3

// Longest path:

// 10 → 5 → 3

// Height:

// 3
// Logic

// For every node:

// Height = 1 + max(leftHeight, rightHeight)

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

  int height() {
    return _height(root);
  }

  int _height(Node? root) {
    if (root == null) {
      return 0;
    }

    int leftHeight = _height(root.left);
    int rightHeight = _height(root.right);

    return 1 + (leftHeight > rightHeight
        ? leftHeight
        : rightHeight);
  }
}

void main() {
  BST bst = BST();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);

  print("Height: ${bst.height()}");
}
// How It Works

// Tree:

//        10
//       /  \
//      5    15
//     /
//    3

// Calculation:

// Node 3  → Height = 1
// Node 5  → 1 + max(1,0) = 2
// Node 15 → Height = 1
// Node 10 → 1 + max(2,1) = 3
// Output
// Height: 3
// Time Complexity
// O(n)

// Every node is visited once.

// Formula

// H(node)=1+max(H(left),H(right))

// This recursive formula is the basis for finding the height of any binary tree.