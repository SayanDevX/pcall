
import java.util.Scanner;

class myRunnable implements Runnable {

    @Override
    public void run() {
        for (int i = 1; i <= 5; i++) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                System.out.println("Thread was interrupted.");
            }
            if (i == 5) {
                System.out.println("Time's up!");
                System.exit(0);
            }
        }
    }
}

class Seconds {

    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);

        myRunnable myRunnable = new myRunnable();
        Thread thread = new Thread(myRunnable);
        thread.setDaemon(true);
        thread.start();

        System.out.println("You have 5 seconds to enter name");
        System.out.print("Enter Your Name: ");
        String name = input.nextLine();
        System.out.println("Name is: " + name);
    }
}
