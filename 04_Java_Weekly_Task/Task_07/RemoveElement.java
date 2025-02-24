package Task_07;

import java.util.ArrayList;

public class RemoveElement {
    public static void main(String[] args) {
        ArrayList<Double> scores = new ArrayList<>();
        scores.add(85.5);
        scores.add(90.0);
        scores.add(78.3);
        scores.add(88.8);

        System.out.println("Before Removal: " + scores);

        scores.remove(2);

        System.out.println("After Removal: " + scores);
    }
}
