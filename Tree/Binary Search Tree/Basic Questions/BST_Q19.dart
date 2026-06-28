// DFS (Depth First Search)

// DFS means exploring one branch of the tree as deep as possible before backtracking.

// In Trees, DFS has 3 types:

// 1. InOrder (Left → Root → Right)
//        10
//       /  \
//      5    15
//     / \
//    3   7

// Output:

// 3 5 7 10 15
// 2. PreOrder (Root → Left → Right)

// Output:
              
// 10 5 3 7 15
// 3. PostOrder (Left → Right → Root)

// Output:

// 3 7 5 15 10
// DFS Implementation
// InOrder DFS
void inOrder(Node? root) {
  if (root == null) return;

  inOrder(root.left);
  print(root.data);
  inOrder(root.right);
}
// PreOrder DFS
void preOrder(Node? root) {
  if (root == null) return;

  print(root.data);
  preOrder(root.left);
  preOrder(root.right);
}
// PostOrder DFS
void postOrder(Node? root) {
  if (root == null) return;

  postOrder(root.left);
  postOrder(root.right);
  print(root.data);
}
// Generic DFS (PreOrder Style)

// When interviewers ask for "DFS", they often mean:

class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BST {
  Node? root;

  void dfs(Node? root) {
    if (root == null) return;

    print(root.data);

    dfs(root.left);
    dfs(root.right);
  }
}
// BFS vs DFS
// BFS	DFS
// Uses Queue	Uses Stack (or Recursion)
// Level by Level	Goes Deep First
// Level Order Traversal	InOrder, PreOrder, PostOrder
// More memory on wide trees	Usually less memory
// Finds shortest path in unweighted graphs	Good for traversals and backtracking
// Example

// Tree:

//         10
//        /  \
//       5    15
//      / \     \
//     3   7     20
// BFS
// 10 5 15 3 7 20
// DFS (PreOrder)
// 10 5 3 7 15 20
// DFS (InOrder)
// 3 5 7 10 15 20
// DFS (PostOrder)
// 3 7 5 20 15 10
// Interview Shortcut
// DFS = InOrder + PreOrder + PostOrder
// BFS = Level Order Traversal

// For trees, the traversal questions you learned earlier (InOrder, PreOrder, PostOrder) are all forms of DFS.