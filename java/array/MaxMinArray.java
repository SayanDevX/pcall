
import java.util.*;

class MaxMinArray {

    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter Size of Array: ");
        int size = input.nextInt();
        int values[] = new int[size];

        System.out.printf("Enter %d Numbers: \n", size);
        for (int i = 0; i < size; i++) {
            values[i] = input.nextInt();
        }

        int min = values[0];
        int max = values[0];

        for (int i = 0; i < values.length; i++) {
            if (values[i] < min) {
                min = values[i];
            }
            if (values[i] > max) {
                max = values[i];
            }
        }

        System.out.println("Min Value Is: " + min);
        System.out.println("Max Value Is: " + max);
    }
}
