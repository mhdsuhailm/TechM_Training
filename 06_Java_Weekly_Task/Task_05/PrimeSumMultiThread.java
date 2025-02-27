package Task_05;

class PrimeSumThread extends Thread {
    private int start, end, sum = 0;

    public PrimeSumThread(int start, int end) {
        this.start = start;
        this.end = end;
    }

    private boolean isPrime(int num) {
        if (num < 2) return false;
        for (int i = 2; i * i <= num; i++) {
            if (num % i == 0) return false;
        }
        return true;
    }

    public void run() {
        for (int i = start; i <= end; i++) {
            if (isPrime(i)) {
                sum += i;
            }
        }
    }

    public int getSum() {
        return sum;
    }
}

public class PrimeSumMultiThread {
    public static void main(String[] args) throws InterruptedException {
        int limit = 100;
        int mid = limit / 2;

        PrimeSumThread t1 = new PrimeSumThread(1, mid);
        PrimeSumThread t2 = new PrimeSumThread(mid + 1, limit);

        t1.start();
        t2.start();

        t1.join();
        t2.join();

        int totalSum = t1.getSum() + t2.getSum();
        System.out.println("Sum of prime numbers up to " + limit + " is: " + totalSum);
    }
}
