package Task_07;

import java.util.ArrayList;
import java.util.Collections;

public class ShuffleArrayList {
    public static void main(String[] args) {
        ArrayList<Character> letters = new ArrayList<>();
        letters.add('A');
        letters.add('B');
        letters.add('C');
        letters.add('D');

        System.out.println("Before Shuffle: " + letters);

        Collections.shuffle(letters);
        System.out.println("After Shuffle: " + letters);
    }
}
