import sys
from typing import Optional


class Heap(object):
    def __init__(self):
        self.heap = [-1*sys.maxsize]
        self.current_size = 0

    def parent_index(self, index: int) -> int:
        return index//2

    def left_child_index(self, index: int) -> int:
        return 2*index

    def right_child_index(self, index: int) -> int:
        return (2*index)+1

    def swap(self, index1: int, index2: int) -> None:
        self.heap[index1], self.heap[index2] = self.heap[index2], self.heap[index1]

    def heapify_up(self, index: int) -> None:
        while self.parent_index(index) > 0:
            if self.heap[index] < self.heap[self.parent_index(index)]:
                self.swap(index, self.parent_index(index))
            index = self.parent_index(index)

    def push(self, value: int) -> None:
        self.heap.append(value)
        self.current_size += 1
        self.heapify_up(self.current_size)

    def min_child_index(self, index: int) -> int:
        if self.right_child_index(index) > self.current_size:
            return self.left_child_index(index)
        else:
            if (self.heap[self.left_child_index(index)] < self.heap[self.right_child_index(index)]):
                return self.left_child_index(index)
            else:
                return self.right_child_index(index)

    def heapify_down(self, index: int) -> None:
        while self.left_child_index(index) <= self.current_size:
            min_child_index = self.min_child_index(index)
            if self.heap[index] > self.heap[min_child_index]:
                self.swap(index, min_child_index)
            index = min_child_index

    def pop(self) -> Optional[int]:
        if len(self.heap) == 1:
            return

        root = self.heap[1]
        data = self.heap.pop()
        if len(self.heap) == 1:
            return root
        self.heap[1] = data
        self.current_size -= 1
        self.heapify_down(1)
        return root


if __name__ == '__main__':
    heap = Heap()
    heap.push(5)
    heap.pop()
    heap.push(6)
    heap.push(8)
    heap.push(3)
    heap.push(2)
    print(heap.heap)
