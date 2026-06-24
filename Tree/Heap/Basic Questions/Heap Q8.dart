class MaxHeap {
  List<int> heap = [];

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

  int? extractMax() {
    if (heap.isEmpty) return null;
    int maxValue = heap[0];
    heap[0] = heap.last;
    heap.removeLast();

    int index = 0;
    while (true) {
      int left = 2 * index + 1;
      int right = 2 * index + 2;
      int largest = index;

      if (left < heap.length && heap[left] > heap[largest]) {
        largest = left;
      }
      if (right < heap.length && heap[right] > heap[largest]) {
        largest = right;
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

  int? getMax() => heap.isEmpty ? null : heap[0];
}

int? findKthSmallest(List<int> nums, int k) {
  MaxHeap maxHeap = MaxHeap();

  for (int num in nums) {
    maxHeap.insert(num);
    if (maxHeap.heap.length > k) {
      maxHeap.extractMax(); // keep only k smallest
    }
  }

  return maxHeap.getMax(); // root is kth smallest
}

void main() {
  List<int> arr = [7, 10, 4, 3, 20, 15];
  int k = 3;

  int? result = findKthSmallest(arr, k);
  print("The $k-th smallest element is: $result"); // Output: 7
}


// Explanation
// Use a Max Heap of size k.

// Insert each element:

// If heap size exceeds k, remove the largest.

// After processing all elements, the root of the heap is the Kth smallest.

// 👉 For arr = [7,10,4,3,20,15] and k = 3, the heap keeps [4,3,7], so the 3rd smallest = 7.