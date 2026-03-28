
import java.util.*;

class CumulativeLength {

    public static void main(String args[]) {
        String concatName = Scanning();
        System.out.println("Length of two string is: " + concatName.length());
    }

    public static String Scanning() {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter 1st String: ");
        String name1 = input.next();
        System.out.print("Enter 2nd String: ");
        String name2 = input.next();
        return name1 + name2;
    }
}
