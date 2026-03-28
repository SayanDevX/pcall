
import java.util.*;

class EtoI {

    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter A String: ");
        String name = input.next();
        String result = "";
        for (int i = 0; i < name.length(); i++) {
            if (name.charAt(i) == 'e') {
                result += "i";
            } else {
                result += name.charAt(i);
            }
        }
        System.out.println(result);
    }
}
