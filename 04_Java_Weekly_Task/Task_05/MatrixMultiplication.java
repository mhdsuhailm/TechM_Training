package Task_05;

class MatrixMultiplicationThread extends Thread {
    private int[][] A, B, result;
    private int row, size;

    public MatrixMultiplicationThread(int[][] A, int[][] B, int[][] result, int row, int size) {
        this.A = A;
        this.B = B;
        this.result = result;
        this.row = row;
        this.size = size;
    }

    public void run() {
        for (int j = 0; j < size; j++) {
            for (int k = 0; k < size; k++) {
                result[row][j] += A[row][k] * B[k][j];
            }
        }
    }
}

public class MatrixMultiplication {
    public static void main(String[] args) throws InterruptedException {
        int[][] A = { {1, 2}, {3, 4} };
        int[][] B = { {5, 6}, {7, 8} };
        int size = A.length;
        int[][] result = new int[size][size];

        Thread[] threads = new Thread[size];

        for (int i = 0; i < size; i++) {
            threads[i] = new MatrixMultiplicationThread(A, B, result, i, size);
            threads[i].start();
        }

        for (int i = 0; i < size; i++) {
            threads[i].join();
        }

        System.out.println("Resultant Matrix:");
        for (int[] row : result) {
            System.out.println(java.util.Arrays.toString(row));
        }
    }
}
