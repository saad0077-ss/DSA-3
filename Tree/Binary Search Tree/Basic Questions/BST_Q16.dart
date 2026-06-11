// 17. Print Nodes at Each Level (Level Order Traversal)

// This prints all nodes level by level from top to bottom.

// Example Tree
//         10
//        /  \
//       5    15
//      / \     \
//     3   7     20

// Output:

// Level 0: 10
// Level 1: 5 15
// Level 2: 3 7 20
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

  void printLevels() {
    if (root == null) return;

    List<Node> queue = [root!];
    int level = 0;

    while (queue.isNotEmpty) {
      int size = queue.length;

      print("Level $level:");

      for (int i = 0; i < size; i++) {
        Node current = queue.removeAt(0);

        print(current.data);

        if (current.left != null) {
          queue.add(current.left!);
        }

        if (current.right != null) {
          queue.add(current.right!);
        }
      }

      level++;
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

  bst.printLevels();
}
// Output
// Level 0:
// 10

// Level 1:
// 5
// 15

// Level 2:
// 3
// 7
// 20
// How It Works

// Queue initially:

// [10]

// Process Level 0:

// Print 10
// Add 5, 15

// Queue: [5, 15]

// Process Level 1:

// Print 5, 15
// Add 3, 7, 20

// Queue: [3, 7, 20]

// Process Level 2:

// Print 3, 7, 20

// Done.

// Time Complexity
// O(n)

// Every node is visited exactly once.

// Note

// This is also called Breadth First Search (BFS) or Level Order Traversal, one of the most important tree traversals for interviews.