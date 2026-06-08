// Preorder Traversal (Root → Left → Right)

// In preorder traversal, you visit nodes in this order:

// 1. Root node
// 2. Left subtree
// 3. Right subtree


  //     A
  //    / \
  //   B   C
  //  / \
  // D   E

  // Preorder traversal:
  // A → B → D → E → C

// Step-by-step
// 1. Visit A (root)
// 2. Traverse left subtree of A:
// Visit B
// Visit D
// Visit E
// 3. Traverse right subtree of A:
// Visit C

// Pseudocode

// preorder(node):
//     if node is not null:
//         visit(node)
//         preorder(node.left)
//         preorder(node.right)


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

  void preOrder() {
    _preOrder(root);
  }

  void _preOrder(Node? root) {
    if (root == null) return;

    print(root.data);     // Root
    _preOrder(root.left); // Left
    _preOrder(root.right);// Right
  }
}

void main() {
  BST bst = BST();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);

  bst.preOrder();
}