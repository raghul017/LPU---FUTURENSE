# three questions on lists


# 1 - Count the Number of Vowels in a String:
def count_vowels(s):
    count = 0
    for char in s:
        if char.lower() in ["a", "e", "i", "o", "u"]:
            count += 1
    return count


print(count_vowels("hello"))


# 2 - Write a function that takes a list of integers as input and returns a new list containing only the elements that appear more than once in the original list.


def find_duplicates(nums):
    seen = set()
    duplicates = set()
    for num in nums:
        if num in seen:
            duplicates.add(num)
        else:
            seen.add(num)
    return list(duplicates)


nums = [4, 3, 2, 7, 8, 2, 3, 1]
result = find_duplicates(nums)
print(result)


# 3 - Implement a function to find the first non-repeating character in a string. Return the character itself, or None if there are no non-repeating characters.


def first_non_repeating_char(s):
    char_count = {}
    for char in s:
        if char in char_count:
            char_count[char] += 1
        else:
            char_count[char] = 1
    for char in s:
        if char_count[char] == 1:
            return char
    return None


s = "aabbccd"
result = first_non_repeating_char(s)
print(result)
