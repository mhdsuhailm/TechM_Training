package Task_01;

import java.util.Arrays;
import java.util.*;

class Student {
    String name;
    int[] marks;
    int total;
    double average;

    public Student(String name, int[] marks) {
        this.name = name;
        this.marks = marks;
        this.total = Arrays.stream(marks).sum();
        this.average = (double) total / marks.length;
    }

    public String toString() {
        return "Name: " + name + ", Total: " + total + ", Average: " + average;
    }
}

public class StudentMarks {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of students: ");
        int n = sc.nextInt();
        sc.nextLine();

        List<Student> students = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            System.out.print("Enter student name: ");
            String name = sc.nextLine();

            System.out.print("Enter number of subjects: ");
            int subCount = sc.nextInt();
            int[] marks = new int[subCount];

            System.out.println("Enter marks:");
            for (int j = 0; j < subCount; j++) {
                marks[j] = sc.nextInt();
            }
            sc.nextLine();

            students.add(new Student(name, marks));
        }

        students.sort((s1, s2) -> Integer.compare(s2.total, s1.total));

        System.out.println("\nSorted Student List:");
        for (Student s : students) {
            System.out.println(s);
        }

        sc.close();
    }
}
