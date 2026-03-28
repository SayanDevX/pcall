
class Compare {

    public static void main(String args[]) {
        String name1 = "Sayan2";
        String name2 = "Sayan2";

        if (name1.compareTo(name2) == 0) {
            System.out.println("Strings are equal.");
        } else if (name1.compareTo(name2) <= 0) {
            System.out.println("Second string is greater.");
        } else {
            System.out.println("first string is greater");
        }
    }
}
