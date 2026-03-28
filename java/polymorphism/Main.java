
abstract class Vehicle {

    void go() {
    }
;

}

class Car extends Vehicle {

    @Override
    void go() {
        System.out.println("inside car");
    }
}

class Bike extends Vehicle {

    @Override
    void go() {
        System.out.println("riding bike");
    }
}

class Boat extends Vehicle {

    @Override
    void go() {
        System.out.println("sailing boat");
    }
}

class Main {

    public static void main(String args[]) {
        Car car = new Car();
        Bike bike = new Bike();
        Boat boat = new Boat();

        Vehicle vehicles[] = {car, bike, boat};

        car.go();
        bike.go();
        boat.go();
        System.out.println("");

        for (Vehicle run : vehicles) {
            run.go();
        }
    }
}
