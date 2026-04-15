def get_second_largest(t):
    largest = second_largest = float('-inf')
    for num in t:
        if num > largest:
            second_largest = largest
            largest = num
        elif num > second_largest and num != largest:
            second_largest = num
    return second_largest

my_tuple = (10, 5, 8, 20, 15)
print(get_second_largest(my_tuple))  
