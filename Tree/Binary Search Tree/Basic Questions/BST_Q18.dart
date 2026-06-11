// 20. Breadth First Search (BFS) / Level Order Traversal
// Breadth First Search (BFS) visits nodes level by level from left to right.

// It uses a Queue data structure.

// Example Tree
//         10
//        /  \
//       5    15
//      / \     \
//     3   7     20
// Traversal Order
// 10 → 5 → 15 → 3 → 7 → 20
// Code


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

  void bfs() {
    if (root == null) return;

    List<Node> queue = [];

    queue.add(root!);

    while (queue.isNotEmpty) {
      Node current = queue.removeAt(0);

      print(current.data);

      if (current.left != null) {
        queue.add(current.left!);
      }

      if (current.right != null) {
        queue.add(current.right!);
      }
    }
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

  bst.bfs();
}


// How It Works
// Initial Queue:

// [10]
// Process 10:

// Print 10
// Add 5, 15

// Queue = [5, 15]
// Process 5:

// Print 5
// Add 3, 7

// Queue = [15, 3, 7]
// Process 15:

// Print 15
// Add 20

// Queue = [3, 7, 20]
// Process 3:

// Print 3

// Queue = [7, 20]
// Process 7:

// Print 7

// Queue = [20]
// Process 20:

// Print 20

// Queue = []
// Output
// 10
// 5
// 15
// 3
// 7
// 20
// Time Complexity
// O(n)
// Every node is visited exactly once.

// Space Complexity
// O(n)
// In the worst case, the queue may contain all nodes at one level.