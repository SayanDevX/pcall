
import java.util.Scanner;

class Execute implements Runnable {

    int number;

    Execute(int number) {
        this.number = number;
    }

    @Override
    public void run() {
        long fact = 1;
        for (int i = 1; i <= number; i++) {
            fact *= i;
        }
        System.out.println("Factorial of " + number + " is: " + fact);
        System.out.println("Thread used: " + Thread.currentThread().getName());
        System.out.println();
    }

}

class Factorial {

    public static void main(String args[]) throws InterruptedException {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter number of values: ");
        int iteration = input.nextInt();

        for (int i = 1; i <= iteration; i++) {
            System.out.print("Enter " + i + " number: ");
            int num = input.nextInt();
            Thread t = new Thread(new Execute(num));
            t.start();
            t.join();
        }
        input.close();
    }
}
