year = int(input("Enter A Year: "))

if year % 4 or (year % 100 and year % 400):
    print(year, "is a LeapYear.")
else:
    print(year, "is not a LeapYear.")