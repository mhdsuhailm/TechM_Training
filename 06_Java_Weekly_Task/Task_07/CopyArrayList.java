package Task_07;

import java.util.ArrayList;
import java.util.Collections;

public class CopyArrayList {
    public static void main(String[] args) {
        ArrayList<String> fruits = new ArrayList<>();
        fruits.add("Apple");
        fruits.add("Banana");
        fruits.add("Cherry");

        ArrayList<String> copiedFruits = new ArrayList<>(fruits);

        System.out.println("Original List: " + fruits);
        System.out.println("Copied List: " + copiedFruits);
    }
}

