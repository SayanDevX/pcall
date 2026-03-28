
class Car {

    String name;
    String model;
    int year;
    double price;

    void start() {
        System.out.println("Car has started.");
    }

    void stop() {
        System.out.println("Car has stopped.");
    }
}

public class CheckCar {

    public static void main(String args[]) {
        Car myCar = new Car();
        myCar.name = "Toyota";
        myCar.price = 3000.00;
        System.out.println("Name of the car is: " + myCar.name);
        System.out.println("Price of the car is: " + myCar.price);
        myCar.start();
        myCar.stop();
    }
}
