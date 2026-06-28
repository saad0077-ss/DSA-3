// Method 1: Sequential Insertion
// Insert each element of the array one by one into the BST. The tree structure depends on the order of elements.


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

  void inOrder() => _inOrder(root);

  void _inOrder(Node? node) {
    if (node == null) return;
    _inOrder(node.left);
    print(node.data);
    _inOrder(node.right);
  }
}

void main() {
  List<int> arr = [10, 5, 20, 3, 7, 15, 25];
  BST bst = BST();

  for (var value in arr) {
    bst.insert(value);
  }

  print("InOrder Traversal:");
  bst.inOrder();
}
