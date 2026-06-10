// 10. Find Maximum Value in BST
// Logic

// In a BST, the largest value is always the rightmost node.

// Keep moving right until right becomes null.


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

  int findMax() {
    if (root == null) {
      throw Exception("Tree is empty");
    }

    Node current = root!;

    while (current.right != null) {
      current = current.right!;
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

  print("Maximum Value: ${bst.findMax()}");
}
// Tree
//        10
//       /  \
//      5    15
//     /       \
//    3         20
// Output
// Maximum Value: 20