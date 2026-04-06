math = float(input("Enter Math marks: "))
science = float(input("Enter Science marks: "))
english = float(input("Enter English marks: "))
history = float(input("Enter History marks: "))
art = float(input("Enter Art marks: "))

total_marks = math + science + english + history + art
average_marks = total_marks / 5

print(f"\nTotal Marks: {total_marks}")
print(f"Average Marks: {average_marks:.2f}")
