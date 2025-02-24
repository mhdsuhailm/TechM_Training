package Task_07;

import java.util.LinkedList;

public class InsertFirstLast {
    public static void main(String[] args) {
        LinkedList<String> cities = new LinkedList<>();
        cities.add("Paris");
        cities.add("New York");
        cities.add("Tokyo");

        System.out.println("Before Insert: " + cities);

        cities.addFirst("London");
        cities.addLast("Dubai");

        System.out.println("After Insert: " + cities);
    }
}
