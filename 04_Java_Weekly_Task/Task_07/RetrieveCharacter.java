package Task_07;

import java.util.ArrayList;

public class RetrieveCharacter {
    public static void main(String[] args) {
        ArrayList<Character> letters = new ArrayList<>();
        letters.add('A');
        letters.add('B');
        letters.add('C');
        letters.add('D');

        int index = 1;
        char element = letters.get(index);
        System.out.println("Element at index " + index + ": " + element);
    }
}

