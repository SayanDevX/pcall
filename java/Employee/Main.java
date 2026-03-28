
class Person {

    String name;
    String lastname;

    Person(String name, String lastname) {
        this.name = name;
        this.lastname = lastname;
    }

    String getFirstName() {
        return name;
    }

    String getLastName() {
        return lastname;
    }
}

class Employee extends Person {

    String empID;
    String jobTitle;

    Employee(String name, String lastname, String empID, String jobTitle) {
        super(name, lastname);
        this.empID = empID;
        this.jobTitle = jobTitle;
    }

    String getEmployeeId() {
        return empID;
    }

    @Override
    String getLastName() {
        return super.getLastName() + " (" + jobTitle + ")";
    }
}

class Main {

    public static void main(String[] args) {
        Employee emp = new Employee("Sayan", "Biswas", "EMP431", "Developer");

        System.out.println("First name: " + emp.getFirstName());
        System.out.println("Last name: " + emp.getLastName());
    }
}
