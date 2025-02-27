package Task_07;

import java.util.LinkedList;

public class IterateLinkedList {
    public static void main(String[] args) {
        LinkedList<Integer> numbers = new LinkedList<>();
        numbers.add(10);
        numbers.add(20);
        numbers.add(30);

        System.out.println("LinkedList Elements:");
        for (int num : numbers) {
            System.out.println(num);
        }
    }
}
