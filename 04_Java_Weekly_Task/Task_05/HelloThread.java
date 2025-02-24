package Task_05;

class HelloThread extends Thread {
    public void run() {
        System.out.println("Hello, Java!");
    }

    public static void main(String[] args) {
        HelloThread thread = new HelloThread();
        thread.start();
    }
}
