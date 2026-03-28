
class Concatenat {

    public static void main(String[] args) {
        String name = "Sayan";
        String title = "Biswas";
        String fullName = name + " " + title;
        System.out.println(fullName.length());

        for (int i = 0; i < fullName.length(); i++) {
            System.out.print(fullName.charAt(i));
        }
    }
}
