//https://leetcode.com/problems/insert-into-a-binary-search-tree/
//You are given the root node of a binary search tree (BST) and a value to insert into the tree. 
//Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.

//Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.



  // Insert 5 into:
  //     4
  //    / \
  //   2   7
  //  / \
  // 1   3

  //Result:
  //     4
  //    / \
  //   2   7
  //  / \  /
  // 1   3 5

  class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val, [this.left, this.right]);
}

class Solution {
  TreeNode? insertIntoBST(TreeNode? root, int val) {
    if (root == null) {
      return TreeNode(val);
    }

    if (val < root.val) {
      root.left = insertIntoBST(root.left, val);
    } else {
      root.right = insertIntoBST(root.right, val);
    }

    return root;
  }
}

void inOrder(TreeNode? root) {
  if (root == null) return;

  inOrder(root.left);
  print(root.val);
  inOrder(root.right);
}

void main() {
  TreeNode root = TreeNode(4);
  root.left = TreeNode(2);
  root.right = TreeNode(7);
  root.left!.left = TreeNode(1);
  root.left!.right = TreeNode(3);

  Solution solution = Solution();

  root = solution.insertIntoBST(root, 5)!;

  print("inOrder Traversal:");
  inOrder(root);
}