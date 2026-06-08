// 2. Inorder Traversal (Left → Root → Right)
//Inorder traversal is a way of visiting all the nodes in a binary tree in a specific order.
//In inorder traversal, you visit nodes in this sequence:
// Left subtree → Root node → Right subtree

  //     A                         Consider this binary tree: 
  //    / \                        The inorder traversal would be:
  //   B   C                        D → B → E → A → C
  //  / \
  // D   E


  // How it works step-by-step
  // Go to the leftmost node (D)
  
  // Visit the node (D)
  
  // Move up and visit its parent (B)
  
  // Visit the right child (E)
  
  // Move up to root (A)
  
  // Visit right subtree (C)

  // Key idea
// Always process left first, then root, then right
// It’s commonly used in binary search trees (BSTs) to get values in sorted order


// Pseudocode

// inorder(node):
    // if node is not null:
    //     inorder(node.left)
    //     visit(node)
    //     inorder(node.right)


class Node{
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BST{
  Node? root;

  void insert(int value){
    root = _insert(root,value);

  }

  Node? _insert(Node? root,int value){
    if(root == null){
      return Node(value);
    }

    if(value < root.data){
      root.left = _insert(root.left,value);
    }else if(value > root.data){
      root.right = _insert(root.right,value);
    }

    return root;
  }

  void inOrder(){
    _inOrder(root);
  }

  void _inOrder(Node? root){
    if(root == null)return;

    _inOrder(root.left);
    print(root.data);
    _inOrder(root.right);
  }
}


void main(){
  BST bst = BST();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);      
  bst.insert(3);
  bst.insert(7);

  bst.inOrder();
}

