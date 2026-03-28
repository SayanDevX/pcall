
import java.util.Scanner;

abstract class Animal {

    abstract void speak();
}

class Dog extends Animal {

    @Override
    void speak() {
        System.out.println("dog says woof");
    }
}

class Cat extends Animal {

    @Override
    void speak() {
        System.out.println("cat goes meow");
    }
}

class Main {

    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter 1 for Dog and 2 for Cat: ");
        int choice = input.nextInt();

        Animal animal;

        if (choice == 1) {
            animal = new Dog();
            animal.speak();
        } else if (choice == 2) {
            animal = new Cat();
            animal.speak();
        }
    }
}
