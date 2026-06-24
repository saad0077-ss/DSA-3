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

  // Delete root (extractMax)
  int? delete() {
    if (heap.isEmpty) return null;

    // Step 1: Root element (max)
    int maxValue = heap[0];

    // Step 2: Move last element to root
    heap[0] = heap.last;
    heap.removeLast();

    // Step 3: Heapify down
    int index = 0;
    while (true) {
      int leftChild = 2 * index + 1;
      int rightChild = 2 * index + 2;
      int largest = index;

      if (leftChild < heap.length && heap[leftChild] > heap[largest]) {
        largest = leftChild;
      }
      if (rightChild < heap.length && heap[rightChild] > heap[largest]) {
        largest = rightChild;
      }

      if (largest != index) {
        int temp = heap[index];
        heap[index] = heap[largest];
        heap[largest] = temp;
        index = largest;
      } else {
        break;
      }
    }

    return maxValue;
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

  print("Heap before deletion:");
  maxHeap.printHeap(); // [30, 20, 5, 10]

  int? deleted = maxHeap.delete();
  print("Deleted element: $deleted"); // 30
  print("Heap after deletion:");
  maxHeap.printHeap(); // [20, 10, 5]
}


// ⚡ How It Works
// Take root (max) → store it for return.

// Replace root with last element → keeps the tree complete.

// Heapify down → compare with children, swap with larger one until property is restored.

// This ensures the largest element is removed while the heap remains valid.