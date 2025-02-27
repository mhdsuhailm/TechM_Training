package Task_07;

import java.util.ArrayList;

public class InsertStudentName {
    public static void main(String[] args) {
        ArrayList<String> students = new ArrayList<>();
        students.add("Alice");
        students.add("Bob");
        students.add("Charlie");

        System.out.println("Before Insertion: " + students);

        students.add(0, "David");

        System.out.println("After Insertion: " + students);
    }
}
