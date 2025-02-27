package Task_07;

import java.util.LinkedList;
import java.util.ListIterator;

public class ReverseIteration {
    public static void main(String[] args) {
        LinkedList<Character> letters = new LinkedList<>();
        letters.add('X');
        letters.add('Y');
        letters.add('Z');

        System.out.println("Reverse Order:");

        ListIterator<Character> iterator = letters.listIterator(letters.size());
        while (iterator.hasPrevious()) {
            System.out.println(iterator.previous());
        }
    }
}

