package Task_07;

import java.util.LinkedList;

public class InsertAtFront {
    public static void main(String[] args) {
        LinkedList<Integer> numbers = new LinkedList<>();
        numbers.add(20);
        numbers.add(30);
        numbers.add(40);

        System.out.println("Before Insert: " + numbers);

        numbers.addFirst(10);

        System.out.println("After Insert: " + numbers);
    }
}
