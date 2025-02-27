package Task_07;


import java.util.LinkedList;
import java.util.Arrays;

public class InsertMultipleAtPosition {
    public static void main(String[] args) {
        LinkedList<String> fruits = new LinkedList<>(Arrays.asList("Apple", "Banana", "Grapes"));

        System.out.println("Before Insert: " + fruits);

        fruits.addAll(1, Arrays.asList("Orange", "Mango"));
        System.out.println("After Insert: " + fruits);
    }
}
