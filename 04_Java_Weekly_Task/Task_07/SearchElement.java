package Task_07;

import java.util.ArrayList;

public class SearchElement {
    public static void main(String[] args) {
        ArrayList<String> cities = new ArrayList<>();
        cities.add("New York");
        cities.add("London");
        cities.add("Paris");
        cities.add("Tokyo");

        String searchCity = "London";

        if (cities.contains(searchCity)) {
            System.out.println(searchCity + " is in the list.");
        } else {
            System.out.println(searchCity + " is not in the list.");
        }
    }
}

