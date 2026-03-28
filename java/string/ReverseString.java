
import java.util.*;

class ReverseString {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter A String: ");
        String name = input.next();
        String reverse = "";
        for (int i = name.length() - 1; i >= 0; i--) {
            reverse = reverse + name.charAt(i);
        }
        System.out.println(reverse);
    }
}
