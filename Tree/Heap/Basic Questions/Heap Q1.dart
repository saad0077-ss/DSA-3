// Dart implementation of the insert operation in a Max Heap. 
//This function ensures that when a new element is added, the heap property (parent is always greater than children) is maintained:

class MaxHeap {
  List<int> heap = [];

  // Function to insert a new value into the heap
  void insert(int value) {
    heap.add(value); // Step 1: Add at the end
    int index = heap.length - 1;

    // Step 2: Bubble up (heapify up)
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;

      if (heap[parentIndex] < heap[index]) {
        // Swap parent and child
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
  MaxHeap maxHeap = MaxHeap();

  maxHeap.insert(10);
  maxHeap.insert(20);
  maxHeap.insert(5);
  maxHeap.insert(30);

  maxHeap.printHeap(); // Output: [30, 20, 5, 10]
}


// Explanation
// Add element at the end → heap.add(value).

// Bubble up → Compare with parent, swap if child is greater.

// Repeat until heap property is restored.

// This ensures that after every insertion, the largest element remains at the root.