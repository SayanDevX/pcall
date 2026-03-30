for number in range(10):
    if number == 5:
        break  
    print(number, end=" ")

for number in range(6):
    if number % 2 == 0:
        continue  
    print(number, end=" ")
