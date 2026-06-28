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

  // ✅ Delete only if it's a leaf node
  Node? deleteLeaf(Node? node, int value) {
    if (node == null) return null;

    if (value < node.data) {
      node.left = deleteLeaf(node.left, value);
    } else if (value > node.data) {
      node.right = deleteLeaf(node.right, value);
    } else {
      // Found the node
      if (node.left == null && node.right == null) {
        // It's a leaf → delete
        return null;
      } else {
        print("Node $value is not a leaf, cannot delete!");
      }
    }
    return node;
  }

  void deleteLeafNode(int value) {
    root = deleteLeaf(root, value);
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

  print("Before Deletion:");
  bst.inOrder();

  bst.deleteLeafNode(3); // ✅ deletes leaf node
  bst.deleteLeafNode(10); // ❌ not a leaf, won't delete

  print("After Deletion:");
  bst.inOrder();
}
