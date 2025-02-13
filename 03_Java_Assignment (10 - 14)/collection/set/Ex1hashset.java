package collection.set;

import java.util.*;
import java.util.stream.Collectors;

public class Ex1hashset {
    public static void main(String[] args) {
        HashSet<Integer> hs = new HashSet<>();
        hs.add(14);
        hs.add(21);
        hs.add(35);
        hs.add(49);
        hs.add(5);
        hs.add(6);
        hs.add(6);
        hs.add(7);
        Ex1hashset.setoperation(hs);

        LinkedHashSet<String> lhs = new LinkedHashSet<>();
        lhs.add("abcde");
        lhs.add("hello..!");
        lhs.add("hii guys");
        lhs.add("welcome");
        lhs.add("bye");
        lhs.add("how");
        lhs.add("are");
        lhs.add("you");
        Ex1hashset.setoperation(lhs);

        TreeSet<Double> ths = new TreeSet<>();
        ths.add(14.6);
        ths.add(21.5);
        ths.add(35.4);
        ths.add(49.6);
        ths.add(5.5);
        ths.add(6.6);
        ths.add(6.9);
        ths.add(7.0);
        Ex1hashset.setoperation(ths);

    }

    public static void setoperation(HashSet<Integer> hs) {

        System.out.println("HashSet Size: " + hs.size());
        System.out.println("Elements in HashSet: " + hs);
        System.out.print("Using iterator : ");

        Set<Integer> ans = hs.stream().filter(num -> num % 7 == 0).collect(Collectors.toSet());
        System.out.println("number divided by filter method" + ans);

        Iterator<Integer> iterator = hs.iterator();

        while (iterator.hasNext())
            System.out.print(iterator.next() + " ");
        System.out.println();

        System.out.print("Using enhanced for loop : ");
        for (Integer element : hs) {

            if (element % 7 == 0) {
                System.out.print(element + " ");
            }
        }
        hs.remove(7);
        System.out.println("\nHashSet after removing element : " + hs);
    }

    public static void setoperation(LinkedHashSet<String> lhs) {

        System.out.println("LinkedHashSet Size: " + lhs.size());
        System.out.println("Elements in LinkedHashSet: " + lhs);

        Set<String> ans = lhs.stream().filter(str -> str.length() >= 5).collect(Collectors.toSet());
        System.out.println("number divided by filter method" + ans);
        System.out.print("Using iterator : ");

        Iterator<String> iterator = lhs.iterator();

        while (iterator.hasNext())
            System.out.print(iterator.next() + " ");
        System.out.println();

        System.out.print("Using enhanced for loop : ");
        for (String element : lhs) {

            if (element.length() > 5) {
                System.out.print(element + " ");
            }
        }
        lhs.remove("you");
        System.out.println("\nHashSet after removing element : " + lhs);
    }

    public static void setoperation(TreeSet<Double> ths) {

        System.out.println("HashSet Size: " + ths.size());
        System.out.println("Elements in HashSet: " + ths);
        System.out.print("Using iterator : ");

        Set<Double> ans = ths.stream().filter(num -> num % 7 == 0).collect(Collectors.toSet());
        System.out.println("number divided by filter method" + ans);

        Iterator<Double> iterator = ths.iterator();

        while (iterator.hasNext())
            System.out.print(iterator.next() + " ");
        System.out.println();

        System.out.print("Using enhanced for loop : ");
        for (Double element : ths) {

            if (element % 7 == 0) {
                System.out.print(element + " ");
            }
        }
        ths.remove(7.0);
        System.out.println("\nHashSet after removing element : " + ths);

    }
}
