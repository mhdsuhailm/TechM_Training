package Task_07;

import java.util.LinkedList;

public class InsertAtPosition {
    public static void main(String[] args) {
        LinkedList<Double> prices = new LinkedList<>();
        prices.add(12.99);
        prices.add(24.50);
        prices.add(19.75);

        System.out.println("Before Insert: " + prices);

        prices.add(1, 15.99);

        System.out.println("After Insert: " + prices);
    }
}

