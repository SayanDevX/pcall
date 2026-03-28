
import java.util.*;

class SearchArray {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter Rows Size: ");
        int rows = input.nextInt();
        System.out.print("Enter Columns Size: ");
        int columns = input.nextInt();
        int numbers[][] = new int[rows][columns];

        System.out.println("Enter " + rows + "x" + columns + " matrix: ");
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                numbers[i][j] = input.nextInt();
            }
        }

        System.out.print("Enter Number to Search: ");
        int key = input.nextInt();
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                if (numbers[i][j] == key) {
                    System.out.printf("Element Found At->\nRow: %d\nColumn: %d\n", i + 1, j + 1);
                }
            }
        }
    }
}
