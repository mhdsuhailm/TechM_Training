package Task_01;

import java.util.Arrays;

public class ArrayCopyRange {
    public static void main(String[] args) {
        int[] oArray = {10, 20, 30, 40, 50, 60, 70};

        int[] cArray = Arrays.copyOfRange(oArray, 2, 5);

        System.out.println("Original Array: " + Arrays.toString(oArray));
        System.out.println("Copied Range (index 2 to 5): " + Arrays.toString(cArray));
    }
}
