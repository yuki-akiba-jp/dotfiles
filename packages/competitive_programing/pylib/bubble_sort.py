from typing import List


def bubble_sort(numbers: List[int]) -> List[int]:
    len_numbers = len(numbers)
    for i in range(len_numbers):
        for j in range(len_numbers-i-1):
            if numbers[j] > numbers[j+1]:
                numbers[j],numbers[j+1] = numbers[j+1],numbers[j]
    return numbers

if __name__ == '__main__':
    nums = [2,3,56,0,2]
    print(bubble_sort(nums))
