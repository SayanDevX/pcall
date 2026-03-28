
class myRunnable implements Runnable {

    String name;

    myRunnable(String name) {
        this.name = name;
    }

    @Override
    public void run() {
        for (int i = 1; i <= 5; i++) {
            try {
                Thread.sleep(1000);
                System.out.println(name + ": " + i);
            } catch (InterruptedException e) {
                System.out.println("Thread was interrupted");
            }
        }
    }
}

public class MultiSeconds {

    public static void main(String[] args) {
        myRunnable myRunnable1 = new myRunnable("A");
        Thread thread1 = new Thread(myRunnable1);
        thread1.start();

        myRunnable myRunnable2 = new myRunnable("B");
        Thread thread2 = new Thread(myRunnable2);
        thread2.start();
    }
}
