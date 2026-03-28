num1 = int(input("Enter 1st Number: "))
num2 = int(input("Enter 2nd Number: "))

i = num1
flag = True
prime = []

for i in range (num1, num2+1):
    if i < 2:
        continue

    flag = True

    for j in range (2, i):
        if i % j == 0:
            flag = False
            break

    if flag == True:
        prime.append(i)


if prime:
    print("Prime Numbers:", prime)

else:
    print("Not prime")



