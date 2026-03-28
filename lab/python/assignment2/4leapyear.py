year = int(input("Enter Year: "))

if year % 4 == 0 or year % 400 == 0 or year % 100 == 0:
    print(year, "is a Leapyear.")
else: 
    print(year, "is not a Leapyear.")