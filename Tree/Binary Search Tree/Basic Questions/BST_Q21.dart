// Search in BST (Recursive)

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

  bool search(int value) {
    return _search(root, value);
  }

  bool _search(Node? node, int value) {
    if (node == null) return false;
    if (node.data == value) return true;

    if (value < node.data) {
      return _search(node.left, value);
    } else {
      return _search(node.right, value);
    }
  }
}

void main() {
  List<int> arr = [10, 5, 20, 3, 7, 15, 25];
  BST bst = BST();

  for (var value in arr) {
    bst.insert(value);
  }

  print("Search 15: ${bst.search(15)}"); // true
  print("Search 8: ${bst.search(8)}");   // false
}


//  Key Point:

// BST property ensures efficient search: average time complexity 
// 𝑂(log 𝑛), worst case 𝑂(𝑛)if skewed.