from typing import List


def selection_sort(numbers: List[int]) -> List[int]:
    len_numbers = len(numbers)
    for i in range(len_numbers):
        min_index = i
        for j in range(i+1, len_numbers):
            if numbers[min_index] > numbers[j]:
                min_index = j
        numbers[i], numbers[min_index] = numbers[min_index], numbers[i]
    return numbers


if __name__ == '__main__':
    nums = [2, 3, 56, 0, 2,2,3,4,3,2,38,1]
    print(selection_sort(nums))
