//https://leetcode.com/problems/search-in-a-binary-search-tree/
//700. Search in a Binary Search Tree
//You are given the root of a binary search tree (BST) and an integer val.

//Find the node in the BST that the node's value equals val and return the subtree rooted with that node. If such a node does not exist, return null.

class TreeNode{
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val,[this.left,this.right]);
}


class Solution{
  TreeNode? searchBST(TreeNode? root,int val){
    if(root == null)return null;

    if(root.val == val){
      return root;
    }

    if(val < root.val){
      return searchBST(root.left, val);
    }

    return searchBST(root.right,val);
  }
}

void main() {
  // Creating BST
  TreeNode root = TreeNode(4);
  root.left = TreeNode(2);
  root.right = TreeNode(7);
  root.left!.left = TreeNode(1);
  root.left!.right = TreeNode(3);

  Solution solution = Solution();

  TreeNode? result = solution.searchBST(root, 2);

  if (result != null) {
    print("Found: ${result.val}");
  } else {
    print("Value not found");
  }
}