package Task_07;

import java.util.LinkedList;

public class AppendLinkedList {
    public static void main(String[] args) {
        LinkedList<String> names = new LinkedList<>();
        names.add("Alice");
        names.add("Bob");

        System.out.println("Before Append: " + names);

        names.addLast("Charlie");
        System.out.println("After Append: " + names);
    }
}
