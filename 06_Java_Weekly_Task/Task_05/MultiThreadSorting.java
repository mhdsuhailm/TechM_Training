package Task_05;

import java.util.Arrays;

class SortThread extends Thread {
    private int[] arr;

    public SortThread(int[] arr) {
        this.arr = arr;
    }

    public void run() {
        Arrays.sort(arr);
    }

    public int[] getSortedArray() {
        return arr;
    }
}

public class MultiThreadSorting {
    public static void main(String[] args) throws InterruptedException {
        int[] arr1 = {5, 2, 9, 1, 3};
        int[] arr2 = {8, 4, 6, 7, 10};

        SortThread t1 = new SortThread(arr1);
        SortThread t2 = new SortThread(arr2);

        t1.start();
        t2.start();

        t1.join();
        t2.join();

        System.out.println("Sorted Array 1: " + Arrays.toString(t1.getSortedArray()));
        System.out.println("Sorted Array 2: " + Arrays.toString(t2.getSortedArray()));
    }
}

