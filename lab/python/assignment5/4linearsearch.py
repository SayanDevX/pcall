def linear_search(arr, target):
    for i in range(len(arr)):
        if arr[i] == target:
            return i  
    return -1  

user_input = input("Enter numbers separated by space: ")
data_list = [int(x) for x in user_input.split()]
target_val = int(input("Enter the element to search for: "))
result = linear_search(data_list, target_val)

if result != -1:
    print(f"Element found at index {result}")
else:
    print("Element not found in the list.")
