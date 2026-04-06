numbers = [10, 5, 20, 8, 15]
maximum = minimum = numbers[0]

for num in numbers[1:]:
    if num > maximum:
        maximum = num
    elif num < minimum:
        minimum = num

print("Maximum:", maximum)
print("Minimum:", minimum)
