n = int(input("Enter A Number: "))
rev = ''

for ch in str(n):
    rev = ch + rev

print(int(rev))