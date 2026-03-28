
import java.util.*;

class Ascendingarray {

    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter Size Of Array: ");
        int size = input.nextInt();
        int numbers[] = new int[size];

        System.out.printf("Enter %d Numbers: \n", size);
        for (int i = 0; i < size; i++) {
            numbers[i] = input.nextInt();
        }

        boolean isAscending = true;
        for (int i = 0; i < size - 1; i++) {
            if (numbers[i] > numbers[i + 1]) {
                isAscending = false;
            }
        }

        if (isAscending) {
            System.out.println("Array is in ascending order.");
        } else {
            System.out.println("Array is not in ascending order.");
        }
    }

}
