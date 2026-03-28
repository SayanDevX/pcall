key = True
sum = 0
count = 0

while True:
    num = int(input("Enter Number (0 to Stop): "))

    sum += num

    if num == 0:
        break

    count += 1

print("Sum is:", sum)
print("Count is:", count)
print(f"Average is: {(sum/count):.2f}")
