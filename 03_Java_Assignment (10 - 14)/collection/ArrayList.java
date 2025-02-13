package collection;

import java.util.List;

public class ArrayList {
    public static void main(String[] args) {
        List<Integer> list = new java.util.ArrayList<>();
        list.add(34);
        list.add(0,32);
        list.add(5);
        System.out.println(list);
        System.out.println(list.indexOf(5));

    }
}
