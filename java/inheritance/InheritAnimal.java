
class Organism {

    void print() {
        System.out.println("inside organism");
    }

}

class Plant extends Organism {

    void synthesize() {
        System.out.println("inside plant");
    }
}

class Animal extends Organism {

    boolean isAlive = true;

    void eat() {
        System.out.println("Animal can eat.");
    }
}

class Dog extends Animal {

    int lives = 1;

    void speak() {
        System.out.println("Dog says woof");
    }
}

class Cat extends Animal {

    int lives = 9;

    @Override
    void print() {
        System.out.println("inside Cat");
    }

    void speak() {
        System.out.println("Cat says meow");
    }

}

class InheritAnimal {

    public static void main(String[] args) {

        Dog d = new Dog();
        Cat c = new Cat();

        System.out.println(d.isAlive);
        // c.eat();
        // System.out.println(d.lives);
        // System.out.println(c.lives);
        // d.speak();
        // c.speak();
        d.print();
        c.print();
        d.print();

        Plant p = new Plant();
        p.synthesize();
        System.out.println(".()");
        System.out.println("");
    }
}
