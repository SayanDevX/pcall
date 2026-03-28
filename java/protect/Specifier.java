
class Test {

    private int a = 6;

    void show() {
        System.out.println("inside test " + a);
    }
}

class Derive extends Test {

    void display(Test t) {
        t.show();
        System.out.println("inside derive ");
    }
}

class Specifier {

    public static void main(String[] args) {
        Test t1 = new Test();
        t1.show();
        Derive d1 = new Derive();
        d1.display(t1);
    }
}
