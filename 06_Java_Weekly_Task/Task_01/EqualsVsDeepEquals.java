package Task_01;

import java.util.Arrays;
import java.util.Objects;

public class EqualsVsDeepEquals {
    public static void main(String[] args) {
        String[] arr1 = {"Java", "Python"};
        String[] arr2 = {"Java", "Python"};
        String[] arr3 = arr1;

        System.out.println("Using equals():");
        System.out.println(Arrays.equals(arr1, arr2));
        System.out.println(arr1.equals(arr2));
        System.out.println(arr1.equals(arr3));

        System.out.println("\nUsing deepEquals():");
        System.out.println(Objects.deepEquals(arr1, arr2));
        System.out.println(Objects.deepEquals(arr1, arr3));
    }
}
