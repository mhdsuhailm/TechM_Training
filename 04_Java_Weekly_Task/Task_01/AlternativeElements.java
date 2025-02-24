package Task_01;

import java.util.Arrays;

public class AlternativeElements {
    public static void main(String[] args) {
        int[] arr = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int[] altArr = new int[(arr.length + 1) / 2];

        int index = 0;
        for (int i = 0; i < arr.length; i += 2) {
            altArr[index++] = arr[i];
        }

        System.out.println("Original Array: " + Arrays.toString(arr));
        System.out.println("Alternate Elements Array: " + Arrays.toString(altArr));
    }
}
