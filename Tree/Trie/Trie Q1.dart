class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;

  // Number of words passing through this node
  int wordCount = 0;
}

class Trie {
  TrieNode root = TrieNode();

  // Insert a word
  void insert(String word) {
    TrieNode node = root;

    for (String ch in word.split('')) {
      node = node.children.putIfAbsent(ch, () => TrieNode());
      node.wordCount++;
    }

    node.isEndOfWord = true;
  }

  String longestRepeatedPrefix({int minCount = 2}) {
    String bestPrefix = "";

    void dfs(TrieNode node, String prefix) {
      if (node.wordCount >= minCount && prefix.length > bestPrefix.length) {
        bestPrefix = prefix;
      }

      for (var entry in node.children.entries) {
        dfs(entry.value, prefix + entry.key);
      }
    }

    dfs(root, "");
    return bestPrefix;
  }
}

void main() {
  Trie trie = Trie();

  trie.insert("apple");
  trie.insert("application");
  trie.insert("app");
  trie.insert("ape");
  trie.insert("apt");
  trie.insert("bat");
  trie.insert("ball");
  trie.insert("banana");
  trie.insert("batman");
  trie.insert("banana");
  trie.insert("band");
  trie.insert("bank");

 print("Most Repeated Prefix: ${trie.longestRepeatedPrefix()}");
}
