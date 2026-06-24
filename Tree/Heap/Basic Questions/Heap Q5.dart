class MaxHeap {
  List<int> heap = [];

  // Insert function
  void insert(int value) {
    heap.add(value);
    int index = heap.length - 1;

    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (heap[parentIndex] < heap[index]) {
        int temp = heap[parentIndex];
        heap[parentIndex] = heap[index];
        heap[index] = temp;
        index = parentIndex;
      } else {
        break;
      }
    }
  }

  // Find maximum (root element)
  int? findMax() {
    if (heap.isEmpty) return null;
    return heap[0]; // Root is always the maximum
  }

  void printHeap() {
    print(heap);
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();

  maxHeap.insert(10);
  maxHeap.insert(20);
  maxHeap.insert(5);
  maxHeap.insert(30);

  maxHeap.printHeap(); // [30, 20, 5, 10]

  int? maxValue = maxHeap.findMax();
  print("Maximum element: $maxValue"); // 30
}

// Key Point
// In a Max Heap, the maximum element is always at the root (index 0).

// So findMax() is just a constant-time operation O(1).