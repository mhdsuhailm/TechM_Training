package Task_07;

import java.util.LinkedList;

public class InsertAtEnd {
    public static void main(String[] args) {
        LinkedList<Character> alphabets = new LinkedList<>();
        alphabets.add('A');
        alphabets.add('B');
        alphabets.add('C');

        System.out.println("Before Insert: " + alphabets);

        alphabets.addLast('D');

        System.out.println("After Insert: " + alphabets);
    }
}
