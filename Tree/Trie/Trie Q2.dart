//  Auto‑completion using Trie implementation in Dart.
// This is one of the most practical applications of a Trie, often used in search bars, IDEs, and text editors.

class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  TrieNode root = TrieNode();

  // Insert a word into the Trie
  void insert(String word) {
    TrieNode node = root;
    for (var ch in word.split('')) {
      node.children.putIfAbsent(ch, () => TrieNode());
      node = node.children[ch]!;
    }
    node.isEndOfWord = true;
  }

  // Auto-complete function
  List<String> autoComplete(String prefix) {
    TrieNode? node = root;

    // Step 1: Traverse to the end of the prefix
    for (var ch in prefix.split('')) {
      if (!node!.children.containsKey(ch)) {
        return []; // Prefix not found
      }
      node = node.children[ch];
    }

    // Step 2: Collect all words starting from this node
    List<String> results = [];
    _dfs(node!, prefix, results);
    return results;
  }

  // DFS helper to collect words
  void _dfs(TrieNode node, String currentWord, List<String> results) {
    if (node.isEndOfWord) {
      results.add(currentWord);
    }
    for (var entry in node.children.entries) {
      _dfs(entry.value, currentWord + entry.key, results);
    }
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("apple");
  trie.insert("app");
  trie.insert("application");
  trie.insert("bat");
  trie.insert("ball");

  print("Autocomplete for 'app': ${trie.autoComplete("app")}");
  print("Autocomplete for 'ba': ${trie.autoComplete("ba")}");
}
