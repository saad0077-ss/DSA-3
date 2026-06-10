// 12. Count Nodes at Level K

// The goal is to count how many nodes are present at a given level.

// Level Numbering
//        10          ← Level 0
//       /  \
//      5    15       ← Level 1
//     / \     \
//    3   7    20     ← Level 2

// Count:

// Level 0 → 1 node
// Level 1 → 2 nodes
// Level 2 → 3 nodes
// Logic
// If k == 0, we have reached the required level → return 1.
// Otherwise, go to the next level by decreasing k.



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

  int countNodesAtLevel(int k) {
    return _countNodesAtLevel(root, k);
  }

  int _countNodesAtLevel(Node? root, int k) {
    if (root == null) {
      return 0;
    }

    if (k == 0) {
      return 1;
    }

    return _countNodesAtLevel(root.left, k - 1) +
        _countNodesAtLevel(root.right, k - 1);
  }
}

void main() {
  BST bst = BST();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);
  bst.insert(20);

  print("Level 0: ${bst.countNodesAtLevel(0)}");
  print("Level 1: ${bst.countNodesAtLevel(1)}");
  print("Level 2: ${bst.countNodesAtLevel(2)}");
}
// Tree
//        10
//       /  \
//      5    15
//     / \     \
//    3   7    20
// How It Works

// For countNodesAtLevel(2):

// 10 → k=2

// 5 → k=1
// 15 → k=1

// 3 → k=0 → count 1
// 7 → k=0 → count 1
// 20 → k=0 → count 1

// Total:

// 1 + 1 + 1 = 3
// Output
// Level 0: 1
// Level 1: 2
// Level 2: 3
// Time Complexity
// O(n)

// In the worst case, the function may visit all nodes in the tree.