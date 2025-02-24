package Task_06;

import java.util.Arrays;

class ArrayComparator {
    public static <T> boolean areArraysEqual(T[] arr1, T[] arr2) {
        return Arrays.equals(arr1, arr2);
    }

    public static void main(String[] args) {
        Integer[] arr1 = {1, 2, 3, 4};
        Integer[] arr2 = {1, 2, 3, 4};
        Integer[] arr3 = {1, 2, 3, 5};
//        String[] arr4 = {'abc', 'bcd', 'cde', 'def'};

        System.out.println("Are arr1 and arr2 equal? " + areArraysEqual(arr1, arr2));
        System.out.println("Are arr1 and arr3 equal? " + areArraysEqual(arr1, arr3));
    }
}
