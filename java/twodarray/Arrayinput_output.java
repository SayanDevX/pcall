
import java.util.*;

class Arrayinput_output {

    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter Number of Rows: ");
        int rows = input.nextInt();
        System.out.print("Enter Number of Columns: ");
        int columns = input.nextInt();

        int array[][] = new int[rows][columns];
        System.out.printf("Enter Values for %dx%d Array: \n", rows, columns);
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                array[i][j] = input.nextInt();
            }
        }
        System.out.println("Enterd Array Is: ");
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                System.out.printf("%d ", array[i][j]);
            }
            System.out.println();
        }
    }
}
