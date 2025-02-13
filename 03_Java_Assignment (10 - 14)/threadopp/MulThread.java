package threadopp;

public class MulThread extends Thread {
        private StringBuilder sb;

        public MulThread(StringBuilder sb) {
            this.sb = sb;
        }

        @Override
        public void run() {
            // Appending to StringBuilder

            sb.append(Thread.currentThread().getName());
            System.out.println("Thread " + Thread.currentThread().getName() + ": " + sb);
        }

        public static void main(String[] args) {
            StringBuilder sb = new StringBuilder();
            MulThread t1=new MulThread(sb);
            MulThread t2=new MulThread(sb);
            MulThread t3=new MulThread(sb);

            t1.start();
            t2.start();
            t3.start();

        }
    }