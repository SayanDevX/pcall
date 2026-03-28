
import java.util.InputMismatchException;
import java.util.Scanner;

class Arithmetic {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        try {
            System.out.print("Enter 1st Value: ");
            double num1 = input.nextInt();
            System.out.print("Enter 2nd Value: ");
            double num2 = input.nextInt();
            System.out.println(num1 / num2);
        } catch (ArithmeticException e) {
            System.out.println("Error: Can't divide");
        } catch (InputMismatchException e) {
            System.out.println("Error: Enter integers");
        } finally {
            input.close();
            System.out.println("always executes");
        }
    }
}
