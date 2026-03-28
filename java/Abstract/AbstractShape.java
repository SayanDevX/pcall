
abstract class Shape {

    abstract double area();

    void show() {
        System.out.println("hello");
    }
}

class Rectangle extends Shape {

    double width;
    double height;

    Rectangle(double width, double height) {
        this.width = width;
        this.height = height;
    }

    @Override
    double area() {
        return width * height;
    }
}

class Circle extends Shape {

    double radius;

    Circle(double radius) {
        this.radius = radius;
    }

    @Override
    void show() {
        System.out.println("from circle");
    }

    @Override
    double area() {
        return Math.PI * radius * radius;
    }
}

class AbstractShape {

    public static void main(String[] args) {

        Rectangle rec = new Rectangle(12, 14);
        Circle cir = new Circle(4);

        System.out.println(rec.area());
        System.out.println(cir.area());
        display(rec);
        rec.show();
        cir.show();
    }

    static void display(Shape s) {
        System.out.println(s.area());
    }
}
