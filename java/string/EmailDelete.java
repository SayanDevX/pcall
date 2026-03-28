
import java.util.*;

class EmailDelete {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter A Email: ");
        String email = input.next();
        String result = "";
        for (int i = 0; i < email.length(); i++) {
            if (email.charAt(i) == '@') {
                break; 
            }else {
                result += email.charAt(i);
            }
        }
        System.out.println("Username: " + result);
    }
}
