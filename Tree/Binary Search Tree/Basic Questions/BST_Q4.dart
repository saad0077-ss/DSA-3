// Postorder Traversal (Left → Right → Root)
// In postorder traversal, you visit nodes in this order:

// 1. Left subtree

// 2. Right subtree

// 3. Root node

  //     A
  //    / \
  //   B   C
  //  / \
  // D   E

  // Postorder traversal:
  // D → E → B → C → A

//   Step-by-step
//1.  Traverse the left subtree of A:
//   Visit D
//   Visit E
//   Visit B
//2. Traverse the right subtree of A:
//   Visit C
//3. Visit the root:
//   A



// Pseudocode

// postorder(node):
//     if node is not null:
//         postorder(node.left)
//         postorder(node.right)
//         visit(node)


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

  void postOrder() {
    _postOrder(root);
  }

  void _postOrder(Node? root) {
    if (root == null) return;

    _postOrder(root.left);   // Left
    _postOrder(root.right);  // Right
    print(root.data);        // Root
  }
}

void main() {
  BST bst = BST();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);

  bst.postOrder();
}
      

