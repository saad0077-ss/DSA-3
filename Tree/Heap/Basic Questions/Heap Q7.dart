
class MinHeap {
  List<int> heap = [];

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

  int? extractMin() {
    if (heap.isEmpty) return null;
    int minValue = heap[0];
    heap[0] = heap.last;
    heap.removeLast();

    int index = 0;
    while (true) {
      int left = 2 * index + 1;
      int right = 2 * index + 2;
      int smallest = index;

      if (left < heap.length && heap[left] < heap[smallest]) {
        smallest = left;
      }
      if (right < heap.length && heap[right] < heap[smallest]) {
        smallest = right;
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

  int? getMin() => heap.isEmpty ? null : heap[0];
}

int? findKthLargest(List<int> nums, int k) {
  MinHeap minHeap = MinHeap();

  for (int num in nums) {
    minHeap.insert(num);
    if (minHeap.heap.length > k) {
      minHeap.extractMin(); // keep only k largest
    }
  }

  return minHeap.getMin(); // root is kth largest
}

void main() {
  List<int> arr = [3, 2, 1, 5, 6, 4];
  int k = 2;

  int? result = findKthLargest(arr, k);
  print("The $k-th largest element is: $result"); // Output: 5
}


// Explanation
// Use a Min Heap of size k.

// Insert each element:

// If heap size exceeds k, remove the smallest.

// After processing all elements, the root of the heap is the Kth largest.

// 👉 For arr = [3,2,1,5,6,4] and k = 2, the heap keeps [5,6], so the 2nd largest = 5.