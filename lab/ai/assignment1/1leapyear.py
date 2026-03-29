year = int(input("Enter A Year: "))

if year % 4 == 0 or (year % 100 == 0 and year % 400 ==0):
    print(year, "is a LeapYear.")
else:
    print(year, "is not a LeapYear.")