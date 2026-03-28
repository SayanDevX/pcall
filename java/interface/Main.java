
interface Prey {

    void flee();
}

interface Predator {

    void hunt();
}

class Rabbit implements Prey {

    @Override
    public void flee() {
        System.out.println("rabbit is running");
    }
}

class Hawk implements Predator {

    @Override
    public void hunt() {
        System.out.println("the hawk is hunting");
    }
}

class Fish implements Prey, Predator {

    @Override
    public void hunt() {
        System.out.println("fish is hunting bigger fish");
    }

    @Override
    public void flee() {
        System.out.println("running away from bigger fish");
    }
}

class Main {

    public static void main(String[] args) {

        Rabbit r = new Rabbit();
        Hawk h = new Hawk();
        Fish fish = new Fish();

        r.flee();
        h.hunt();
        fish.flee();
        fish.hunt();

    }
}
