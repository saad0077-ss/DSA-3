// 11. Find Minimum Value in BST
// Logic

// In a BST, the smallest value is always the leftmost node.

// Keep moving left until left becomes null.



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

  int findMin() {
    if (root == null) {
      throw Exception("Tree is empty");
    }

    Node current = root!;

    while (current.left != null) {
      current = current.left!;
    }

    return current.data;
  }
}

void main() {
  BST bst = BST();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(20);

  print("Minimum Value: ${bst.findMin()}");
}



// Tree
//        10
//       /  \
//      5    15
//     /       \
//    3         20
// Output
// Minimum Value: 3
// Time Complexity

// For both operations:

// Balanced BST  : O(log n)
// Skewed BST    : O(n)

// Because you only travel along one path (leftmost or rightmost), not the entire tree.