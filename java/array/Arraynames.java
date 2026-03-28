
import java.util.*;

class Arraynames {

    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter Size Of Array: ");
        int size = input.nextInt();
        String[] a = new String[size];

        System.out.printf("Enter %d Names:\n", size);
        for (int i = 0; i < size; i++) {
            a[i] = input.next();
        }
        for (int i = 0; i < size; i++) {
            System.out.printf("Name %d is: %s\n", i + 1, a[i]);
        }
    }
}
