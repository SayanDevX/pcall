height1 = eval(input("Enter First Height(px): "))
width1 = eval(input("Enter First Width(px): "))

ratio = width1/height1
print("Ratio is:", ratio, end="x\n")

height2 = eval(input("Enter Second Height(px): "))
if type(height2) == int: 
    width2 = int(height2*ratio)
else:
    width2 = float(height2*ratio)

print("Dimensions Should be:", height2, width2)