
class Human {

    String name;
    int age;
    double weight;

    Human(String name, int age, double weight) {
        this.name = name;
        this.age = age;
        this.weight = weight;
    }
}

public class HumanCheck {

    public static void main(String args[]) {
        Human hum = new Human("Sayan", 12, 45);
        System.out.println("Name is: " + hum.name);
        System.out.println("Age is: " + hum.age);
        System.out.println("Weight is: " + hum.weight + "kg");
    }
}
