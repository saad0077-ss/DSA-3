// * The LCA of two nodes in a BST is the lowest (deepest) node that has both nodes as descendants.

// * In a BST, we can use the property:

// => If both values are smaller than root → LCA lies in the left subtree.

// => If both values are greater than root → LCA lies in the right subtree.

// => Otherwise, the root is the LCA.


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

  // ✅ Find LCA of two nodes
  Node? lowestCommonAncestor(Node? node, int n1, int n2) {
    if (node == null) return null;

    if (n1 < node.data && n2 < node.data) {
      return lowestCommonAncestor(node.left, n1, n2);
    } else if (n1 > node.data && n2 > node.data) {
      return lowestCommonAncestor(node.right, n1, n2);
    } else {
      return node; // Split point → LCA
    }
  }
}

void main() {
  List<int> arr = [20, 10, 30, 5, 15, 25, 35];
  BST bst = BST();

  for (var value in arr) {
    bst.insert(value);
  }

  Node? lca = bst.lowestCommonAncestor(bst.root, 5, 15);
  print("LCA of 5 and 15: ${lca?.data}"); // Output: 10

  lca = bst.lowestCommonAncestor(bst.root, 5, 30);
  print("LCA of 5 and 30: ${lca?.data}"); // Output: 20
}


// ✅ Key Points
// Time complexity: 
// 𝑂(ℎ), where ℎ is the height of the tree.Works efficiently in BST because of ordering property.
// For a general binary tree (not BST), you’d need a different approach using DFS.