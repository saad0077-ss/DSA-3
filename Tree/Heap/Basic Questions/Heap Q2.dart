//  Min Heap insertion function in Dart. It ensures that the smallest element always stays at the root:

class MinHeap {
  List<int> heap = [];

  // Function to insert a new value into the Min Heap
  void insert(int value) {
    heap.add(value); // Step 1: Add at the end
    int index = heap.length - 1;

    // Step 2: Bubble up (heapify up)
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;

      if (heap[parentIndex] > heap[index]) {
        // Swap parent and child if parent is larger
        int temp = heap[parentIndex];
        heap[parentIndex] = heap[index];
        heap[index] = temp;

        // Move up to parent index
        index = parentIndex;
      } else {
        break; // Heap property satisfied
      }
    }
  }

  // Utility function to print heap
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

  minHeap.printHeap(); // Output: [5, 20, 10, 30]
}


// Explanation
// Add element at the end → heap.add(value).

// Bubble up → Compare with parent, swap if parent is greater.

// Repeat until heap property is restored.

// This way, the smallest element always remains at the root of the heap.