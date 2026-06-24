// In a Min Heap, the minimum element is always at the root (index 0). 
//So finding the minimum is a very simple, constant‑time operation. Here’s how you can implement it in Dart:


class MinHeap {
  List<int> heap = [];

  // Insert function
  void insert(int value) {
    heap.add(value);
    int index = heap.length - 1;

    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (heap[parentIndex] > heap[index]) {
        int temp = heap[parentIndex];
        heap[parentIndex] = heap[index];
        heap[index] = temp;
        index = parentIndex;
      } else {
        break;
      }
    }
  }

  // Find minimum (root element)
  int? findMin() {
    if (heap.isEmpty) return null;
    return heap[0]; // Root is always the minimum
  }

  void printHeap() {
    print(heap);
  }
}

void main() {
  MinHeap minHeap = MinHeap();

  minHeap.insert(10);
  minHeap.insert(20);
  minHeap.insert(5);
  minHeap.insert(30);

  minHeap.printHeap(); // [5, 20, 10, 30]

  int? minValue = minHeap.findMin();
  print("Minimum element: $minValue"); // 5
}


// Key Point
// In a Min Heap, the smallest element is always at the root (index 0).

// So findMin() is an O(1) operation — very efficient.