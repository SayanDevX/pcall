my_tuple = (45, 12, 89, 7, 33, 21)
temp_list = list(my_tuple)

n = len(temp_list)
for i in range(n):
    for j in range(0, n - i - 1):
        if temp_list[j] > temp_list[j + 1]:
            temp_list[j], temp_list[j + 1] = temp_list[j + 1], temp_list[j]

sorted_tuple = tuple(temp_list)

print("Original Tuple:", my_tuple)
print("Sorted Tuple:", sorted_tuple)
