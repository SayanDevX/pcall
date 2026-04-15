def is_super(k):
    if k == 1:
        return True
    if k <= 0:
        return False
    if k % 2 == 0:
        return is_super(k // 2)
    if k % 3 == 0:
        return is_super(k // 3)
    return False

def main():
    try:
        k = int(input("Enter a number: "))
        if is_super(k):
            print(f"{k} is a super number.")
        else:
            print(f"{k} is NOT a super number.")
    except ValueError:
        print("Please enter a valid integer.")

if __name__ == "__main__":
    main()