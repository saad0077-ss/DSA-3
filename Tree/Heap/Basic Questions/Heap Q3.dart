class MinHeap {
  List<int> heap = [];

  // Insert function (already explained earlier)
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

  // Delete root (extractMin)
  int? delete() {
    if (heap.isEmpty) return null;

    // Step 1: Root element (min)
    int minValue = heap[0];

    // Step 2: Move last element to root
    heap[0] = heap.last;
    heap.removeLast();

    // Step 3: Heapify down
    int index = 0;
    while (true) {
      int leftChild = 2 * index + 1;
      int rightChild = 2 * index + 2;
      int smallest = index;

      if (leftChild < heap.length && heap[leftChild] < heap[smallest]) {
        smallest = leftChild;
      }
      if (rightChild < heap.length && heap[rightChild] < heap[smallest]) {
        smallest = rightChild;
      }

      if (smallest != index) {
        int temp = heap[index];
        heap[index] = heap[smallest];
        heap[smallest] = temp;
        index = smallest;
      } else {
        break;
      }
    }

    return minValue;
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

  print("Heap before deletion:");
  minHeap.printHeap(); // [5, 20, 10, 30]

  int? deleted = minHeap.delete();
  print("Deleted element: $deleted"); // 5
  print("Heap after deletion:");
  minHeap.printHeap(); // [10, 20, 30]
}


// ⚡ How It Works
// Take root (min) → store it for return.

// Replace root with last element → maintain complete binary tree.

// Heapify down → compare with children, swap with smaller one until property is restored.

// This ensures the heap remains valid after deletion.